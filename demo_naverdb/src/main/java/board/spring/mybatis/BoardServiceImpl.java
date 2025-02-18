package board.spring.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service//("boardServiceImpl")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;
	
	@Override
	public void registerBoard(BoardDTO dto) {
		int result = dao.insertBoard(dto);
		System.out.println(result);
	}

	@Override
	public int getTotalBoard() {
		return dao.getTotalBoard();
	}

	@Override
	public List<BoardDTO> boardList(int[] limit) {
		return dao.boardList(limit);
	}
	
	@Override
	public int updateViewCount(int seq) {
		return dao.updateViewCount(seq);
	}

	@Override
	public BoardDTO boardDetail(int seq) {
		return dao.getDetail(seq);
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		return dao.updateBoard(dto);
	}

	@Override
	public int deleteBoard(int seq) {
		return dao.deleteBoard(seq);
	}

	@Override
	public List<BoardDTO> searchOneList(HashMap<String, String> map) {
		return dao.searchOneList(map);
	}

}
