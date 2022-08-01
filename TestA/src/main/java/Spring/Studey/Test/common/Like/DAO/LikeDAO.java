package Spring.Studey.Test.common.Like.DAO;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import Spring.Studey.Test.common.Like.VO.LikeVO;

public interface LikeDAO {
	
	void likeUp(Map<String, Object> data);
	
	void likeDown(Map<String, Object> data);
}
