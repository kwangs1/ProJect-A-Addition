package Spring.Studey.Test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/secuTest" , method = RequestMethod.GET)
	public void secuTest() {
		String rawPassword = "choi123"; //���ڵ� �� �޼���
		String encdoePassword1; //���ڵ� �� �޼���
		String encdoePassword2; //�Ȱ��� ��й�ȣ �����͸� encode()�޼��带 ����� �� ������ ���ڵ� ���� �������� Ȯ���ϱ�����
		
		encdoePassword1 = passwordEncoder.encode(rawPassword);
		encdoePassword2 = passwordEncoder.encode(rawPassword);
		
		//���ڵ��� �н����� ���
        System.out.println("encdoePassword1 : " +encdoePassword1);
        System.out.println(" encdoePassword2 : " + encdoePassword2);
        
        String truePassowrd = "choi123";
        String falsePassword = "asdfjlasf";
        
        System.out.println("truePassword verify : " + passwordEncoder.matches(truePassowrd, encdoePassword1));
        System.out.println("falsePassword verify : " + passwordEncoder.matches(falsePassword, encdoePassword1));    
		
	}
	
}
