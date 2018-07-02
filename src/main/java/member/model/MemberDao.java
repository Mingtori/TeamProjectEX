package member.model;

import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMemberDao")
public class MemberDao {
	private final String namespace = "member.model.Member";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 회원가입
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".insertMember", member);
		return cnt;
	}

	public Member getMember(String mem_id) {
		// TODO Auto-generated method stub
		System.out.println("mem_id : " + mem_id);
		Member bean = sqlSessionTemplate.selectOne(namespace+".getMember", mem_id);
		return bean;
	}

	// members inner join mem_grade left outer join company
	public Member getMemberJoinCG(String mem_id) {
		System.out.println("mem_id : " + mem_id);
		Member bean = sqlSessionTemplate.selectOne(namespace+".getMemberJoinCG", mem_id);
		return bean;
	}

	public int updateMember(Member member) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateMember", member);
		return cnt;
	}

<<<<<<< HEAD
	public Member getMemberID(Member member) {
		// TODO Auto-generated method stub
		Member bean = null;
		bean = sqlSessionTemplate.selectOne(namespace+".getMemberID",member);
		return bean;
=======
	public String getMemberByPw(Member member) {
		String pw = null;
		pw = sqlSessionTemplate.selectOne(namespace+".getMemberByPw", member);
		return pw;
>>>>>>> branch 'master' of https://github.com/Mingtori/TeamProject.git
	}
}
