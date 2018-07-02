package board.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myBoardDao")
public class BoardDao {
	private final String namespace="myboard";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
}
