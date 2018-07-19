// 게시글 쓰기
package board.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
			HttpSession session,
			HttpServletResponse response,
			Model model) throws IOException {
		if(session.getAttribute("loginfo") == null){
			session.setAttribute("destination", "redirect:/"+command+"?boardcateid="+boardcateid);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('로그인 후 이용해주세요.')");
			writer.println("location.href='login.me'");
			writer.println("</script>");
			writer.flush();
		}
		model.addAttribute("boardcateid", boardcateid);
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost(
			Board board,
			@RequestParam(value="prodname", required=false) String prodname,
			HttpServletRequest request
			) {
		ModelAndView mv = new ModelAndView();
		board.setBoardip(request.getRemoteAddr());
		if(board.getBoardcateid().equals("p03")){//후기
			board.setBoardsubject("["+ prodname +"] 관람 후기");
			mv.setViewName("redirect:/detail.prd?prodid="+board.getProdid()+"&boardcateid=p03&pageNumber=1&review=1");
		}else if(board.getBoardcateid().equals("p02")){// 문의
			board.setBoardsubject("["+ prodname +"] 문의사항");
			mv.setViewName("redirect:/detail.prd?prodid="+board.getProdid()+"&boardcateid=p02&pageNumber=1&qna=1");
		}else if(board.getBoardcateid().equals("p01")){// 공지
			board.setBoardsubject("["+ prodname +"] 공지사항");
			mv.setViewName("redirect:/detail.prd?prodid="+board.getProdid()+"&boardcateid=p01&pageNumber=1");
		}else{
			mv.setViewName(gotoPage+"?boardcateid="+board.getBoardcateid());
		}
		boardDao.insertBoard(board);
		return mv;
	}
}
