// 게시글 리스트(=게시판)
package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.Board;
import board.model.BoardDao;
import utility.Paging;

@Controller
public class BoardListController {
	private static final String getPage = "boardList";
	private static final String command = "/notice.bd";

	@Autowired
	private BoardDao boardDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doActionGet(HttpServletRequest request,
			@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "pageSize", required = false) String pageSize,
			@RequestParam(value = "boardcateid", required = false) String boardcateid,
			HttpSession session) {

		System.out.println("\n" + this.getClass() + " get 방식");
		System.out.println("boardcateid controller : " + boardcateid);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		map.put("boardcateid",boardcateid );
		int totalCount = boardDao.getTotalCount(map);
		System.out.println("totalCount : " + totalCount + ", ");
		String url = request.getContextPath() + this.command;
		System.out.println("url : " + url); // url : /ex/list.ab

		ModelAndView mav = new ModelAndView();
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, whatColumn, keyword, null, boardcateid);
		System.out.println("offset : " + pageInfo.getOffset() + ", ");
		System.out.println("limit : " + pageInfo.getLimit() + ", ");
		System.out.println("url : " + pageInfo.getUrl() + ", ");

		System.out.println("pageInfo.getPageNumber : " + pageInfo.getPageNumber() + ", ");

		List<Board> lists = boardDao.getBoardLists(pageInfo, map);

		System.out.println("lists.size() : " + lists.size());
		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalCount", totalCount);
		mav.addObject("boardcateid", boardcateid);
		
		mav.setViewName(getPage);

		return mav;

	}

}
