package Spring.Studey.Test.Member.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import Spring.Studey.Test.Member.DAO.MemberDAO;
import Spring.Studey.Test.Member.VO.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	//회원가입
	@Override
	public int JoinMember(MemberVO memberVO)throws Exception{
		return memberDAO.insertMember(memberVO);
	}
}
