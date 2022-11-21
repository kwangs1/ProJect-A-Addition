package Spring.Studey.Test.Cart.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Spring.Studey.Test.Cart.DAO.CartDAO;
import Spring.Studey.Test.Cart.VO.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;
	
	//찜 목록 리스트
	@Override
	public Map<String,List> CartList(CartVO cartVO)throws Exception{
		Map<String,List> cartMap = new HashMap<String,List>();
		List<CartVO> CartList = cartDAO.CartList(cartVO);
		if(CartList.size() == 0) {
			return null; //카드에 저장된 상품이 없는경우
		}
		cartMap.put("CartList",CartList);
		return cartMap;
	}
	
	//찜 목록 체크 하였는가?
	@Override
	public boolean findCartGoods(CartVO cartVO) throws Exception{
		 return cartDAO.findCart(cartVO);
		
	}	
	
	//찜 목록 추가
	@Override
	public void InCart(CartVO cartVO) throws Exception{
		cartDAO.InCart(cartVO);
	}
	
	//찜 목록 삭제
	@Override
	public void DeleteCart(int cno)throws Exception{
		cartDAO.DeleteCart(cno);
	}
}
