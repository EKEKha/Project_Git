package svc.tboard_svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.TBoardDAO;
import vo.BoardBean;

public class BoardModifyProService {



	public boolean modifyArticle(BoardBean article) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		TBoardDAO boardDAO = TBoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateArticle(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
