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
	
	//¥Ò±€∏ÆΩ∫∆Æ
	@Override
	public List<ReplyVO> getReplyList(int bno)throws Exception{
		return replyDAO.getReplyList(bno);
	}
	
	//¥Ò±€¿€º∫
	@Override
	public int addReply(ReplyVO replyVO)throws Exception{
		return replyDAO.addReply(replyVO);
	}
	
	//¥Ò±€ºˆ¡§
	@Override
	public int updateReply(ReplyVO replyVO)throws Exception{
		return replyDAO.updateReply(replyVO);
	}
	
	//¥Ò±€ªË¡¶
	@Override
	public int deleteReply(int rno)throws Exception{
		return replyDAO.deleteReply(rno);
	}


}
