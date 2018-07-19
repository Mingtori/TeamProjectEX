// 게시글 답글쓰기
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
public class BoardReplyController {
	private static final String getPage="boardReplyForm";
	private static final String gotoPage="redirect:/notice.bd";
	private static final String command="reply.bd";
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			Board board,
			@RequestParam(value="pageNumber") int pageNumber,
			Model model){
		model.addAttribute("board", board);
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(
			Board board,
			@RequestParam(value="pageNumber") int pageNumber,
			HttpServletRequest request){
		board.setBoardip(request.getRemoteAddr());
		boardDao.insertReply(board);
		return gotoPage+"?pageNumber="+pageNumber +"&boardcateid=" + board.getBoardcateid();
	}
}
