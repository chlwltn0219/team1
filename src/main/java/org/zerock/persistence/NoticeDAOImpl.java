package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeVO;
import org.zerock.domain.SearchCriteria;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.BoardMapper";

@Override
public void create(NoticeVO vo) throws Exception {
	// TODO Auto-generated method stub
	
}

@Override
public NoticeVO read(Integer bno) throws Exception {
	// TODO Auto-generated method stub
	return null;
}

@Override
public void update(NoticeVO vo) throws Exception {
	// TODO Auto-generated method stub
	
}

@Override
public void delete(Integer bno) throws Exception {
	// TODO Auto-generated method stub
	
}

@Override
public List<NoticeVO> listAll() throws Exception {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<NoticeVO> listPage(int page) throws Exception {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<BoardVO> listCriteria(Criteria cri) throws Exception {
	// TODO Auto-generated method stub
	return null;
}

@Override
public int countPaging(Criteria cri) throws Exception {
	// TODO Auto-generated method stub
	return 0;
}

};
