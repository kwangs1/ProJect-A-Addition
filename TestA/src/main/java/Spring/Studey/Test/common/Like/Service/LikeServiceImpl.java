package Spring.Studey.Test.common.Like.Service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Spring.Studey.Test.common.Like.DAO.LikeDAO;
import Spring.Studey.Test.common.Like.VO.LikeVO;

@Service("likeService")
public class LikeServiceImpl implements LikeService{
	@Autowired
	private LikeDAO likeDAO;
	
	
	@Override
	public void likeUp(int bno, String id , int like_type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("id", id);
		map.put("like_type", like_type);
		System.out.println("¡¡æ∆ø‰....." + map);
		likeDAO.likeUp(map);
	}
	
	@Override
	public void likeDown(int bno, String id, int like_type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("id", id);
		map.put("like_type", like_type);
		likeDAO.likeDown(map);
	}
	
	@Override
	public int findLike(int bno, String id){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("bno", bno);
		map.put("id", id);
		return likeDAO.findLike(map);
	}
	
	@Override
	public int getLike(int bno,int like_type){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("bno", bno);
		map.put("like_type", like_type);
		return likeDAO.getLike(map);
	}
}
