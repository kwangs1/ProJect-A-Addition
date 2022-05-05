package Spring.Studey.Test.Member.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Spring.Studey.Test.Member.Service.MemberService;
import Spring.Studey.Test.Member.VO.MemberVO;
import Spring.Studey.Test.common.base.BaseController;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	//회원가입GET
	@RequestMapping(value="/joinForm.do",method= RequestMethod.GET)
	public ModelAndView joinMember(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//회원가입POST
	@Override
	@RequestMapping(value="/joinForm.do",method=RequestMethod.POST)
	public ModelAndView JoinMember(@ModelAttribute("memberVO")MemberVO memberVO,
				HttpServletRequest request,HttpServletResponse response)throws Exception{
		int result = 0;
		result = memberService.JoinMember(memberVO);
		ModelAndView mav = new ModelAndView("redirect:/main/main.do");
		return mav;
	}
}
