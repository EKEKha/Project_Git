package svc.user;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class UserUpdateService {
	//멤버변수
	//생성자
	//메서드
	
	//회원정보 업데이트
	public boolean userUpdate(MemberBean member){
		//1.커넥션 풀에서 Connection객체 얻어와
		Connection con = getConnection();
		//2.싱글톤 패턴:UserDAO객체 생성
		MemberDAO memberDAO = MemberDAO.getInstance();
		//3.DB작업에 사용될 Connection객체를 UserDAO의 멤버변수로 삽입하여 DB 연결
		memberDAO.setConnection(con);
		
		/*----DAO의 해당 메서드를 호출하여 처리-------------------*/		
		int updateUserCount = memberDAO.updateUser(member);
		
		boolean isUserUpdateResult = false;
		/*-(update,delete,insert)성공하면 commit 실패하면 rollback
		 * (select제외)----*/
		if(updateUserCount>0) {//회원수정에 성공하면
			isUserUpdateResult = true;
			commit(con);
		}else {
			rollback(con);
		}
		
		//4.해제
		close(con);//Connection객체 해제		
		
		return isUserUpdateResult;
	}
}