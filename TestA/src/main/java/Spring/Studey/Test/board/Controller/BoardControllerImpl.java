package Spring.Studey.Test.board.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Spring.Studey.Test.board.Service.BoardService;
import Spring.Studey.Test.board.VO.BoardVO;
import Spring.Studey.Test.common.Like.VO.LikeVO;
import Spring.Studey.Test.common.Reply.VO.ReplyVO;
import Spring.Studey.Test.common.base.BaseController;

@Controller("boardController")
@RequestMapping(value="/board")
public class BoardControllerImpl extends BaseController implements BoardController{
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardVO boardVO;
	
	//글 목록
	@RequestMapping(value="list.do" , method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		List<Map<String,Object>>list =  boardService.list();

		mav.addObject("list",list);
		
		return mav;
	}
	
	//상세보기
	@RequestMapping(value = "detail.do" , method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("bno")int bno,@Param("id")String id,
			@ModelAttribute("board") BoardVO board,	
			@ModelAttribute("replyVO")ReplyVO replyVO, //댓글, 대댓글으 값들을 게시판 상세보기에서 가져오게 하기위해서
			HttpServletRequest request, HttpServletResponse response)throws Exception{
	
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		board = boardService.detail(bno);	
		
		//좋아요 체크
		LikeVO like = new LikeVO(); //likeVO 객체 선언

		//게시글 번호 및 아이디에 대한 정보를 가져온다. 좋아요를 눌렀는지 안눌렀는지 확인하기 위해
		like.setBno(bno);
		like.setId(id);

		log.info("id값 들어왔니?....."+id);
		
		mav.setViewName(viewName);
		mav.addObject("detail", board);

		mav.addObject("like",boardService.findLike(bno,id));
		mav.addObject("getLike",boardService.getLike(bno));
		return mav;
	}
	

}
