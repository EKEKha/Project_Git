package action.tboard_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.tboard_svc.*;
import vo.ActionForward_borad;
import vo.BoardBean;

public class BoardModifyFormAction implements action.Action_board_ {
	
	 public ActionForward_borad execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward_borad forward = new ActionForward_borad();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			BoardDetailService boardDetailService
			= new BoardDetailService();	
		   	BoardBean article =boardDetailService.getArticle(board_num);
		   	request.setAttribute("article", article);
	   		forward.setPath("/board/board_modify.jsp");
	   		return forward;
	   		
	 }
	 
}
