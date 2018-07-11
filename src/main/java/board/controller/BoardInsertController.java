// 게시글 쓰기
package board.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.Board;
import board.model.BoardDao;

@Controller
public class BoardInsertController {
	private static final String getPage = "boardInsertForm";
	private static final String gotoPage = "redirect:/notice.bd";
	private static final String command = "insert.bd";

	@Autowired
	private BoardDao boardDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(
			@RequestParam("boardcateid") String boardcateid,
			Model model) {
		model.addAttribute("boardcateid", boardcateid);
		return getPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionPost(
			Board board,
			HttpServletRequest request
			) {
		board.setBoardip(request.getRemoteAddr());
		System.out.println(board);
		boardDao.insertBoard(board);
		
		return gotoPage+"?boardcateid="+board.getBoardcateid();
	}
}
