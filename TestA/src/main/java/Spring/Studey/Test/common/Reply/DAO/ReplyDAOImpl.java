package Spring.Studey.Test.common.Reply.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Spring.Studey.Test.common.Reply.VO.ReplyVO;

@Repository("reqlyDAO")
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession session;

	// 댓글 리스트
	@Override
	public List<ReplyVO> getReplyList(int bno) throws DataAccessException {
		return session.selectList("mapper.reply.getReplyList", bno);
	}

	// 댓글 작성
	@Override
	public int addReply(ReplyVO replyVO) throws DataAccessException {
		int result = session.insert("mapper.reply.addReply", replyVO);
		return result;
	}

	// 댓글 수정
	@Override
	public int updateReply(ReplyVO replyVO) throws DataAccessException {
		return session.update("mapper.reply.updateReply", replyVO);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int rno) throws DataAccessException {
		return session.delete("mapper.reply.deleteReply", rno);
	}
	
	@Override
	public int Re_group(ReplyVO replyVO)throws DataAccessException{
		
		int check_update =  session.update("mapper.reply.Re_group",replyVO);
		replyVO.setR_group(check_update);
		
		return check_update;
	}

//----------------------------------------------------

	// 답글 작성

	@Override 
	public int WriteReReply(ReplyVO replyVO) { 	  
		int result = session.insert("mapper.reply.ReRePly_write", replyVO);	
		
		return result;
	}
}
