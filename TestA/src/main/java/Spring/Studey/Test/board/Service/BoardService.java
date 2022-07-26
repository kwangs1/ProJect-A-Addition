package Spring.Studey.Test.board.Service;

import java.util.List;
import java.util.Map;

import Spring.Studey.Test.board.VO.BoardVO;

public interface BoardService {

	List<Map<String, Object>> list() throws Exception;

	BoardVO detail(int bno) throws Exception;

	void UpdateReplyCount(int bno) throws Exception;

}
