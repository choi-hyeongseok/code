package com.seok.www.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.seok.www.domain.LoginDto;
import com.seok.www.domain.UserVo;

public interface UserService {

	/**
	 * ȸ�� ��� ó��
	 * @param loginDto
	 * @return
	 * @throws Exception
	 */
	public void register(UserVo userVo) throws Exception;

	/**
	 * ȸ�� �α���
	 * @param loginDto
	 * @return
	 * @throws Exception
	 */
	public UserVo login(LoginDto loginDto) throws Exception;
	
	/**
	 * ȸ�� ����
	 * @param userVo
	 * @return
	 * @throws Exception
	 */
	int userUpdate(UserVo userVo) throws Exception;
	
	/**
	 * ȸ�� Ż��
	 * @param userVo
	 * @return
	 * @throws Exception
	 */
	int userDelete(UserVo userVo) throws Exception;
	
	/**
	 * ȸ�� ����Ʈ
	 * @return
	 * @throws Exception
	 */
	List<UserVo> selectList() throws Exception;
	
	
	/**
	 * �α� �ƿ� ó��
	 * @param session
	 * @throws Exception
	 */
	void logout(HttpSession session) throws Exception;
	
	int userIdCheck(String userId) throws Exception;
	
	void updateLoginDate(int userNo) throws Exception;
}
