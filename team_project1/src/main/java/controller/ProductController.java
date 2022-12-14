package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

import action.product.ListManagerAction;
import action.product.ProductDeleteProAction;
import action.product.ProductDetailAction;
import action.product.ProductModifyAction;
import action.product.ProductModifyProAction;
import action.product.ProductOrderAction;
import action.product.ProductOrderFormAction;
import action.product.RacketListAction;

import action.product.SearchPriceAction;
import action.product.prodInsertProAction;
import action.review.RevDeleteProAction;
import action.review.RevDetailViewAction;
import action.review.RevInsertProAction;
import action.review.RevListAction;
import action.review.RevUpdateFormAction;
import action.review.RevUpdateProAction;
import action.review.WriteAction;
import vo.ActionForward;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.po")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		
		String requestURI=request.getRequestURI();
		
		String contextPath=request.getContextPath();
		
		String command=request.getRequestURI().substring(contextPath.length());
		
		Action action = null;
		ActionForward forward =null;
		
		System.out.println("command:"+command);//?????? ???????????? ???????????? ?????? ??????
		
	
		
		
		if(command.equals("/productForm.po")) {//??????????????? ???????????? 
			forward = new ActionForward("/product/product_form.jsp",false);//?????? ??? ????????? redirect
			
			
	   }else if(command.equals("/prodInsertPro.po"))  {
			action=new prodInsertProAction();
			
			try{
				forward=action.execute(request, response); 
			}catch(Exception e){
				e.printStackTrace(); 
			}
			  	
		
			
	   }else if(command.equals("/productListView.po"))  {//?????????????????? + ??????????????? ???????????? ??????
		   action=new RacketListAction();
		   
		   try{
			   forward=action.execute(request, response); 
		   }catch(Exception e){
			   e.printStackTrace(); 
		   }
		   
			/*
			 * }else if(command.equals("/accList.po")) {//Acc???????????? + ??????????????? ???????????? ?????? action=new
			 * AccListAction();
			 * 
			 * try{ forward=action.execute(request, response); }catch(Exception e){
			 * e.printStackTrace(); }
			 */
		   
	   }else if(command.equals("/productDetail.po"))  {//?????????????????? ?????? 
		   action=new ProductDetailAction();
		   
		   try{
			   forward=action.execute(request, response); 
		   }catch(Exception e){
			   e.printStackTrace(); 
		   }
		   
			
		}else if(command.equals("/productOrderform.po")) {//???????????????????????? ???????????? ???????????? ?????????????????? form
			 action=new ProductOrderFormAction();
			   
			   try{
				   forward=action.execute(request, response); 
			   }catch(Exception e){
				   e.printStackTrace(); 
			   }
		 
		}else if(command.equals("/ProductOrder.po")) {//???????????????????????? ???????????? ???????????? ?????????????????? form
			 action=new ProductOrderAction();
			   
			   try{
				   forward=action.execute(request, response); 
			   }catch(Exception e){
				   e.printStackTrace(); 
			   }

		   
		   
	   
	   }else if(command.equals("/productModifyForm.po")) {//????????????
		    action=new ProductModifyAction();
		    
		   try{
			   forward=action.execute(request, response); 
		   }catch(Exception e){
			   e.printStackTrace(); 
		   }
	     
		   
	   }else if(command.equals("/productModifyPro.po")) {//????????????
		    action=new ProductModifyProAction();
		    
		   try{
			   forward=action.execute(request, response); 
		   }catch(Exception e){
			   e.printStackTrace(); 
		   }
	     
	   }else if(command.equals("/productDeleteForm.po")){//???????????? ??????
			int prod_id = Integer.parseInt(request.getParameter("prod_id"));
			request.setAttribute("prod_id", prod_id);
			forward = new ActionForward("/product/product_delete.jsp",false);
		
	   
	   }else if(command.equals("/productDeletePro.po")){//???????????? ??????
			action = new ProductDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		
		
	    }else if(command.equals("/searchPriceForm.po"))  {//?????????????????? ????????? ?????????
		   action=new SearchPriceAction();
		   
		   try{
			   forward=action.execute(request, response); 
		   }catch(Exception e){
			   e.printStackTrace(); 
		   }	
		
		
		
	    }else if(command.equals("/productListManager.po")){
			action = new ListManagerAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		if(forward!=null) {
			if(forward.isRedirect()) { //true
				response.sendRedirect(forward.getPath()); //??????????????? ????????????.
			}else { //false : ???????????? - ???????????? ????????? ??????
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
		}
	
		}//if??? ???
		
		

		
		
		
		
		
		
		
	  }
	 }

