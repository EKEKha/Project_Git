package action.Member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.Member.MemberUpdateService;
import util.SHA256;
import vo.ActionForward;
import vo.MemberBean;


public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String mem_id = request.getParameter("mem_id");
		/*
		 * String mem_name = request.getParameter("mem_name"); String mem_email =
		 * request.getParameter("mem_email"); String mem_call =
		 * request.getParameter("mem_call"); String mem_postcode =
		 * request.getParameter("mem_postcode"); String mem_address1 =
		 * request.getParameter("mem_address1"); String mem_address2 =
		 * request.getParameter("mem_address2"); String mem_address3 =
		 * request.getParameter("mem_address3");
		 */
		String mem_grade = request.getParameter("mem_grade");
		int mem_point = Integer.parseInt(request.getParameter("mem_point"));
		
		//기본값으로 채워진
		MemberBean member = new MemberBean();		
		
		//파라미터로 전송된 값들로 다시 채움
		/*----------------------------------------------------*/
		
		member.setMem_id(mem_id);
		
		/*
		 * member.setMem_name(mem_name); member.setMem_email(mem_email);
		 * member.setMem_call(mem_call); member.setMem_postcode(mem_postcode);
		 * member.setMem_address1(mem_address1); member.setMem_address2(mem_address2);
		 * member.setMem_address3(mem_address3);
		 */
		member.setMem_grade(mem_grade);
		member.setMem_point(mem_point);
		MemberUpdateService memberUpdateService = new MemberUpdateService();
		boolean isMemberUpdateSuccess = memberUpdateService.memberUpdate(member);		
		
		if(isMemberUpdateSuccess == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원정보 수정에 실패했습니다. 다시 시도해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			
			
			forward = new ActionForward("userOrderMoney.od", false);//디스패치 방식으로 포워딩
		}
		return forward;
	}

}
