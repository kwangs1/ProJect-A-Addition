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
	
	//�� ��� ����Ʈ
	@Override
	public Map<String,List> CartList(CartVO cartVO)throws Exception{
		Map<String,List> cartMap = new HashMap<String,List>();
		List<CartVO> CartList = cartDAO.CartList(cartVO);
		if(CartList.size() == 0) {
			return null; //ī�忡 ����� ��ǰ�� ���°��
		}
		cartMap.put("CartList",CartList);
		return cartMap;
	}
	
	//�� ��� üũ �Ͽ��°�?
	@Override
	public boolean findCartGoods(CartVO cartVO) throws Exception{
		 return cartDAO.findCart(cartVO);
		
	}	
	
	//�� ��� �߰�
	@Override
	public void InCart(CartVO cartVO) throws Exception{
		cartDAO.InCart(cartVO);
	}
	
	//�� ��� ����
	@Override
	public void DeleteCart(int cno)throws Exception{
		cartDAO.DeleteCart(cno);
	}
}
