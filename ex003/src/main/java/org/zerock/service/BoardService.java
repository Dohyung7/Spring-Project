package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	//public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);
	
	public List<BoardVO> getList1(Criteria cri);

	public List<BoardVO> getList2(Criteria cri);

	public List<BoardVO> getList3(Criteria cri);
	
	public List<BoardVO> getList4(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public BoardVO newbno(Long bno);

	public void removeAttach(Long bno);
}
