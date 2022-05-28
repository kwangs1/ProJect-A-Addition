package Spring.Studey.Test.common.Reply.Controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	@RequestMapping(value="/getReplyList.do" , method=RequestMethod.POST)
	public List<ReplyVO> getReplyList(@RequestParam("bno")int bno)throws Exception{
		return replyService.getReplyList(bno);
	}
}
