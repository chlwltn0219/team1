package org.zerock.persistence;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

public interface UserDAO {

  public UserVO login(LoginDTO dto)throws Exception;

  public void keepLogin(String uid, String sessionId, Date next);
  
  public UserVO checkUserWithSessionKey(String value);
  
  public void create(UserVO vo) throws Exception;
  
  public  UserVO check(String uid) throws Exception;

}



