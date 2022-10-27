package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.LoginDAO;
import vo.Member;
public class LoginService {

	public Member getLoginMember(String mem_id, String mem_pwd) {
		// TODO Auto-generated method stub
		LoginDAO loginDAO = LoginDAO.getInstance();
		Connection con = getConnection();
		loginDAO.setConnection(con);
		Member loginMember = loginDAO.selectLoginMember(mem_id,mem_pwd);
		close(con);
		return loginMember;
	}
	
}








