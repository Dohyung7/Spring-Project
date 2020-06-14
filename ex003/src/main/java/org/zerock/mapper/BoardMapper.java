package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardAttachVO;
//import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

		//@Select("select * from tbl_board where bno>0") << XML로 만들어 주었음
		public List<BoardVO> getList();//리스트 출력
		
		public List<BoardVO> getListWithPaging(Criteria cri);//페이징 처리
		
		public List<BoardVO> getListWithPaging1(Criteria cri );
		
		public List<BoardVO> getListWithPaging2(Criteria cri );
		
		public List<BoardVO> getListWithPaging3(Criteria cri );
		
		public List<BoardVO> getListWithPaging4(Criteria cri );
		
		public void insert(BoardVO board);//삽입 명령
		
		public Integer insertSelectKey(BoardVO board);//PK값을 미리 처리해두고 보관 p191
		
		public BoardVO read(Long bno);
		
		public int delete(Long bno);
		
		public int update(BoardVO board);
		
		public int getTotalCount(Criteria cri);
		
		public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

		public List<BoardAttachVO> findByBno(Long bno);
		
		public BoardVO getnewbno(Long bno);
}
