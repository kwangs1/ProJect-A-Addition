package Spring.Studey.Test.common.Like.Service;

import Spring.Studey.Test.common.Like.VO.LikeVO;

public interface LikeService {

	void likeUp(int bno, String id);

	void likeDown(int bno, String id);

}
