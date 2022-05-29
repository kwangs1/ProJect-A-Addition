package Spring.Studey.Test.common.Reply.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import Spring.Studey.Test.common.Reply.Service.ReplyService;
import Spring.Studey.Test.common.Reply.VO.ReplyVO;
import Spring.Studey.Test.common.base.BaseController;

@RestController
@RequestMapping(value="/reply")
public class ReplyControllerImpl extends BaseController implements ReplyController{
	
	private static final Logger log =  LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	//´ñ±Û¸ñ·Ï
	@RequestMapping(value="/getReplyList.do" , method=RequestMethod.POST)
	public List<ReplyVO> getReplyList(@RequestParam("bno")int bno)throws Exception{
		return replyService.getReplyList(bno);
	}
	
	//´ñ±Û ÀÛ¼º
	@RequestMapping(value="/addReply.do", method = RequestMethod.POST)
	public Map<String,Object> addReply(@RequestBody ReplyVO replyVO)throws Exception{
		Map<String,Object> result = new HashMap<>();
		
		try {
			replyService.addReply(replyVO);
			result.put("status", "OK");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}
		
		return result;
	}
	
	//´ñ±Û ¼öÁ¤
	@RequestMapping(value="/updateReply.do" , method=RequestMethod.POST)
	public Map<String,Object> updateReply(@RequestBody ReplyVO replyVO)throws Exception{
		Map<String,Object>result = new HashMap<>();
		
		try {
			replyService.updateReply(replyVO);
			result.put("status", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}
		
		return result;
	}
}
