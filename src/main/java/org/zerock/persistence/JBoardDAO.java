package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.JBoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface JBoardDAO {

  public void create(JBoardVO vo) throws Exception;

  public JBoardVO read(Integer bno) throws Exception;

  public void update(JBoardVO vo) throws Exception;

  public void delete(Integer bno) throws Exception;

  public List<JBoardVO> listAll() throws Exception;

  public List<JBoardVO> listPage(int page) throws Exception;

  public List<JBoardVO> listCriteria(Criteria cri) throws Exception;

  public int countPaging(Criteria cri) throws Exception;
  
  //use for dynamic sql
  
  public List<JBoardVO> listSearch(SearchCriteria cri)throws Exception;
  
  public int listSearchCount(SearchCriteria cri)throws Exception;
  
  
  public void updateReplyCnt(Integer bno, int amount)throws Exception;
  
  
  public void updateViewCnt(Integer bno)throws Exception;
  
  public void addAttach(String fullName)throws Exception;
  
  public List<String> getAttach(Integer bno)throws Exception;  
   
  public void deleteAttach(Integer bno)throws Exception;
  
  public void replaceAttach(String fullName, Integer bno)throws Exception;
  
}
