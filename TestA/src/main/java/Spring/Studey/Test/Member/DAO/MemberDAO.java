package Spring.Studey.Test.Member.DAO;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import Spring.Studey.Test.Member.VO.MemberVO;

public interface MemberDAO {

	int insertMember(MemberVO memberVO) throws DataAccessException;

	int idCheck(String id) throws DataAccessException;

	MemberVO login(MemberVO memberVO) throws DataAccessException;

}
