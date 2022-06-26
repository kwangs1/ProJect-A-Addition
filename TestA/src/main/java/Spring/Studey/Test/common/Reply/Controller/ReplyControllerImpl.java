package Spring.Studey.Test.common.Reply.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import Spring.Studey.Test.board.VO.BoardVO;
import Spring.Studey.Test.common.Reply.Service.ReplyService;
import Spring.Studey.Test.common.Reply.VO.ReplyVO;
import Spring.Studey.Test.common.base.BaseController;

@RestController

@RequestMapping(value = "/reply")
public class ReplyControllerImpl extends BaseController implements ReplyController {

	private static final Logger log = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private ReplyService replyService;

	// 댓글목록
	@Override
	@RequestMapping(value = "/getReplyList.do", method = RequestMethod.POST)
	public List<ReplyVO> getReplyList(@RequestParam("bno") int bno) throws Exception {
		return replyService.getReplyList(bno);
	}

	// 댓글 작성
	@Override
	@RequestMapping(value = "/addReply.do", method = RequestMethod.POST)
	public Map<String, Object> addReply(@RequestBody ReplyVO replyVO) throws Exception {
		Map<String, Object> result = new HashMap<>();

		try {
			replyService.addReply(replyVO);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}

		return result;
	}

	// 댓글 수정
	@Override
	@RequestMapping(value = "/updateReply.do", method = RequestMethod.POST)
	public Map<String, Object> updateReply(@RequestBody ReplyVO replyVO) throws Exception {
		Map<String, Object> result = new HashMap<>();

		try {
			replyService.updateReply(replyVO);
			result.put("status", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}

		return result;
	}
	
	//댓글 삭제
	@Override
	@RequestMapping(value="deleteReply.do" , method=RequestMethod.POST)
	public Map<String,Object>deleteReply(@RequestParam("rno")int rno)throws Exception{
		Map<String,Object>result = new HashMap<>();
		
		try {
			replyService.deleteReply(rno);
			result.put("status", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}
		return result;
	}
	
//-------------------------------------------------------------------	

	// 답글 작성
	@RequestMapping(value = "write_rereply.do", method = RequestMethod.POST)
	public Map<String,Object> write_rereply(@RequestBody ReplyVO replyVO)throws Exception {
		Map<String,Object>result = new HashMap<>();
		
		//댓글에 답글을 작성할 때 r_group를 댓글 r_group를 가져오기위해 변수를 선언하여 get,set을 하였음.
		//그리고 r_depth 즉 답글이라는 것을 알기 위해 r_depth를 1로 설정하여 답글이 작성되면 자동적으로 1이 데이터값에 들어가기위해 선언
		int rno = replyVO.getRno();		
		
		replyVO.setR_group(rno);		
		replyVO.setR_depth(1);
		try {
			replyService.WriteReReply(replyVO);	
			result.put("status", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}	
		return result;
	}
	
	//답글 수정
	@RequestMapping(value = "update_rereply.do", method = RequestMethod.POST)
	public Map<String,Object> update_rereply(@RequestBody ReplyVO replyVO)throws Exception {
		Map<String,Object>result = new HashMap<>();
		
		//답글 수정을 하기위해 r_group, r_depth를 get, set 하여 일반 댓글과 구분지어 수정이 되게 하였음
		int r_group = replyVO.getR_group();
		int r_depth = replyVO.getR_depth();
	
		replyVO.setR_depth(r_depth);
		replyVO.setR_group(r_group);
		
		try {
			replyService.UpdateReReply(replyVO);	
			result.put("status", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}	
		return result;
	}
}
