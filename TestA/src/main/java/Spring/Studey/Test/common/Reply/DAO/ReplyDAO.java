package Spring.Studey.Test.common.Reply.DAO;

import java.util.List;

import org.springframework.dao.DataAccessException;

import Spring.Studey.Test.common.Reply.VO.ReplyVO;

public interface ReplyDAO {

	List<ReplyVO> getReplyList(int bno) throws DataAccessException;

}