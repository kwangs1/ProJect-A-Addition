package Spring.Studey.Test.Member.DAO;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Spring.Studey.Test.Member.VO.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	@Override
	public int insertMember(MemberVO memberVO)throws DataAccessException{
		int result = sqlSession.insert("mapper.member.insertMember",memberVO);
		return result;
	}
	
	//id 중복검사
	@Override
	public int idCheck(String id)throws DataAccessException{
		int result = sqlSession.selectOne("mapper.member.idCheck",id);
		return result;
	}
	
	//login
	@Override
	public MemberVO login(MemberVO memberVO)throws DataAccessException{
		MemberVO member = (MemberVO)sqlSession.selectOne("mapper.member.login",memberVO);
		return member;
	}
	
}
