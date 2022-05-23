package Spring.Studey.Test.board.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Map<String,Object>> list(){
		return session.selectList("mapper.board.list");
	}
}
