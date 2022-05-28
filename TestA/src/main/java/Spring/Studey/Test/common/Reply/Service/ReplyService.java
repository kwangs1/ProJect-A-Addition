package Spring.Studey.Test.common.Reply.Service;

import java.util.List;

import Spring.Studey.Test.common.Reply.VO.ReplyVO;

public interface ReplyService {

	List<ReplyVO> getReplyList(int bno) throws Exception;

}
