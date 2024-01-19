package board.spring.mybatis;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface BoardDAO {

	int insertBoard(BoardDTO dto);
	
	List<BoardDTO> boardList(int[] limit);
	
	int getTotalBoard();
	
	int updateViewCount(int seq);
	
	BoardDTO getDetail(int seq);
	
	int updateBoard(BoardDTO dto);
	
	int deleteBoard(int seq);
	
	List<BoardDTO> searchOneList(HashMap<String, String> map);
}
