package Spring.Studey.Test.common.Reply.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Spring.Studey.Test.board.VO.BoardVO;
import Spring.Studey.Test.common.Reply.VO.ReplyVO;

@Repository("reqlyDAO")
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession session;

	// ��� ����Ʈ
	@Override
	public List<ReplyVO> getReplyList(int bno) throws DataAccessException {
		return session.selectList("mapper.reply.getReplyList", bno);
	}

	// ��� �ۼ�
	@Override
	public int addReply(ReplyVO replyVO) throws DataAccessException {
		int result = session.insert("mapper.reply.addReply", replyVO);
		replyVO.setR_group(result+1);
		return result;
	}

	// ��� ����
	@Override
	public int updateReply(ReplyVO replyVO) throws DataAccessException {
		return session.update("mapper.reply.updateReply", replyVO);
	}

	// ��� ����
	@Override
	public int deleteReply(int rno) throws DataAccessException {
		return session.delete("mapper.reply.deleteReply", rno);
	}

//----------------------------------------------------

	// ��� �ۼ�

	@Override 
	public int WriteReReply(ReplyVO vo) { 	  
		return session.insert("mapper.reply.ReRePly_write", vo);	  
	}

}
