// 게시글 삭제
package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;

@Controller
public class BoardDeleteController {

	private static final String gotoPage="redirect:/notice.bd";
	private static final String command="delete.bd";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam("boardid") int boardid,
			@RequestParam("boardcateid") String boardcateid,
			@RequestParam(value="prodid", required=false) int prodid,
			@RequestParam(value="flag", required=false) String flag,
			@RequestParam(value="review", required=false) String review,
			@RequestParam(value="qna", required=false) String qna
		){
		System.out.println("boardcateid:"+boardcateid);
		boardDao.deleteArticle(boardid);
		if(flag==null){
			return gotoPage+"?boardcateid="+boardcateid; 
		}else{
			if(qna != null){
				return "redirect:/detail.prd?pageNumber=1&qna=1&prodid=" + prodid;
			}
			if(review != null){
				return "redirect:/detail.prd?pageNumber=1&review=1&prodid=" + prodid;
			}
			return "redirect:/detail.prd?pageNumber=1&prodid=" + prodid;
		}
	}
}
