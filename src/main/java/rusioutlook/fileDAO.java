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
}
