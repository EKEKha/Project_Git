package action.tboard_action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.tboard_svc.*;
import vo.ActionForward_borad;
import vo.BoardBean;

public class BoardWriteProAction implements action.Action_board_ {

	public ActionForward_borad execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward_borad forward=null;
		BoardBean boardBean = null;
		String realFolder="";
		String saveFolder="/boardUpload";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		boardBean = new BoardBean();
        boardBean.setMEM_ID(multi.getParameter("loginID"));
		boardBean.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
		boardBean.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
		boardBean.setBOARD_FILE(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));

		boardBean.setBOARD_PLACELA(multi.getParameter("BOARD_PLACELA")); //set으로 메서드값에 위도를 담음
		boardBean.setBOARD_PLACEMA(multi.getParameter("BOARD_PLACEMA")); //set으로 메서드값에 경도를 담음
		
   
		
		BoardWriteProService boardWriteProService = new BoardWriteProService();
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);

		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward_borad();
			forward.setRedirect(true);
			forward.setPath("boardList.bo");
		}

		return forward;
		
	}  	
	
}
