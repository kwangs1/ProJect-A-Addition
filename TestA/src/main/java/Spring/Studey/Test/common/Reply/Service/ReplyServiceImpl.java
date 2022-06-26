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
	
	//댓글리스트
	@Override
	public List<ReplyVO> getReplyList(int bno)throws Exception{
		return replyDAO.getReplyList(bno);
	}
	
	//댓글작성
	@Override
	public int addReply(ReplyVO replyVO)throws Exception{
		return replyDAO.addReply(replyVO);
	}
	
	//댓글수정
	@Override
	public int updateReply(ReplyVO replyVO)throws Exception{
		return replyDAO.updateReply(replyVO);
	}
	
	//댓글삭제
	@Override
	public int deleteReply(int rno)throws Exception{
		return replyDAO.deleteReply(rno);
	}
	
//----------------------------------
	
	//답글 등록
	@Override
	public int WriteReReply(ReplyVO replyVO)throws Exception{
		return replyDAO.WriteReReply(replyVO);
	}

	@Override
	public int UpdateReReply(ReplyVO replyVO)throws Exception{
		return replyDAO.updateReply(replyVO);
	}
}
