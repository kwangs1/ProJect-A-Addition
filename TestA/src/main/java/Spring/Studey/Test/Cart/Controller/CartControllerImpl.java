package Spring.Studey.Test.Cart.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Spring.Studey.Test.Cart.Service.CartService;
import Spring.Studey.Test.Cart.VO.CartVO;
import Spring.Studey.Test.Member.VO.MemberVO;
import Spring.Studey.Test.board.VO.BoardVO;
import Spring.Studey.Test.common.base.BaseController;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController{
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private CartVO cartVO;
	
	//찜 목록 리스트
	@GetMapping("/CartList.do")
	public ModelAndView CartList(HttpServletRequest request)throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session =  request.getSession();
		
		//로그인 중인 아이디의 세션을 가져와 cartVO에 있는 id에 set함
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		String id = memberVO.getId();
		cartVO.setId(id);
		
		Map<String,List>cartMap = cartService.CartList(cartVO);
		//장바구니 목록 화면에서 상품 주문 시 사용하기 위한 장바구니 목록을 세션에 저장
		session.setAttribute("cartMap", cartMap);
		
		return mav;
	}
	
	//찜 목록 추가
	@PostMapping("/InCart.do")
	public @ResponseBody String InCart(@RequestParam("bno")int bno, HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("memberVO");
		String id = memberVO.getId();
		cartVO.setId(id);
		
		//찜 목록 추가 전에 해당 게시글에 대해 추가했는지 확인
		cartVO.setBno(bno);
		cartVO.setId(id);
		boolean isAreadyExisted = cartService.findCartGoods(cartVO);
		logger.info("isAreadyExisted:" + isAreadyExisted);
		if(isAreadyExisted == true) {
			return "already_existed";
		}else {
			cartService.InCart(cartVO);
			return "add_success";
		}
		
	}
	
	//찜 목록 제거
	@PostMapping("/DeleteCart.do")
	public ModelAndView DeleteCart(@RequestParam("cno")int cno)throws Exception{
		ModelAndView mav = new ModelAndView();
		cartService.DeleteCart(cno);
		mav.setViewName("redirect:/cart/CartList.do");
		return mav;
	}
}
