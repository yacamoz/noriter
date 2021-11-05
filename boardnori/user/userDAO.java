package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class userDAO {
//	private ArrayList<MemberVO> dtos;
	private Connection con;
	private Statement st;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ArrayList<User> userlist = new ArrayList<>();
	
	public userDAO() {
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbs?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true","root","1234");
			st = con.createStatement();
		}
		catch(Exception e)
		{
			System.out.println("데이버테이스 연결 오류: "+e.getMessage());
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID=?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //login success
				}
				else {
					return 0; //no password
				}
			}
			return -1; //no id
		} catch(Exception e)
		{
			System.out.println("데이버테이스 연결 오류: "+e.getMessage());
		}
		return -2;
	}
	public void signUp(String userID, String userPassword, String userName, String userGender, String userEmail) {
		String SQL="insert into user(userID,userPassword,userName,userGender,userEmail) "
				+ "values(?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			pstmt.setString(4, userGender);
			pstmt.setString(5, userEmail);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("데이터베이스 연결 오류: "+e.getMessage());
		}
	}
}