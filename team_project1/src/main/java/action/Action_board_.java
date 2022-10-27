package action;

import javax.servlet.http.*;

import vo.ActionForward_borad;

public interface Action_board_ {
	public ActionForward_borad execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
	
}
