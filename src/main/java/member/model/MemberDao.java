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
	public Member getMember(String memid) {
		// TODO Auto-generated method stub
		System.out.println("memid : " + memid);
		Member bean = sqlSessionTemplate.selectOne(namespace+".getMember", memid);
		return bean;
	}

	// 회원정보 가져오기 members inner join mem_grade left outer join company 
	public Member getMemberJoinCG(String memid) {
		System.out.println("mem_id : " + memid);
		Member bean = sqlSessionTemplate.selectOne(namespace+".getMemberJoinCG", memid);
		return bean;
	}
	// 회원정보 수정
	public int updateMember(Member member) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateMember", member);
		return cnt;
	}
	public Member getMemberID(Member member) {
		// TODO Auto-generated method stub
		Member bean = null;
		bean = sqlSessionTemplate.selectOne(namespace+".getMemberID",member);
		return bean;
	}
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

	public int checkSignup(String userid) {
      System.out.println("userid : " + userid);
      int cnt = 0;
      cnt = sqlSessionTemplate.selectOne(namespace+".checkSignup", userid);
      return cnt;
   }
}
