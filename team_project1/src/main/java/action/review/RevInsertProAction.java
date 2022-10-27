package action.review;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;

import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.review.RevInsertProService;
import vo.ActionForward;
import vo.ReviewBean;

public class RevInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward=null;
		ReviewBean reviewBean=null;


		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		
		if(mem_id == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			
			out.println("location.href='main.jsp';");//상대경로로 (java코드이므로 EL이나 JSTL 사용못함)
			//out.println("location.href='./userLogin.usr';");
			
			out.println("</script>");
		
		}
		
		
		

		else {
		/* 그 전 단계에서 처리햇음
		 * //session 영역의 아이디를 얻어옴, 로그인 할 시에만 글 작성을 위해 HttpSession session =
		 * request.getSession();
		 * 
		 * String mem_id = (String)session.getAttribute("mem_id");
		 */
		
		String realFolder="";
		String saveFolder="/reviewUpload";
		int fileSize=10*1024*1024;
		/*
		 * int fileSize2=1*1024*1024;//썸네일용
		 */
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   
		String fileName=null;
		String origfileName=null;
		try {
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		/*
		 * MultipartRequest multi2=new MultipartRequest(request, realFolder, fileSize2,
		 * "UTF-8", new DefaultFileRenamePolicy());
		 */

	    /*업로드 할때 당시의 파일이름.(원래파일이름)
	    String oriFilename = multi.getOriginalFileName("file1");
	    String filename = multi.getFilesystemName("file1");
	    */
		
		String file=(String)multi.getFileNames().nextElement();//file타입 input태그의 name속성값들을 하나씩 가져옴
		
		fileName=multi.getFilesystemName(file); //서버에저장된이름 동일한이름등록시 ㄷ뒤에숫자..
		origfileName=multi.getOriginalFileName(file);
		  
		  ParameterBlock pb = new ParameterBlock(); //★★ 운영체제 : 윈도우 / \ , 리눅스나 맥 /
		  pb.add(realFolder + File.separator + fileName);//pb.add(imagePath+"/"+fileName);
		  
		  //"fileload"속성은 JAI가 제공하는 코덱을 사용 RenderedOp rOp=JAI.create("fileload",pb);
		  RenderedOp rOp=JAI.create("fileload",pb);
		  
		  //BufferedImage : 이미지를 보관하는 장소 //thumb : 이미지 버퍼를 생성하고 버퍼의 사이즈를 100x100로 설정
		  BufferedImage bi = rOp.getAsBufferedImage();//원본 BufferedImage thumb = new
		 
		  BufferedImage thumb = new BufferedImage(300,300,BufferedImage.TYPE_INT_RGB);
		  //thumb의 이미지 버퍼에 원본 이미지를 벙해진 버퍼 사이즈인 300로 맞추어 드로우한다. Graphics2D g =
		  Graphics2D g = thumb.createGraphics();
			g.drawImage(bi,0,0,300,300,null);
		  
		  //출력할 위치와 파일이름을 설정하고 썸네일 이미지를 생성 
			File thumbnailfile = new File(realFolder + File.separator + "sm_" + fileName);//저장하는 타입을 jpg로 설정.
		  ImageIO.write(thumb,"jpg",thumbnailfile);
		
	
		
		//폼형식에서 받아올수있는 값들, 세션에저장된 id, 별점, 내용, 파일,
		reviewBean=new ReviewBean();
		reviewBean.setMem_id(mem_id);
		reviewBean.setRev_content(multi.getParameter("rev_content"));
		reviewBean.setRev_score(multi.getParameter("rev_score"));
		reviewBean.setRev_fileName(fileName);
		reviewBean.setRev_origfileName(origfileName);
		
		}catch(Exception e) {
			System.out.println("파일 업로드 문제 발생 : "+e+fileName); };
		
		RevInsertProService revInsertProService=new RevInsertProService();
		boolean isWriteSuccess = revInsertProService.registReview(reviewBean);
			
			if(!isWriteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록실패')");
				out.println("history.back();");
				out.println("</script>");
			}
			else{
				forward = new ActionForward("rev_boardList.do", false);
			}

		}
		return forward;
	}

}
