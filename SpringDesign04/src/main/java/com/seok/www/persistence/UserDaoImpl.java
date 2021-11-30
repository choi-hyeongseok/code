package com.seok.www.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seok.www.domain.LoginDto;
import com.seok.www.domain.UserVo;

@Repository("UserDao")
public class UserDaoImpl implements UserDao {

	private static String NAMESPACE = "User";

	@Autowired
	SqlSession SqlSession;

	@Override
	public void register(UserVo userVo) throws Exception {
		System.out.println(userVo.toString());
		SqlSession.insert(NAMESPACE + ".register", userVo);
	}

	@Override
	public UserVo login(LoginDto loginDto) throws Exception {
		System.out.println("sql start");
		System.out.println("sql :" + loginDto.toString());
		UserVo vo = SqlSession.selectOne("User.login", loginDto);
		System.out.println("sql end :" + vo.toString());
		
		return vo;
	}

	@Override
	public int userDelete(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.update(NAMESPACE + ".delete", userVo);
	}

	@Override
	public int userUpdate(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.delete(NAMESPACE + ".update", userVo);
	}

	@Override
	public List<UserVo> userList() throws Exception {
		// TODO Auto-generated method stub
		System.out.print("user list get");
		return SqlSession.selectList(NAMESPACE + ".selectList");
	}
	
	@Override
	public int checkOverId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.selectOne(NAMESPACE+".checkOverId", userId);
	}

	@Override
	public void updateLoginDate(int userNo) throws Exception {
		// TODO Auto-generated method stub
		SqlSession.update(NAMESPACE+".updateLoginDate", userNo);
	}
}
