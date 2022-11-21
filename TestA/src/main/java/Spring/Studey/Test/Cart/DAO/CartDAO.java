package Spring.Studey.Test.Cart.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import Spring.Studey.Test.Cart.VO.CartVO;

public interface CartDAO {

	List<CartVO> CartList(CartVO cartVO) throws DataAccessException;
	
	void InCart(CartVO cartVO) throws DataAccessException;

	void DeleteCart(int cno) throws DataAccessException;

	boolean findCart(CartVO cartVO) throws DataAccessException;

}
