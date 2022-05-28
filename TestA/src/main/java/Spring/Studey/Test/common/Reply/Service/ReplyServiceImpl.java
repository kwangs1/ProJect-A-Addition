package Spring.Studey.Test.common.Reply.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Spring.Studey.Test.common.Reply.DAO.ReplyDAO;
import Spring.Studey.Test.common.Reply.VO.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDAO replyDAO;
	
	//´ñ±Û¸®½ºÆ®
	@Override
	public List<ReplyVO> getReplyList(int bno)throws Exception{
		return replyDAO.getReplyList(bno);
	}
}
