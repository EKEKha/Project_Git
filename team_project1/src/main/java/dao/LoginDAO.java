package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import vo.Member;
import static db.JdbcUtil.*;

public class LoginDAO {
	
	private static LoginDAO loginDAO;
	private Connection con;
	
	private LoginDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static LoginDAO getInstance(){
		if(loginDAO == null){
			loginDAO = new LoginDAO();
		}
		return loginDAO;
	}
	
	public void setConnection(Connection con){
		this.con = con;
	}
	
	public Member selectLoginMember(String id, String passwd) {
		// TODO Auto-generated method stub
		Member loginMember = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("SELECT * FROM member WHERE mem_id = ? AND mem_pwd = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			if(rs.next()){
				loginMember = new Member();
				loginMember.setMem_id(rs.getString("mem_id"));
				loginMember.setMem_pwd(rs.getString("mem_pwd"));
				loginMember.setMem_name(rs.getString("mem_name"));
				loginMember.setMem_email(rs.getString("mem_email"));
				loginMember.setMem_call(rs.getString("mem_call"));
				loginMember.setMem_postcode(rs.getString("mem_postcode"));
				loginMember.setMem_address1(rs.getString("mem_address1"));
				loginMember.setMem_address2(rs.getString("mem_address2"));
				loginMember.setMem_address2(rs.getString("mem_address3"));
				loginMember.setMem_grade(rs.getString("mem_grade"));
				
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			try {
				close(rs);
				close(pstmt);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return loginMember;
	}
	
}




