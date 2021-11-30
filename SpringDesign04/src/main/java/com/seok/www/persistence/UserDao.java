package com.seok.www.persistence;

import java.util.List;

import com.seok.www.domain.LoginDto;
import com.seok.www.domain.UserVo;

public interface UserDao {

	/**
	 * ȸ�� ���
	 * @param userVo
	 * @throws Exception
	 */
	void register(UserVo userVo) throws Exception;

	/**
	 * ȸ�� �α���
	 * @param loginDto
	 * @return
	 * @throws Exception
	 */
	UserVo login(LoginDto loginDto) throws Exception;
	
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
	List<UserVo> userList() throws Exception;
	
	/**
	 * 중복 확인
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	int checkOverId(String userId) throws Exception;
	
	
	public void updateLoginDate(int userNo) throws Exception;
	

}
