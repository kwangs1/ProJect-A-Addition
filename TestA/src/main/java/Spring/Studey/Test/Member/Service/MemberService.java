package Spring.Studey.Test.Member.Service;

import java.util.Map;

import Spring.Studey.Test.Member.VO.MemberVO;

public interface MemberService {

	int JoinMember(MemberVO memberVO) throws Exception;

	int idCheck(String id) throws Exception;

	MemberVO login(MemberVO memberVO) throws Exception;

	void MemberModify(MemberVO memberVO) throws Exception;

	MemberVO MemberInfo() throws Exception;

	void MemberModify_info_pw(MemberVO memberVO) throws Exception;

}
