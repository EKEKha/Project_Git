package action.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.Member.MemberViewService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberViewAction implements Action {

	public ActionForward execute(HttpServletRequest
	request, HttpServletResponse response)
		throws Exception {
			
	
		
		
		
		ActionForward forward = null;
			forward = new ActionForward();
			String viewId = request.getParameter("mem_id");
			MemberViewService memberViewService = new MemberViewService();
			MemberBean member = memberViewService.getMember(viewId);
			request.setAttribute("member",member);
			forward.setPath("member_info.jsp");
		
		return forward;
	}

}
