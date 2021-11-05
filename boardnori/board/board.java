package board;

public class board {
	private int boardID;
	private String boardTitle;
	private String userID;
	private String boardDate;
	private String boardContent;
	private int boardAble;

	public board() {
		
	}
	
	public board(int boardID, String boardTitle, String userID, String boardDate, String boardContent, int boardAble) {
		this.boardID = boardID;
		this.boardTitle = boardTitle;
		this.userID = userID;
		this.boardDate = boardDate;
		this.boardContent = boardContent;
		this.boardAble = boardAble;
	}

	public int getBoardID() {
		return boardID;
	}

	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardAble() {
		return boardAble;
	}

	public void setBoardAble(int boardAble) {
		this.boardAble = boardAble;
	}

}
