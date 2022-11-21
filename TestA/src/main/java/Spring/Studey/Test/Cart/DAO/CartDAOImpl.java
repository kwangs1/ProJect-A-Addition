package Spring.Studey.Test.Cart.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Spring.Studey.Test.Cart.VO.CartVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO{
	@Autowired
	private SqlSession session;
	
	//�� ��� ����Ʈ 
	@Override
	public List<CartVO> CartList(CartVO cartVO)throws DataAccessException{
		List<CartVO> CartList = session.selectList("mapper.cart.CartList",cartVO);
		return CartList;
	}
	
	//�� ��� �߰�
	@Override
	public void InCart(CartVO cartVO)throws DataAccessException{
		session.insert("mapper.cart.InCart",cartVO);
	}
	
	//�� ��� ����
	@Override
	public void DeleteCart(int cno)throws DataAccessException{
		session.delete("mapper.cart.DeleteCart",cno);
	}
	
	//�� ��� üũ �ߴ���?
	@Override
	public boolean findCart(CartVO cartVO)throws DataAccessException{
		String result =  session.selectOne("mapper.cart.findCart",cartVO);
		return Boolean.parseBoolean(result);
	}
}
