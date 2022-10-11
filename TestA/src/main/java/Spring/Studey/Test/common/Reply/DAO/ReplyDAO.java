package Spring.Studey.Test.common.Reply.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import Spring.Studey.Test.board.VO.BoardVO;
import Spring.Studey.Test.common.Reply.VO.ReplyVO;

public interface ReplyDAO {

	List<ReplyVO> getReplyList(int bno) throws DataAccessException;

	int addReply(ReplyVO replyVO) throws DataAccessException;

	int updateReply(ReplyVO replyVO) throws DataAccessException;

	int deleteReply(int rno) throws DataAccessException;

	int WriteReReply(ReplyVO replyVO) throws DataAccessException;

	int UpdateReReply(ReplyVO replyVO) throws DataAccessException;

	Double ratingAvg(int bno);

	void updateRating(ReplyVO reply);

}
