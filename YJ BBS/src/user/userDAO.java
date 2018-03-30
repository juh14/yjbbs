// 해당 접근에 성공한 데이터베이스의 객체를 이용해 실제로 회원가입을 이용한 함수작성

package user;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

public class userDAO {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;

	public userDAO() {

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

	public int login(String userID, String userPassword) {

		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); // SQL ? 에 아이디 넣음
			rs = pstmt.executeQuery();

			if (rs.next()) {

				if (rs.getString(1).equals(userPassword))

					return 1; // 로그인 성공

				else

					return 0; // 비밀번호 틀림

			}

			return -1; // 아이디 없음

		} catch (SQLException e) {

			e.printStackTrace();

		}

		finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -2; // 데이터베이스 오류

	}

	public int join(userDTO user) {

		String SQL = "INSERT INTO USER VALUES (?,?,?,?,false,?,?,?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserEmailHash());
			pstmt.setString(5, user.getUserNumber());
			pstmt.setString(6, user.getUserName());
			pstmt.setString(7, user.getUserNick());

			return pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return -1; // 회원가입 실패

	}

	// 삭제하는 메소드 - 훈
	public int delete(userDTO user) {
		String SQL = "DELETE FROM user WHERE userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 삭제 실패
	}
	
	// 수정하는 메소드 - 훈
	public int update(String userID, String userPassword, String userNick, String userEmail) {
		String SQL = "UPDATE user SET userPassword=?,userNick=?,userEmail=? WHERE userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행준비단계
			pstmt.setString(1, userPassword);
			pstmt.setString(2, userNick);
			pstmt.setString(3, userEmail);
			pstmt.setString(4, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스오류
	}

	public userDTO getUser(String userID) {
		String SQL = "SELECT * FROM user WHERE userID = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userDTO user = new userDTO();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserEmail(rs.getString(3));
				user.setUserEmailChecked(rs.getBoolean(4));
				user.setUserEmailHash(rs.getString(5));
				user.setUserNumber(rs.getString(6));
				user.setUserName(rs.getString(7));
				user.setUserNick(rs.getString(8));
				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 사용자가 현재 이메일 인증되어있는 확인
	public String getUserEmail(String userID) {

		String SQL = "SELECT userEmail FROM user WHERE userID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				return rs.getString(1); // 이메일 주소 반환

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return null; // 데이터베이스 오류

	}

	/* 이메일 중복 피하기 */
	public boolean getUserEmailChecked2(String useremail) {

		String SQL = "SELECT userEmailChecked FROM USER WHERE userEmail = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, useremail);

			rs = pstmt.executeQuery(); // 데이터를 조회할때 query

			while (rs.next()) {

				return rs.getBoolean(1); // 이메일 등록 여부 반환

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return false;

	}

	public String FindUserPassword(String userID) {

		String SQL = "SELECT userPassword FROM user WHERE userID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				return rs.getString(1); // 이메일 주소 반환

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return null; // 데이터베이스 오류

	}

	// 유저 이메일 인증 수행함수
	public boolean getUserEmailChecked(String userID) {

		String SQL = "SELECT userEmailChecked FROM USER WHERE userID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			rs = pstmt.executeQuery(); // 데이터를 조회할때 query

			while (rs.next()) {

				return rs.getBoolean(1); // 이메일 등록 여부 반환

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return false; // 데이터베이스 오류

	}

	public boolean setUserEmailChecked(String userID) {

		String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			pstmt.executeUpdate();

			return true; // 이메일 등록 설정 성공

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return false; // 이메일 등록 설정 실패

	}

}
