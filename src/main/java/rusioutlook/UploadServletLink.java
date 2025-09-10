package rusioutlook;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class UploadServletLink
 */
@WebServlet("/UploadServletLink")
public class UploadServletLink extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServletLink() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		System.out.print("hello i am connected");
		String mediaType = request.getParameter("mediaType");
		String link = request.getParameter("link");
		String status="error";
		 try {
			try (Connection con = DBUtil.getConnection()) {
			     PreparedStatement ps = con.prepareStatement("INSERT INTO filelink (mediatype,link) VALUES (?,?)");
			     ps.setString(1, mediaType);
			     ps.setString(2, link);
			     ps.executeUpdate();
			 }

			 status = "success";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 response.sendRedirect("admin.jsp?status="+status);

	}

}
