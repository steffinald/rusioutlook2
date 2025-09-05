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
 * Servlet implementation class contactServlet
 */
@WebServlet("/contact")
public class contactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contactServlet() {
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
		
		
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String state = request.getParameter("state");
		String district = request.getParameter("dist");
		String address = request.getParameter("address");
		String message = request.getParameter("message");
		
		String status = "error";
		
		try {
			try (Connection con = DBUtil.getConnection()) {
			    PreparedStatement ps = con.prepareStatement("INSERT INTO message (name,mobile,state,district,address,message) VALUES (?,?,?,?,?,?)");
			    ps.setString(1, name);
			    ps.setString(2, mobile);
			    ps.setString(3, state);
			    ps.setString(4, district);
			    ps.setString(5, address);
			    ps.setString(6, message);
			    ps.executeUpdate();
			}
			status = "success";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("hello it is an error");
			e.printStackTrace();
		}

        response.sendRedirect("index.jsp?status="+status);
		
		
	}

}
