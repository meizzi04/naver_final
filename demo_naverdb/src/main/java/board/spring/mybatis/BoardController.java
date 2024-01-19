package board.spring.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	BoardService service;
	
	@RequestMapping("/")
	public String start() {
		return "board/start";
	}
	
	@GetMapping("/boardwrite")
	public String boardWrite() {
		return "board/boardwrite";
	}
	
	@PostMapping("/boardwrite")
	public ModelAndView boardWrite(BoardDTO dto) {
		service.registerBoard(dto);
		
		ModelAndView mv = new ModelAndView(); // 현재는 모델 X, 뷰 O
		mv.setViewName("board/start");
		
		return mv;
	}
	
	@RequestMapping("/boardlist")
	public ModelAndView boardList(@RequestParam(value="pagenum", required=false , defaultValue="1") int pagenum){
		int pagecount = 3;
		int [] limit = new int[2];
		limit[0] = (pagenum-1) * pagecount;
		limit[1] = pagecount;
		ModelAndView mv = new ModelAndView();
		
		List<BoardDTO> list = service.boardList(limit);
		mv.addObject("boardlist", list);
		int totalcount = service.getTotalBoard();
		mv.addObject("totalcount", totalcount);
		
		mv.addObject("pagecount", pagecount);
		mv.setViewName("board/list");
		return mv;
	}
	
	@RequestMapping("/boarddetail")
	public ModelAndView boardDetail(int seq) {
		service.updateViewCount(seq);
		
		BoardDTO dto = service.boardDetail(seq);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("detaildto", dto);
		mv.setViewName("board/detail");
		
		return mv;
	}
	
	@RequestMapping("/boardupdate")
	public String boardUpdate(BoardDTO dto) {
		service.updateBoard(dto);
		return "redirect:/boardlist";
	}
	
	@RequestMapping("/boarddelete")
	public String boardDelete(int seq) {
		service.deleteBoard(seq);
		return "redirect:/boardlist";
	}
	
	@RequestMapping("/boardsearchlist")
	public ModelAndView boardSearchList(String item, String word) {
		
		if(item.equals("제목")) {
			item = "title";
		} else if(item.equals("작성자")) {
			item = "writer";
		} else if(item.equals("내용")) {
			item = "contents";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("item", item);
		map.put("word", "%"+word+"%");
		
		List<BoardDTO> list = service.searchOneList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("board/searchlist");
		
		return mv;
	}
}
