package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myBoardDao")
public class BoardDao {
	private final String namespace = "myboard";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int getTotalCount(Map<String, String> map) {
		int totalCnt = 0;
		totalCnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCount", map);

		return totalCnt;
	}

	public List<Board> getBoardLists(Paging pageInfo, Map<String, String> map) {
		// TODO Auto-generated method stub
		List<Board> lists = new ArrayList<Board>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".getBoardLists", map, rowBounds);

		return lists;
	}

	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		int insertCnt = -1;
		System.out.println(board);
		insertCnt = sqlSessionTemplate.insert(namespace+".insertBoard", board);
		System.out.println("insertCnt:"+insertCnt);
		return insertCnt;
	}

	public Board getArticle(int boardid) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update(namespace+".readCountUpdate",boardid);
		Board board = sqlSessionTemplate.selectOne(namespace+".getArticle", boardid);
		return board;
	}

	public int updateArticle(Board board) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateArticle", board);
		return cnt;
	}

}
