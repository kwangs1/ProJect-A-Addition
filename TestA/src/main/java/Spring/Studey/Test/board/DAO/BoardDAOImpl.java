package Spring.Studey.Test.board.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Spring.Studey.Test.board.VO.BoardVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Map<String,Object>> list()throws DataAccessException{
		return session.selectList("mapper.board.list");
	}
	
	@Override
	public BoardVO detail(int bno)throws DataAccessException {
		return session.selectOne("mapper.board.detail", bno);
	}
	
	@Override
	public void UpdateReplyCount(int bno)throws DataAccessException{
		 session.update("mapper.board.UpdateReplyCount", bno);		
	}
	
	@Override
	public void register(BoardVO board) {
		session.insert("mapper.board.register",board);
	}

	//평점
	@Override
	public void updateRating(BoardVO board) {
		System.out.println("평점 dao");
		session.update("mapper.board.updateRating",board);
	}
	
	//평균평점
	@Override
	public int getRating(int bno){
		 return  session.selectOne("mapper.board.getRating",bno);
	}
}
