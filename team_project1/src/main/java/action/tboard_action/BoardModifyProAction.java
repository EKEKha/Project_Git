package action.tboard_action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.tboard_svc.*;
import vo.ActionForward_borad;
import vo.BoardBean;

public class BoardModifyProAction implements action.Action_board_ {

	public ActionForward_borad execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		//본인이 아니면 수정버튼 나오지 않음 
		ActionForward_borad forward = null;
		boolean isModifySuccess = false;
		int board_num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		BoardBean article=new BoardBean();
		BoardModifyProService boardModifyProService = new BoardModifyProService();


		    
	        article.setBOARD_PLACELA(request.getParameter("BOARD_PLACELA"));
	        article.setBOARD_PLACEMA(request.getParameter("BOARD_PLACEMA"));
			article.setBOARD_NUM(board_num);
			article.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
			article.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT")); 
			
			
			isModifySuccess = boardModifyProService.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward_borad();
				forward.setRedirect(true);
				forward.setPath("boardDetail.bo?board_num="+article.getBOARD_NUM()); 
			}

	

		return forward;
	}

}
