package rusioutlook;


import java.sql.*;
import java.util.*;

public class fileDAO {
    public static List<String> getImageFiles() throws Exception {
        List<String> listimage = new ArrayList<>();
        Connection con = DBUtil.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT filename FROM files where mediatype='image';");
        while (rs.next()) {
        	listimage.add(rs.getString("filename"));
        }
        rs.close();
        st.close();
        con.close();
        return listimage;
    }
    
    public static List<String> getVideoFiles() throws Exception {
        List<String> listvideo = new ArrayList<>();
        Connection con = DBUtil.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT filename FROM files where mediatype='video';");
        while (rs.next()) {
        	listvideo.add(rs.getString("filename"));
        }
        rs.close();
        st.close();
        con.close();
        return listvideo;
    }
    
    public static List<Detial> getMessageDetial() throws Exception{
    	List<Detial> listmessage = new ArrayList<>();
    	Connection con = DBUtil.getConnection();
    	String query = "SELECT * FROM message";
    	PreparedStatement ps = con.prepareStatement(query);
    	ResultSet rs = ps.executeQuery();
    	while(rs.next()) {
    		String date = rs.getString("date");
    		int id = rs.getInt("id");
    		String name = rs.getString("name");
    		String mobile = rs.getString("mobile");
    		String state = rs.getString("state");
    		String district = rs.getString("district");
    		String address = rs.getString("address");
    		String message = rs.getString("message");
    		
    		listmessage.add(new Detial(date,id,name,mobile,state,district,address,message));
    		
    	}
    	rs.close();
        ps.close();
        con.close();

        return listmessage;
    }
    
    public static List<String> getImageFileslink() throws Exception {
        List<String> listimage = new ArrayList<>();
        Connection con = DBUtil.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT link FROM filelink where mediatype='image';");
        while (rs.next()) {
        	listimage.add(rs.getString("link"));
        }
        rs.close();
        st.close();
        con.close();
        return listimage;
    }
    
    public static List<String> getVideoFileslink() throws Exception {
        List<String> listvideo = new ArrayList<>();
        Connection con = DBUtil.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT link FROM filelink where mediatype='video';");
        while (rs.next()) {
        	listvideo.add(rs.getString("link"));
        }
        rs.close();
        st.close();
        con.close();
        return listvideo;
    }
}
