package Spring.Studey.Test.Cart.Service;

import java.util.List;
import java.util.Map;

import Spring.Studey.Test.Cart.VO.CartVO;

public interface CartService {

	boolean findCartGoods(CartVO cartVO) throws Exception;

	void DeleteCart(int cno) throws Exception;

	void InCart(CartVO cartVO) throws Exception;

	Map<String, List> CartList(CartVO cartVO) throws Exception;

}
