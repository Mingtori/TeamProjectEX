// 게시글 수정
package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.Board;
import board.model.BoardDao;

@Controller
public class BoardUpdateController {
	private static final String getPage="boardUpdateForm";
	private static final String gotoPage="redirect:/detail.bd";
	private static final String command="update.bd";
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam("boardid") int boardid,
			@RequestParam("pageNumber") int pageNumber,
			Model model){
		Board board = boardDao.getArticle(boardid);
		model.addAttribute("board", board);
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(
			Board board,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam(value="flag", required=false) String flag,
			Model model){
		boardDao.updateArticle(board);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("boardid", board.getBoardid());
		if(flag == null){
			return gotoPage;
		}else{
			return "redirect:/detail.prd?pageNumber=1&prodid=" + board.getProdid();
		}
	}
}
