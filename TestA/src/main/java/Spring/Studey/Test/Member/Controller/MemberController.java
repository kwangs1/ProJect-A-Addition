package Spring.Studey.Test.Member.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import Spring.Studey.Test.Member.VO.MemberVO;

public interface MemberController {

	ModelAndView JoinMember(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

}
