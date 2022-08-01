package Spring.Studey.Test.common.Like.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import Spring.Studey.Test.common.Like.Service.LikeService;
import Spring.Studey.Test.common.Like.VO.LikeVO;
import Spring.Studey.Test.common.base.BaseController;

@RestController
@RequestMapping(value="/like")
public class LikeControllerImpl extends BaseController implements LikeController{

	@Autowired
	private LikeService likeService;
	
	//좋아요 기능
	@RequestMapping(value="/likeUp.do", method = RequestMethod.POST)
	public void likeup(@RequestBody LikeVO like) {
		try {
			System.out.println("컨트롤러 연결 성공..좋아요 성공!");
			System.out.println(like.getBno());
			System.out.println(like.getId());
			likeService.likeUp(like.getBno(),like.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/likeDown.do", method = RequestMethod.POST)
	public void likeDown(@RequestBody LikeVO like) {
		try {
			System.out.println("컨트롤러 연결 성공..좋아요 취소!");
			System.out.println(like.getBno());
			System.out.println(like.getId());
			likeService.likeDown(like.getBno(),like.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
