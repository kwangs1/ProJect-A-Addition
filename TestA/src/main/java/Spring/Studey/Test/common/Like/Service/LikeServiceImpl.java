package Spring.Studey.Test.common.Like.Service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Spring.Studey.Test.common.Like.DAO.LikeDAO;

@Service("likeService")
public class LikeServiceImpl implements LikeService{
	@Autowired
	private LikeDAO likeDAO;
	
	
	@Override
	public void likeUp(int bno, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("id", id);
		likeDAO.likeUp(map);
	}
	@Override
	public void likeDown(int bno, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("id", id);
		likeDAO.likeDown(map);
	}
}
