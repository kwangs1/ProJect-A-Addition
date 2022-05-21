package Spring.Studey.Test.Member.Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Spring.Studey.Test.Member.VO.MemberVO;

public interface MemberController {

	ModelAndView JoinMember(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	String login(MemberVO memberVO, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
