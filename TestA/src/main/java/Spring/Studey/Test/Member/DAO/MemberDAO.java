package Spring.Studey.Test.Member.DAO;

import org.springframework.dao.DataAccessException;

import Spring.Studey.Test.Member.VO.MemberVO;

public interface MemberDAO {

	int insertMember(MemberVO memberVO) throws DataAccessException;

}
