package rusioutlook;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/playvideo")
public class VideoServlet extends HttpServlet {
    private static final String VIDEO_DIR = "C:/Users/steff/eclipse-workspace/rusioutlook/src/main/webapp/video"; // or get from config

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fileName = request.getParameter("file");
        System.out.print("file got it");
        // Security check
        if (fileName == null || fileName.contains("..")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid file");
            return;
        }
        String videoPath = getServletContext().getRealPath("/video");
        File videoFile = new File(videoPath, fileName);

        if (!videoFile.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        response.setContentType("video/mp4");
        response.setContentLengthLong(videoFile.length());

        try (BufferedInputStream in = new BufferedInputStream(new FileInputStream(videoFile));
             OutputStream out = response.getOutputStream()) {

            byte[] buffer = new byte[8192];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}