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
	
	// ȸ������
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".insertMember", member);
		return cnt;
	}
	
	// ȸ������ ��������
	public Member getMember(String mem_id) {
		// TODO Auto-generated method stub
		System.out.println("mem_id : " + mem_id);
		Member bean = sqlSessionTemplate.selectOne(namespace+".getMember", mem_id);
		return bean;
	}

	// ȸ������ �������� members inner join mem_grade left outer join company 
	public Member getMemberJoinCG(String mem_id) {
		System.out.println("mem_id : " + mem_id);
		Member bean = sqlSessionTemplate.selectOne(namespace+".getMemberJoinCG", mem_id);
		return bean;
	}
	// ȸ������ ����
	public int updateMember(Member member) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updateMember", member);
		return cnt;
	}
	// ���̵� ã��
	public Member getMemberID(Member member) {
		// TODO Auto-generated method stub
		Member bean = null;
		bean = sqlSessionTemplate.selectOne(namespace+".getMemberID",member);
		return bean;
	}
	// ��й�ȣ ã��
	public String getMemberByPw(Member member) {
		String pw = null;
		pw = sqlSessionTemplate.selectOne(namespace+".getMemberByPw", member);
		return pw;
	}
	
	// ȸ�����
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
