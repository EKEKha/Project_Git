package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.sql.DataSource;
import vo.MemberBean;
import static db.JdbcUtil.*;

public class MemberDAO {
	public static MemberDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	private MemberDAO() {
		
	}

	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
		
	}
	public int insertMember(MemberBean member) {
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,default)";
		int insertCount=0;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getMem_id());
			pstmt.setString(2, member.getMem_pwd());
			pstmt.setString(3, member.getMem_name());
			pstmt.setString(4, member.getMem_email());
			pstmt.setString(5, member.getMem_call());
			pstmt.setString(6, member.getMem_postcode());
			pstmt.setString(7, member.getMem_address1());
			pstmt.setString(8, member.getMem_address2());
			pstmt.setString(9, member.getMem_address3());
			
			
			insertCount=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertMember 에러:"+e);
		}finally {
			close(pstmt);
		}
		return insertCount;
	}

	
	public ArrayList<MemberBean> selectMemberList() {
		String sql = "SELECT * FROM MEMBER1";
		ArrayList<MemberBean>memberList=new ArrayList<MemberBean>();
		MemberBean mb = null;
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					mb=new MemberBean();
					mb.setMem_id(rs.getString("mem_id"));
					mb.setMem_pwd(rs.getString("mem_pwd"));
					mb.setMem_name(rs.getString("mem_name"));
					mb.setMem_email(rs.getString("mem_email"));
					mb.setMem_call(rs.getString("mem_call"));
					mb.setMem_postcode(rs.getString("mem_postcode"));
					mb.setMem_address1(rs.getString("mem_address1"));
					mb.setMem_address2(rs.getString("mem_address2"));
					mb.setMem_address2(rs.getString("mem_address3"));
					mb.setMem_grade(rs.getString("mem_grade"));
					memberList.add(mb);
				}while(rs.next());
			}
		} catch (Exception e) {
			System.out.println("getDeatiMember 에러: "+e);
		}finally {
			close(rs);
			close(pstmt);
		}
		return memberList;
	}

	public MemberBean selectMemberList(String id) {
		String sql = "SELECT * FROM MEMBER1 WHERE mem_id=?";
		MemberBean mb =null;
		try {
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mb=new MemberBean();
				mb.setMem_id(rs.getString("mem_id"));
				mb.setMem_pwd(rs.getString("mem_pwd"));
				mb.setMem_name(rs.getString("mem_name"));
				mb.setMem_email(rs.getString("mem_email"));
				mb.setMem_call(rs.getString("mem_call"));
				mb.setMem_postcode(rs.getString("mem_postcode"));
				mb.setMem_address1(rs.getString("mem_address1"));
				mb.setMem_address2(rs.getString("mem_address2"));
				mb.setMem_address2(rs.getString("mem_address3"));
				mb.setMem_grade(rs.getString("mem_grade"));
			}
		} catch (Exception e) {
			System.out.println("getDeatilMember 에러 : " + e);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return mb;
	}

	public int deleteMeber(String id) {
		String sql="DELETE MEMBER1 WHERE mem_id=?";
		int deleteCount = 0;
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteMember 에러 : " + e);
		}finally {
			close(pstmt);
		}
		
		return deleteCount;
	}

	

}
