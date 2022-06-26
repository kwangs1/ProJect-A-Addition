package Spring.Studey.Test.common.Reply.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Spring.Studey.Test.board.VO.BoardVO;
import Spring.Studey.Test.common.Reply.DAO.ReplyDAO;
import Spring.Studey.Test.common.Reply.VO.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDAO replyDAO;
	
	//��۸���Ʈ
	@Override
	public List<ReplyVO> getReplyList(int bno)throws Exception{
		return replyDAO.getReplyList(bno);
	}
	
	//����ۼ�
	@Override
	public int addReply(ReplyVO replyVO)throws Exception{
		return replyDAO.addReply(replyVO);
	}
	
	//��ۼ���
	@Override
	public int updateReply(ReplyVO replyVO)throws Exception{
		return replyDAO.updateReply(replyVO);
	}
	
	//��ۻ���
	@Override
	public int deleteReply(int rno)throws Exception{
		return replyDAO.deleteReply(rno);
	}
	
//----------------------------------
	
	//��� ���
	@Override
	public int WriteReReply(ReplyVO replyVO)throws Exception{
		return replyDAO.WriteReReply(replyVO);
	}

	@Override
	public int UpdateReReply(ReplyVO replyVO)throws Exception{
		return replyDAO.updateReply(replyVO);
	}
}
