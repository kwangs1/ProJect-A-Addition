package Spring.Studey.Test.Member.Controller;


import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Spring.Studey.Test.Member.Service.MemberService;
import Spring.Studey.Test.Member.VO.MemberVO;
import Spring.Studey.Test.common.base.BaseController;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController{
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
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
		
		String rawPw = ""; //인코딩 전 pw
		String encodePw = ""; //인코딩 후 pw
		
		rawPw = memberVO.getPw(); // pw데이터 얻음
		logger.info("비번 인코딩 전:"+rawPw);
		
		encodePw = pwEncoder.encode(rawPw); // pw 인코딩
		memberVO.setPw(encodePw); //인코딩 된 pw memberVO객체에 다시 저장
		logger.info("비번 인코딩 후:"+encodePw);
		
		int result =  memberService.JoinMember(memberVO);
		ModelAndView mav = new ModelAndView("redirect:/member/login.do");
		return mav;
	}
	
	//회원가입 이메일 인증
	@RequestMapping(value="/mailCheck.do" ,method=RequestMethod.POST)
	@ResponseBody
	public String mailCheck(String email)throws Exception{
		
		logger.info("이메일 데이터 전송확인");
		//logger.info("인증번호 :" + email);
		
		//인증번호(난수)생성
		Random random = new Random();
		int checkNum = random.nextInt(888888)+ 11111; //11111 ~ 99999 난수 얻기위해 
		logger.info("인증번호:" + checkNum);
		
		//이메일 보내기
		String setFrom= "cckwang2345@naver.com";//xml에 삽입한 자신의 계정
		String toMail = email; //수신받을 이메일
		String title = "회원가입 인증 메일";//이메일 제목
		String content = "홈페이지를 방문해주셔서 감사합니다."
				+"<br><br>"
				+"인증번호는" + checkNum + "입니다"
				+"<br>"
				+"해당 인증번호를 인증번호 확인란에 기입해주세요.";
        try {         
        	MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
		
		String num = Integer.toString(checkNum);
		return num;
	}

	//id 중복검사
	@RequestMapping(value="IdCheck.do" , method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChk(String id)throws Exception{
		/* logger.info("진입"); */
		
		int result = memberService.idCheck(id); // memberService.idCheck의 결과를 int형 변수 result에 저장
		if(result != 0) { //id가 존재하면 '1' , 존재하지 않으면 '0' 반환
			return "fail";
		}else {
			return "success";
		}
	}
	
	//login
	@Override
	@RequestMapping(value = "/login.do" , method = RequestMethod.POST)
	public String login(@ModelAttribute MemberVO memberVO, RedirectAttributes rttr,
				HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		
		MemberVO vo = memberService.login(memberVO);
		
		if(vo != null) { //일치하는 아이디 존재시
			rawPw = memberVO.getPw(); //사용자가 제출한 pw
			encodePw = vo.getPw(); //db에 저장한 인코딩된 pw
			
			if(true == pwEncoder.matches(rawPw, encodePw)) { //pw 일치여부 판단
				vo.setPw(""); //인코딩 된 pw 지움
				session.setAttribute("memberVO", vo); // session에 사용자의 정보 저장
				return "redirect:/main/main.do";
			}else {
				rttr.addFlashAttribute("result",0); 
				return "redirect:/member/login.do";
			}
		}else { //일치하는 아이디가 존재하지 않을시
			rttr.addFlashAttribute("result",0); 
			return "redirect:/member/login.do";
		}
  }
	
	//logout
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request)throws Exception{
		
        logger.info("logout메서드 진입");
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/main/main.do";
	}
	
	//info
	@RequestMapping(value="/MemberInfo.do" , method = RequestMethod.GET)
	public ModelAndView memberinfo(HttpServletRequest request)throws Exception{
		String viewName = (String)request.getAttribute("viewName");

		memberService.MemberInfo();
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		return mav;
	}
	
	//modify(비번 제외)Get
	@RequestMapping(value="/MemberModify.do" , method = RequestMethod.GET)
	public ModelAndView MemberModify(HttpServletRequest request)throws Exception{
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	//modify(비번 제외)post
	@RequestMapping(value="/MemberModify_info.do" , method = RequestMethod.POST)
	public ModelAndView MemberModify_info(HttpServletRequest request,@ModelAttribute MemberVO vo)throws Exception{
		HttpSession session = request.getSession();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/MemberInfo.do");
		session.setAttribute("memberVO", vo);
		
		memberService.MemberModify_info(vo);
		
		return mav;
	}

	//modify(비번 get)
	@RequestMapping(value="/MemberModify_pw.do" , method = RequestMethod.GET)
	public ModelAndView MemberModify_pw(HttpServletRequest request)throws Exception{
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//modify(비번 post)
	@RequestMapping(value="/MemberModify_info_pw.do" , method = RequestMethod.POST)
	public ModelAndView MemberModify_info_pw(@ModelAttribute MemberVO vo, HttpSession session)throws Exception{	
		logger.info("비밀번호 변경 ok");
		memberService.MemberModify_info_pw(vo);

		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/login.do");
		
		return mav;
	}

}
