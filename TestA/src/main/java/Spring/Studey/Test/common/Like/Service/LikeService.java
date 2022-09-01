package Spring.Studey.Test.common.Like.Service;

import Spring.Studey.Test.common.Like.VO.LikeVO;

public interface LikeService {

	void likeUp(int bno, String id, int like_type);

	void likeDown(int bno, String id, int like_type);

	int findLike(int bno, String id);

	int getLike(int bno, int like_type);

}
