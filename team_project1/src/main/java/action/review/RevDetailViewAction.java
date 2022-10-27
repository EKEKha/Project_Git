package action.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.review.RevDetailViewService;
import vo.ActionForward;
import vo.ReviewBean;

public class RevDetailViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int board_no=Integer.parseInt(request.getParameter("board_no"));
		
		RevDetailViewService revDetailViewService=new RevDetailViewService();
		ReviewBean article= revDetailViewService.getArticle(board_no);
		
	
		request.setAttribute("article", article);//el 언어사용할ㄸ'ㅐ 속성명..
		

		ActionForward forward = new ActionForward("review_board_detail.jsp", false);
		return forward;
	}

}
