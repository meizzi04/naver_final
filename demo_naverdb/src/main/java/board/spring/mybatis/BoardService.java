package board.spring.mybatis;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
	void registerBoard(BoardDTO dto);
	int getTotalBoard();
	List<BoardDTO> boardList(int[] limit);
	int updateViewCount(int seq);
	BoardDTO boardDetail(int seq);
	int updateBoard(BoardDTO dto);
	int deleteBoard(int seq);
	List<BoardDTO> searchOneList(HashMap<String, String> map);
}
