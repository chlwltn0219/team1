package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.JBoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.JBoardDAO;

@Service
public class JBoardServiceImpl implements JBoardService {

  @Inject
  private JBoardDAO dao;

  
  @Transactional
  @Override
  public void regist(JBoardVO board) throws Exception {
  
    dao.create(board);
    
  }
  
  //
//  @Override
//  public void regist(JBoardVO board) throws Exception {
//    dao.create(board);
//  }

//  @Override
//  public JBoardVO read(Integer bno) throws Exception {
//    return dao.read(bno);
//  }


  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public JBoardVO read(Integer bno) throws Exception {
    dao.updateViewCnt(bno);
    return dao.read(bno);
  }

  
//  @Override
//  public void modify(JBoardVO board) throws Exception {
//    dao.update(board);
//  }
  
  @Transactional
  @Override
  public void modify(JBoardVO board) throws Exception {
    dao.update(board);
    
    Integer bno = board.getBno();
    
    dao.deleteAttach(bno);
    
    String[] files = board.getFiles();
    
    if(files == null) { return; } 
    
    for (String fileName : files) {
      dao.replaceAttach(fileName, bno);
    }
  }
  

//  @Override
//  public void remove(Integer bno) throws Exception {
//    dao.delete(bno);
//  }
  
  
  @Transactional
  @Override
  public void remove(Integer bno) throws Exception {
    dao.deleteAttach(bno);
    dao.delete(bno);
  } 

  @Override
  public List<JBoardVO> listAll() throws Exception {
    return dao.listAll();
  }

  @Override
  public List<JBoardVO> listCriteria(Criteria cri) throws Exception {

    return dao.listCriteria(cri);
  }

  @Override
  public int listCountCriteria(Criteria cri) throws Exception {

    return dao.countPaging(cri);
  }

  @Override
  public List<JBoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {

    return dao.listSearch(cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return dao.listSearchCount(cri);
  }
  

  @Override
  public List<String> getAttach(Integer bno) throws Exception {
    
    return dao.getAttach(bno);
  }   

}
