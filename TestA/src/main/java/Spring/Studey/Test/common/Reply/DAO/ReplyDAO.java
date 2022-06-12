package Spring.Studey.Test.common.Reply.DAO;

import java.util.List;

import org.springframework.dao.DataAccessException;

import Spring.Studey.Test.board.VO.BoardVO;
import Spring.Studey.Test.common.Reply.VO.ReplyVO;

public interface ReplyDAO {

	List<ReplyVO> getReplyList(int bno) throws DataAccessException;

	int addReply(ReplyVO replyVO) throws DataAccessException;

	int updateReply(ReplyVO replyVO) throws DataAccessException;

	int deleteReply(int rno) throws DataAccessException;

	int WriteReReply(ReplyVO vo);

	int Re_group(ReplyVO replyVO) throws DataAccessException;
}
