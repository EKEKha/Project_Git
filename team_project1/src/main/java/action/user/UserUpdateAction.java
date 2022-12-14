package action.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.user.UserUpdateService;
import util.SHA256;
import vo.ActionForward;
import vo.MemberBean;

public class UserUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session=request.getSession();
		String mem_id=(String)session.getAttribute("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		String mem_name = request.getParameter("mem_name");
		String mem_email = request.getParameter("mem_email");
		String mem_call = request.getParameter("mem_call");
		String mem_postcode = request.getParameter("mem_postcode");
		String mem_address1 = request.getParameter("mem_address1");
		String mem_address2 = request.getParameter("mem_address2");
		String mem_address3 = request.getParameter("mem_address3");

		
		//기본값으로 채워진
		MemberBean member = new MemberBean();		
		
		//파라미터로 전송된 값들로 다시 채움
		/*----------------------------------------------------*/
		
		member.setMem_id(mem_id);
		member.setMem_pwd(SHA256.encodeSHA256(mem_pwd));
		member.setMem_name(mem_name);
		member.setMem_email(mem_email);
		member.setMem_call(mem_call);
		member.setMem_postcode(mem_postcode);
		member.setMem_address1(mem_address1);
		member.setMem_address2(mem_address2);
		member.setMem_address3(mem_address3);
	
		UserUpdateService userUpdateService = new UserUpdateService();
		boolean isMemberUpdateSuccess = userUpdateService.userUpdate(member);
		
		if(isMemberUpdateSuccess == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원정보 수정에 실패했습니다. 다시 시도해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
		
			//★★다시 session영역에 같은 속성이름인 u_name에 수정한 값으로 덮어씌움(예:홍길동 -> 홍길순)
			session.setAttribute("mem_name", mem_name);//파라미터로 전송된 수정한 이름
			session.setAttribute("mem_email", mem_email);//파라미터로 전송된 수정한 이메일		

			forward = new ActionForward("userView.me?mem_id="+mem_id, false);//디스패치 방식으로 포워딩
		}
		return forward;
	}

}
