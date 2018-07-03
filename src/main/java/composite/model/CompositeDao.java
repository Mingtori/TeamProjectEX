package composite.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.Member;

@Component("myCompostieDao")
public class CompositeDao {
	
	private final String namespace="mycomposite";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 회사 추가(회원가입)
	public int insertCompany(Member member) {
		// TODO Auto-generated method stub
		System.out.println("member.getComname():"+member.getComname());
		System.out.println("member.getComaddr():"+member.getComaddr());
		int cnt=-1;
		cnt = sqlSessionTemplate.insert(namespace+".insertCompany", member);
		System.out.println("composite insert cnt:"+cnt);
		return cnt;
	}
	
	// 회사 수정(회원정보수정)
	public int updateCompany(Member member) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateCompany", member);
		return cnt;
	}
	
	
}
