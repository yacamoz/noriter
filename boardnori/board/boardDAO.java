package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class boardDAO {
	private Connection con;
	private Statement st;
//	private PreparedStatement pstmt;
	private ResultSet rs;

	public boardDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/bbs?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true",
					"root", "1234");
			st = con.createStatement();
		} catch (Exception e) {
			System.out.println("데이버테이스 연결 오류: " + e.getMessage());
		}
	}

	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int getNext() {
		String SQL = "select boardID from board order by boardID DESC";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int write(String boardTitle, String userID, String boardContent) {
		String SQL = "INSERT INTO board values (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<board> getlist(int pageNumber) {
		String SQL = "select * from board where boardAble = 1 order by boardID DESC limit ?,10";
		ArrayList<board> blist = new ArrayList<board>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int boardID = rs.getInt("boardID");
				String boardTitle = rs.getString("boardTitle");
				String userID = rs.getString("userID");
				String boardDate = rs.getString("boardDate");
				String boardContent = rs.getString("boardContent");
				int boardAble = rs.getInt("boardAble");
				board board = new board(boardID, boardTitle, userID, boardDate, boardContent, boardAble);
				blist.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blist;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "select * from board where boardAble = 1 order by boardID DESC limit ?,10";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public board getBoard(int boardID) {
		String SQL = "select * from board where boardID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int boardID2 = rs.getInt("boardID");
				String boardTitle = rs.getString("boardTitle");
				String userID = rs.getString("userID");
				String boardDate = rs.getString("boardDate");
				String boardContent = rs.getString("boardContent");
				int boardAble = rs.getInt("boardAble");
				board board = new board(boardID2, boardTitle, userID, boardDate, boardContent, boardAble);
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<board> AllBoard() {
		String SQL = "select * from board where boardAble = 1";
		ArrayList<board> ablist = new ArrayList<board>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int boardID2 = rs.getInt("boardID");
				String boardTitle = rs.getString("boardTitle");
				String userID = rs.getString("userID");
				String boardDate = rs.getString("boardDate");
				String boardContent = rs.getString("boardContent");
				int boardAble = rs.getInt("boardAble");
				board board = new board(boardID2, boardTitle, userID, boardDate, boardContent, boardAble);
				ablist.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ablist;
	}
	
	public int updateTitle(String boardTitle, int boardID) {
		String SQL = "update board set boardTitle = ? where boardID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, boardTitle);
			pstmt.setInt(2, boardID);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateContent(String boardContent, int boardID) {
		String SQL = "update board set boardContent = ? where boardID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, boardContent);
			pstmt.setInt(2, boardID);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int Delete(int boardID) {
		String SQL = "update board set boardAble = 0 where boardID = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
