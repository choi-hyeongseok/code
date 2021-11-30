package com.seok.www.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seok.www.domain.LoginDto;
import com.seok.www.domain.UserVo;
import com.seok.www.persistence.UserDao;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public void register(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		userDao.register(userVo);
	}

	@Override
	public UserVo login(LoginDto loginDto) throws Exception {
		// TODO Auto-generated method stub\
		System.out.println("dao start");
		UserVo vo = userDao.login(loginDto);
		System.out.println("dao end" + vo.toString());
		return vo;
	}

	@Override
	public int userDelete(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userDelete(userVo);
	}

	@Override
	public int userUpdate(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userUpdate(userVo);
	}
	
	@Override
	public List<UserVo> selectList() throws Exception {
		// TODO Auto-generated method stub
		return userDao.userList();
	}
	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}
	@Override
	public int userIdCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.checkOverId(userId);
	}
	
	@Override
	public void updateLoginDate(int userNo) throws Exception {
		// TODO Auto-generated method stub
		userDao.updateLoginDate(userNo);
	}
}
