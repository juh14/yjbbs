package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;
/*import bbs.Exception;
import bbs.String;
*/

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;

	public BbsDAO() {

		try {

			String dbURL = "jdbc:mysql://localhost:3306/yjbbs";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	public String getDate() // 현재 서버의 시간 넣어주는 함수
	{
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행준비단계
			rs = pstmt.executeQuery();
			if (rs.next()) // 결과가있는경우 현재날짜 반환
			{
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ""; // 데이터베이스오류
	}

	public int getNext() //
	{
		String SQL = "SELECT bbsID from BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행준비단계
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫게시물경우
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스오류
	}

	public int CheckBbsNum() {
		String SQL = "SELECT * FROM BBS ORDER BY bbsID DESC LIMIT 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행준비단계
			rs = pstmt.executeQuery();
			if (rs.next())
				return rs.getInt(1); // 첫게시물경우
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스오류
	}

	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행준비단계
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, 0);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스오류
	}

	public ArrayList<Bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행준비단계
			pstmt.setInt(1, getNext() - ((pageNumber - 1) * 10));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsAnonymous(rs.getInt(7));
				if (bbs.getBbsAnonymous() == 0) {
					bbs.setUserID("Anonymous");
				}
				list.add(bbs);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list; // 데이터베이스오류
	}

	// 10페이지 단위 특정한페이지존재하는지 물어보는함수
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable =1 ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행준비단계
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs= pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false; // 데이터베이스오류
	}

	public Bbs getBbs(int bbsID) // 글을 불러오는 함수
	{
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행준비단계
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null; // 데이터베이스오류
	}

	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE  BBS SET bbsTitle=?, bbsContent =? WHERE bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행준비단계
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스오류
	}

	public int delete(int bbsID) {
		String SQL = "UPDATE  BBS SET bbsAvailable=0 WHERE bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행준비단계
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int setAnonymousUser(int bbsID) {
		String SQL = "UPDATE bbs SET bbsAnonymous=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 실패

	}

	public int unsetAnonymousUser(int bbsID) {
		String SQL = "UPDATE bbs SET bbsAnonymous=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;

	}

}
