package svc.Member;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberIdFindService {
	//멤버변수
	//생성자
	//메서드
	
	//member_table안의 회원정보를 조회하여 리턴
	public MemberBean findId(String mem_email){
		//1.커넥션 풀에서 Connection객체 얻어와
		Connection con = getConnection();
		//2.싱글톤 패턴:UserDAO객체 생성
		MemberDAO memberDAO = MemberDAO.getInstance();
		//3.DB작업에 사용될 Connection객체를 UserDAO의 멤버변수로 삽입하여 DB 연결
		memberDAO.setConnection(con);
		
		/*----DAO의 해당 메서드를 호출하여 처리-------------------*/		
		MemberBean memberInfo = memberDAO.findId(mem_email);
		
		/*-(update,delete,insert)성공하면 commit 실패하면 rollback
		 * (select제외)----*/				
		
		//4.해제
		close(con);//Connection객체 해제		
		
		return memberInfo;
	}
}
