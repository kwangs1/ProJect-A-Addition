package Spring.Studey.Test.common.Reply.Controller;

import java.util.List;
import java.util.Map;

import Spring.Studey.Test.common.Reply.VO.ReplyVO;

public interface ReplyController {

	List<ReplyVO> getReplyList(int bno) throws Exception;

	Map<String, Object> addReply(ReplyVO replyVO) throws Exception;

	Map<String, Object> updateReply(ReplyVO replyVO) throws Exception;

	Map<String, Object> deleteReply(int rno) throws Exception;

}
