package board.spring.mybatis;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberBoardController {
	
	@Autowired
	@Qualifier("memberServiceImpl")
	MemberService service;
	
	@GetMapping("/boardlogin")
	public String loginForm() {
		return "board/loginForm";
	}
	
	@PostMapping("/boardlogin")
	public String loginProcess(String memberid, String pw, HttpSession session) {
		MemberDTO dto = service.oneMember(memberid);
		if(dto != null) {
			if(dto.getPw().equals(pw)) {
				session.setAttribute("sessionid", memberid);
			} else {
				//session.setAttribute("sessionid", "암호 재입력");
			}
		} else {
			//session.setAttribute("sessionid", "회원가입 요망");
		}
		return "board/start";
	}
	
	@RequestMapping("/boardlogout")
	public String logout(HttpSession session){
		if(session.getAttribute("sessionid") != null) {
			session.removeAttribute("sessionid");			
		}
		return "board/start";
	}
	
	// http://localhost:9070/getwriter?memberid=xx
	/*@RequestMapping("/getwriter")
	@ResponseBody
	public MemberDTO getWriter(String memberid) {
		MemberDTO dto = service.oneMember(memberid);
		return dto;
	}*/
	
	// http://localhost:9070/getwriter/id1
	@RequestMapping("/getwriter/{writer}")
	@ResponseBody
	public MemberDTO getWriter(@PathVariable("writer") String memberid) {
		MemberDTO dto = service.oneMember(memberid);
		return dto;
	}
}
