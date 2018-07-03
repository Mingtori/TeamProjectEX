package member.model;

import java.util.List;
import java.util.Map;

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
	
	// 회원정보 가져오기
	public Member getMember(String mem_id) {
		// TODO Auto-generated method stub
		System.out.println("mem_id : " + mem_id);
		Member bean = sqlSessionTemplate.selectOne(namespace+".getMember", mem_id);
		return bean;
	}

	// 회원정보 가져오기 members inner join mem_grade left outer join company 
	public Member getMemberJoinCG(String mem_id) {
		System.out.println("mem_id : " + mem_id);
		Member bean = sqlSessionTemplate.selectOne(namespace+".getMemberJoinCG", mem_id);
		return bean;
	}
	// 회원정보 수정
	public int updateMember(Member member) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateMember", member);
		return cnt;
	}
	// 아이디 찾기
	public Member getMemberID(Member member) {
		// TODO Auto-generated method stub
		Member bean = null;
		bean = sqlSessionTemplate.selectOne(namespace+".getMemberID",member);
		return bean;
	}
	// 비밀번호 찾기
	public String getMemberByPw(Member member) {
		String pw = null;
		pw = sqlSessionTemplate.selectOne(namespace+".getMemberByPw", member);
		return pw;
	}
	
	// 회원목록
	public List<Member> getMemberList(Map<String,String> map) {
		List<Member> list = null;
		list = sqlSessionTemplate.selectList(namespace+".getMemberList", map);
		return list;
	}

	public int updatePermit(String memid) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updatePermit", memid);
		return cnt;
	}

	public int deleteMember(String memid) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".deleteMember", memid);
		return cnt;
	}
}
