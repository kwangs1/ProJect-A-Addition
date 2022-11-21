package Spring.Studey.Test.board.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Spring.Studey.Test.board.Service.BoardService;
import Spring.Studey.Test.board.VO.BoardVO;
import Spring.Studey.Test.common.Like.Service.LikeService;
import Spring.Studey.Test.common.Like.VO.LikeVO;
import Spring.Studey.Test.common.Reply.Service.ReplyService;
import Spring.Studey.Test.common.Reply.VO.ReplyVO;
import Spring.Studey.Test.common.base.BaseController;

@Controller("boardController")
@RequestMapping(value="/board")
public class BoardControllerImpl extends BaseController implements BoardController{
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	@Autowired
	private LikeService likeService;
	@Autowired
	private ReplyService replyService;

	
	//�� ���
	@RequestMapping(value="list.do" , method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request)throws Exception{
		
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		List<Map<String,Object>>list =  boardService.list();

		mav.addObject("list",list);
		
		return mav;
	}
	
	//�󼼺���
	@RequestMapping(value = "detail.do" , method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("bno")int bno, String id,
			@ModelAttribute("board") BoardVO board, 
			@ModelAttribute("replyVO")ReplyVO replyVO,
			HttpServletRequest request)throws Exception{	
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		

		//�Խñ� ��ȣ �� ���̵� ���� ������ �����´�. ���ƿ並 �������� �ȴ������� Ȯ���ϱ� ����
		LikeVO like = new LikeVO();
		
		like.setBno(bno);
		like.setId(id);
		like.setLike_type(1);
		
		mav.setViewName(viewName);
		mav.addObject("detail", boardService.detail(bno));
		mav.addObject("ratingAvg", replyService.ratingAvg(bno));
		
		//���ƿ�
		mav.addObject("like", likeService.findLike(bno,id));
		mav.addObject("getLike",likeService.getLike(bno,1));
		
		return mav;
	}
	
	//�Խñ� �ۼ� GET
	@GetMapping("register.do")
	public ModelAndView register(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	//�Խñ� �ۼ� POST
	@PostMapping("register.do")
	public ModelAndView register(BoardVO board) {
		boardService.register(board);		
		ModelAndView mav = new ModelAndView("redirect:/board/list.do");
		return mav;
	}

}
