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
			@RequestParam("boardcateid") String boardcateid
			){
		System.out.println("boardcateid:"+boardcateid);
		boardDao.deleteArticle(boardid);
		return gotoPage+"?boardcateid="+boardcateid;
	}
}
