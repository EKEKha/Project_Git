package action.tboard_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.tboard_svc.*;
import vo.ActionForward_borad;
import vo.BoardBean;

 public class BoardDetailAction implements action.Action_board_ {
	 
	 public ActionForward_borad execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean article = boardDetailService.getArticle(board_num);
		ActionForward_borad forward = new ActionForward_borad();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/board/board_view.jsp");
   		return forward;

	 }
	 
}
