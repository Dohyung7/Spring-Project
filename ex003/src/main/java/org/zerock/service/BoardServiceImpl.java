 package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(BoardVO board) {
		log.info("register........."+board);
		mapper.insertSelectKey(board);
		log.info("register........."+board);
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
	@Transactional
	@Override
	public boolean modify(BoardVO board) {

		log.info("modify......" + board);

		attachMapper.deleteAll(board.getBno());

		boolean modifyResult = mapper.update(board) == 1;
		
		if (modifyResult && board.getAttachList() != null) {

			board.getAttachList().forEach(attach -> {

				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}

		return modifyResult;
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get................."+bno);
		return mapper.read(bno);
	}

	
	@Transactional
	@Override
	public boolean remove(Long bno) {

		log.info("remove...." + bno);

		attachMapper.deleteAll(bno);

		return mapper.delete(bno) == 1;
	}
	
	@Override
	public void removeAttach(Long bno) {

		log.info("remove all attach files");

		attachMapper.deleteAll(bno);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		
		log.info("get Attach list by bno" + bno);
		
		return attachMapper.findByBno(bno);
	}

	@Override
	public List<BoardVO> getList1(Criteria cri) {
		log.info("cri:"+cri+"------num-----");
		log.info("111111111111111111111111111111111"+mapper.getListWithPaging1(cri));
		log.info("111111111111111111111111111111111");
		log.info("111111111111111111111111111111111");
		return mapper.getListWithPaging1(cri);
	}

	@Override
	public List<BoardVO> getList2(Criteria cri) {
		log.info("cri:"+cri+"------num-----");
		log.info(mapper.getListWithPaging2(cri));
		return mapper.getListWithPaging2(cri);
	}
	@Override
	public List<BoardVO> getList3(Criteria cri) {
		log.info("cri:"+cri+"------num-----");
		log.info(mapper.getListWithPaging3(cri));
		return mapper.getListWithPaging3(cri);
	}
	@Override
	public List<BoardVO> getList4(Criteria cri) {
		log.info("cri:"+cri+"------num-----");
		log.info(mapper.getListWithPaging4(cri));
		return mapper.getListWithPaging4(cri);
	}
	/*@Override
	public List<BoardVO> getList() {
		log.info("getList............");
		return mapper.getList();
	}*/
	
	@Override
	public BoardVO newbno(Long bno) {
		log.info("�ֽ� bno"+bno);
		return mapper.getnewbno(bno);
	}
	
}
