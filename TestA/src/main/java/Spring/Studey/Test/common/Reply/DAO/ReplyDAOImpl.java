package Spring.Studey.Test.common.Reply.DAO;

import java.util.List;

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
		return session.insert("mapper.reply.addReply", replyVO);
	}

	// 댓글 수정
	@Override
	public int updateReply(ReplyVO replyVO) throws DataAccessException {
		return session.update("mapper.reply.updateReply", replyVO);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int rno) throws DataAccessException {
		return session.delete("mapper.reply.deleteReply", rno);
	}

//----------------------------------------------------

	// 답글 작성

	@Override 
	public int WriteReReply(ReplyVO vo) { 
	//board 테이블에 해당 게시물의 reply수를 +1 하기위한 세팅 
		//BoardVO Bvo = new BoardVO(); Bvo.setBno(vo.getBno());
	  
	  //해당 게시물의 reply를 +1 
	  //session.update("mapper.reply.ReRePly_up",Bvo);
	  
	  //reply 테이블에 추가 
		int result = session.insert("mapper.reply.ReRePly_write",vo);
	  
	  
	//  if(result ==1) {//새로운 댓글 추가되면 
		  //갱신된 댓글 갯수 가져옴 
	//	 Bvo= session.selectOne("mapper.reply.ReRePly_count",Bvo); 
	//	}
	  
	  return result;
	  
	}

}
