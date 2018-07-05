// 게시글 리스트(=게시판)
package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.Board;
import board.model.BoardDao;

@Controller
public class BoardReviewController {
	private static final String getPage="reviewList";
	private static final String command="review.bd";
	@Autowired
	private BoardDao boardDao;
	public String doActionGet(
			@RequestParam(value="boardcateid") String boardcateid,
			Model model){
		Map<String, String> map = new HashMap<String, String>();
		map.put("boardcateid", boardcateid);
		List<Board> lists = boardDao.getBoardLists(null,map);
		model.addAttribute("reviewlist",lists);
		return getPage;
	}
}
