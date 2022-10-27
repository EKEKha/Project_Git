package action.tboard_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.tboard_svc.*;
import vo.ActionForward_borad;
import vo.BoardBean;

public class BoardReplyFormAction implements action.Action_board_ {
	
	 public ActionForward_borad execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	ActionForward_borad forward = new ActionForward_borad();
	   		String nowPage = request.getParameter("page");
	   		int board_num=Integer.parseInt(request.getParameter("board_num")); //해당하는 글의 borad_num값을 받아서 borad_num에 담음
	   		   		
	   		BoardDetailService boardDetailService = new BoardDetailService();
	   		BoardBean article=boardDetailService.getArticle(board_num);	
	   		request.setAttribute("article", article);
	   		request.setAttribute("page", nowPage);
	   		forward.setPath("/board/board_reply.jsp");
	   		return forward;
	   		
	}
	 
}
