package Spring.Studey.Test.Member.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Spring.Studey.Test.Member.VO.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMember(MemberVO memberVO)throws DataAccessException{
		int result = sqlSession.insert("mapper.member.insertMember",memberVO);
		return result;
	}
}
