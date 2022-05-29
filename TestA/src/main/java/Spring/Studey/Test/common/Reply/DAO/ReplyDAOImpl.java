package Spring.Studey.Test.common.Reply.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Spring.Studey.Test.common.Reply.VO.ReplyVO;

@Repository("reqlyDAO")
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	private SqlSession session;

	//´ñ±Û ¸®½ºÆ®
	@Override
	public List<ReplyVO> getReplyList(int bno)throws DataAccessException{
		return session.selectList("mapper.reply.getReplyList",bno);
	}
	
	//´ñ±Û ÀÛ¼º
	@Override
	public int addReply(ReplyVO replyVO)throws DataAccessException{
		return session.insert("mapper.reply.addReply",replyVO);
	}
	
	//´ñ±Û ¼öÁ¤
	@Override
	public int updateReply(ReplyVO replyVO)throws DataAccessException{
		return session.update("mapper.reply.updateReply",replyVO);
	}
}
