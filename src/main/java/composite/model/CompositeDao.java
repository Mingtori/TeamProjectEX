package composite.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.Member;

@Component("myCompostieDao")
public class CompositeDao {
	
	private final String namespace="mycomposite";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertCompany(Member member) {
		// TODO Auto-generated method stub
		System.out.println("member.getComname():"+member.getComname());
		System.out.println("member.getComaddr():"+member.getComaddr());
		int cnt=-1;
		cnt = sqlSessionTemplate.insert(namespace+".insertCompany", member);
		System.out.println("composite insert cnt:"+cnt);
		return cnt;
	}

	public int updateCompany(Member member) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateCompany", member);
		return cnt;
	}
	
	
}
