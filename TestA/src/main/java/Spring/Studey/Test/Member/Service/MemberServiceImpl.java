package Spring.Studey.Test.Member.Service;

import java.util.Map;

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
	
	//id중복검사
	@Override
	public int idCheck(String id)throws Exception{
		return memberDAO.idCheck(id);
	}
	
	//login
	@Override
	public MemberVO login(MemberVO memberVO)throws Exception{
		return memberDAO.login(memberVO);
	}
	
	//info
	@Override
	public MemberVO MemberInfo()throws Exception{
		return memberDAO.MemberInfo();
	}
	
	//modify
	@Override
	public void MemberModify(MemberVO memberVO)throws Exception{
		 memberDAO.MemberModify(memberVO);
	}
	//modify(비번)
	@Override
	public void MemberModify_info_pw(MemberVO memberVO)throws Exception{
		 memberDAO.MemberModify_info_pw(memberVO);
	}
}
