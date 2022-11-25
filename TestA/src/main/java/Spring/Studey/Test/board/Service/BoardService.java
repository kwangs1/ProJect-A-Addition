package Spring.Studey.Test.board.Service;

import java.util.List;
import java.util.Map;

import Spring.Studey.Test.Member.VO.MemberVO;
import Spring.Studey.Test.board.VO.BoardVO;
import Spring.Studey.Test.common.Like.VO.LikeVO;

public interface BoardService {

	List<Map<String, Object>> list() throws Exception;

	BoardVO detail(int bno) throws Exception;

	void UpdateReplyCount(int bno) throws Exception;

	void register(BoardVO board);

	List<Map<String, Object>> NoticeList() throws Exception;

	List<Map<String, Object>> QnAList() throws Exception;

	List<Map<String, Object>> NomalList() throws Exception;
}
