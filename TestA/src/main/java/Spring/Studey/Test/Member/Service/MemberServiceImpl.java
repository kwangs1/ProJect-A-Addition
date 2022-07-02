package Spring.Studey.Test.Member.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import Spring.Studey.Test.Member.Controller.MemberController;
import Spring.Studey.Test.Member.DAO.MemberDAO;
import Spring.Studey.Test.Member.VO.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberDAO memberDAO;
	
	
	//ȸ������
	@Override
	public int JoinMember(MemberVO memberVO)throws Exception{
		return memberDAO.insertMember(memberVO);
	}
	
	//id�ߺ��˻�
	@Override
	public int idCheck(String id)throws Exception{
		return memberDAO.idCheck(id);
	}
	
	//login
	@Override
	public MemberVO login(MemberVO memberVO)throws Exception{
		return memberDAO.login(memberVO);
	}
	
	//detail
	@Override
	public MemberVO MemberInfo()throws Exception{
		return memberDAO.MemberInfo();
	}
	
	//modify
	@Override
	public void MemberModify_info(MemberVO memberVO)throws Exception{
		memberDAO.MemberModify_info(memberVO);
	}
	//modify(���)
	@Override
	public void MemberModify_info_pw(MemberVO memberVO)throws Exception{
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String rawPw = memberVO.getPw(); // pw������ ����
		logger.info("��� ���� ��:" + rawPw);
		
		String encodePw = encoder.encode(rawPw); // pw ���ڵ�
		memberVO.setPw(encodePw); //���ڵ� �� pw memberVO��ü�� �ٽ� ����
		logger.info("��� ���� ��:" + encodePw);

		memberDAO.MemberModify_info_pw(memberVO);
	}

}
