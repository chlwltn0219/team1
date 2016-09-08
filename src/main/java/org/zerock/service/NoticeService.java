package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeVO;
import org.zerock.domain.SearchCriteria;

public interface NoticeService {

  public void regist(NoticeVO notice) throws Exception;

  public NoticeVO read(Integer bno) throws Exception;

  public void modify(NoticeVO notice) throws Exception;

  public void remove(Integer bno) throws Exception;

  public List<NoticeVO> listAll() throws Exception;

  public List<NoticeVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<NoticeVO> listSearchCriteria(SearchCriteria cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;
  
  
  public List<String> getAttach(Integer bno)throws Exception;
  

}
