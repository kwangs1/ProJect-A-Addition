package Spring.Studey.Test.board.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import Spring.Studey.Test.Member.VO.MemberVO;
import Spring.Studey.Test.board.VO.BoardVO;
import Spring.Studey.Test.common.Like.VO.LikeVO;

public interface BoardDAO {

	List<Map<String, Object>> list()throws DataAccessException;

	BoardVO detail(int bno) throws DataAccessException;
	
	void UpdateReplyCount(int bno) throws DataAccessException;

	void register(BoardVO board);

	List<Map<String, Object>> NoticeList() throws DataAccessException;

	List<Map<String, Object>> QnAList() throws DataAccessException;

	List<Map<String, Object>> NomalList() throws DataAccessException;

}
