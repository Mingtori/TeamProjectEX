// 게시글 상세보기
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
public class BoardDetailController {
	private static final String getPage = "boardDetailView";
	private static final String command = "detail.bd";

	@Autowired
	private BoardDao boardDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(
			@RequestParam("boardid") int boardid,
			@RequestParam("pageNumber") int pageNumber,
			Model model
			){
		Board boardDetail = boardDao.getArticle(boardid);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("boardDetail", boardDetail);
		return getPage;
	}
}
