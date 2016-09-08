package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.JBoardVO;
import org.zerock.domain.SearchCriteria;

public interface JBoardService {

  public void regist(JBoardVO board) throws Exception;

  public JBoardVO read(Integer bno) throws Exception;

  public void modify(JBoardVO board) throws Exception;

  public void remove(Integer bno) throws Exception;

  public List<JBoardVO> listAll() throws Exception;

  public List<JBoardVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<JBoardVO> listSearchCriteria(SearchCriteria cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;
  
  
  public List<String> getAttach(Integer bno)throws Exception;
  

}
