package rusioutlook;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;

import org.apache.catalina.connector.ClientAbortException;

import com.backblaze.b2.client.B2StorageClient;
import com.backblaze.b2.client.contentHandlers.B2ContentMemoryWriter;
import com.backblaze.b2.client.structures.B2DownloadByNameRequest;

@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
    private static final String BUCKET_NAME = "rusioutlook-bucket";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fileName = request.getParameter("file");

        if (fileName == null || fileName.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing file parameter");
            return;
        }

        try {
            // Get B2 client
            B2StorageClient client = B2ClientUtil.getClient();

            // Build download request
            B2DownloadByNameRequest downloadRequest = B2DownloadByNameRequest
                    .builder(BUCKET_NAME, fileName)
                    .build();

            // Download file into memory
            B2ContentMemoryWriter sink = B2ContentMemoryWriter.build();
            client.downloadByName(downloadRequest, sink);

            // Get file as bytes
            byte[] fileBytes = sink.getBytes();
            
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"myfile.txt\"");
            response.flushBuffer();	

            // Set response headers
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            response.setContentLength(fileBytes.length);

            // Write file safely
            try (OutputStream out = response.getOutputStream()) {
                out.write(fileBytes);
                out.flush();
            }

        } catch (ClientAbortException cae) {
            // Browser cancelled download -> safe to ignore
            System.out.println("Client aborted download for file: " + fileName);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Error while downloading file: " + e.getMessage());
        }
    }
}
