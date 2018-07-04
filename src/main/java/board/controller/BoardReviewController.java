// 게시글 리스트(=게시판)
package board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;

@Controller
public class BoardReviewController {
	private static final String getPage="reviewList";
	private static final String command="review.bd";
	@Autowired
	private BoardDao boardDao;
	public String doActionGet(
			@RequestParam(value="boardcateid") String boardcateid){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardcateid", boardcateid);
		boardDao.getBoardLists(null,map);
		
		return getPage;
	}
}
