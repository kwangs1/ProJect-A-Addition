package Spring.Studey.Test.common.Reply.DAO;

import java.util.List;
import java.util.Map;

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

	// 댓글 리스트
	@Override
	public List<ReplyVO> getReplyList(int bno) throws DataAccessException {
		return session.selectList("mapper.reply.getReplyList", bno);
	}

	// 댓글 작성
	@Override
	public int addReply(ReplyVO replyVO) throws DataAccessException {
		
		
		
		int result = session.insert("mapper.reply.addReply", replyVO);
		
		//댓글이 작성되면 댓글의 그룹번호 r_group를 rno와 같게 값을 넣기위해 선언
		if(result == 1) {
			int check_update =  session.update("mapper.reply.Re_group",replyVO);
			replyVO.setR_group(check_update);
		}
		
		return result;
	}

	// 댓글 수정
	@Override
	public int updateReply(ReplyVO replyVO) throws DataAccessException {
		return session.update("mapper.reply.updateReply", replyVO);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int rno) throws DataAccessException {
		return 	session.delete("mapper.reply.deleteReply", rno);
 
	}

//----------------------------------------------------

	// 답글 작성	
	@Override
	public int WriteReReply(ReplyVO replyVO) throws DataAccessException{
		return session.insert("mapper.reply.ReRePly_write", replyVO);	
		
	}
	
	//답글 수정
	@Override
	public int UpdateReReply(ReplyVO replyVO) throws DataAccessException {
		return session.update("mapper.reply.ReReply_update", replyVO);
	}
	
	@Override
	public Double ratingAvg(int bno) {
		return session.selectOne("mapper.reply.ratingAvg",bno);
	}
	
	@Override
	public void updateRating(ReplyVO reply) {
		session.update("mapper.reply.updateRating",reply);
	}
}
