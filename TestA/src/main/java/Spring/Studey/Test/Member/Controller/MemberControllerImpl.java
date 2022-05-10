package Spring.Studey.Test.Member.Controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	private MemberVO memberVO;
	@Qualifier
	private JavaMailSender mailSender;
	
	//ȸ������GET
	@RequestMapping(value="/joinForm.do",method= RequestMethod.GET)
	public ModelAndView joinMember(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//ȸ������POST
	@Override
	@RequestMapping(value="/joinForm.do",method=RequestMethod.POST)
	public ModelAndView JoinMember(@ModelAttribute("memberVO")MemberVO memberVO,
				HttpServletRequest request,HttpServletResponse response)throws Exception{
		int result = 0;
		result = memberService.JoinMember(memberVO);
		ModelAndView mav = new ModelAndView("redirect:/main/main.do");
		return mav;
	}
	
	//ȸ������ �̸��� ����
	@RequestMapping(value="/mailCheck.do" ,method=RequestMethod.POST)
	@ResponseBody
	public String mailCheck(String email)throws Exception{
		
		logger.info("�̸��� ������ ����Ȯ��");
		logger.info("������ȣ :" + email);
		
		//������ȣ(����)����
		Random random = new Random();
		int checkNum = random.nextInt(888888)+ 11111; //11111 ~ 99999 ���� ������� 
		logger.info("������ȣ:" + checkNum);
		
		//�̸��� ������
		String setFrom= "cckwang2345@naver.com";//xml�� ������ �ڽ��� ����
		String toMail = email; //���Ź��� �̸���
		String title = "ȸ������ ���� ����";//�̸��� ����
		String content = "Ȩ�������� �湮���ּż� �����մϴ�."
				+"<br><br>"
				+"������ȣ��" + checkNum + "�Դϴ�"
				+"<br>"
				+"�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �������ּ���.";
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
}
