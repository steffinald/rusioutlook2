package rusioutlook;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.backblaze.b2.client.B2StorageClient;
import com.backblaze.b2.client.structures.B2UploadFileRequest;
import com.backblaze.b2.client.contentSources.B2ByteArrayContentSource;

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    private static final String BUCKET_ID = "7b11bbfa484db0e898880210"; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    		String status = "error";
    		
    		response.setContentType("text/plain");
    		response.getWriter().println("Upload started...");
    		
        try {
            // Get uploaded file
        	String mediaType = request.getParameter("mediaType"); 
            Part filePart = request.getPart("file");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            byte[] fileBytes = filePart.getInputStream().readAllBytes();

            // Initialize Backblaze client
            B2StorageClient client = B2ClientUtil.getClient();

            // Create Content Source
            B2ByteArrayContentSource source = (B2ByteArrayContentSource) B2ByteArrayContentSource.build(fileBytes);

            // Create Upload Request
            B2UploadFileRequest requestUpload = B2UploadFileRequest
                    .builder(BUCKET_ID, fileName, "b2/x-auto", source)
                    .build();

            // Upload file (kept private in bucket)
            client.uploadSmallFile(requestUpload);
            
            // Save filename in DB
            try (Connection con = DBUtil.getConnection()) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO files (mediatype,filename) VALUES (?,?)");
                ps.setString(1, mediaType);
                ps.setString(2, fileName);
                ps.executeUpdate();
            }

            status = "success";
            
            System.out.println("B2 ID: " + System.getenv("B2_APPLICATION_KEY_ID"));
            System.out.println("B2 Bucket: " + System.getenv("B2_BUCKET_NAME"));

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
        response.sendRedirect("admin.jsp?status="+status);
    }
}
