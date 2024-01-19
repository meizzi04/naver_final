package upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;


import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class DownloadController {
	@GetMapping("/filedownloadlist")
	public ModelAndView downloadList() {
		ModelAndView mv = new ModelAndView();
		
		// c:/fullstack/upload/ 파일명 추출해서 모델 생성
		File f = new File("c:/fullstack/upload/");
		String[] filearray = f.list();
		
		mv.addObject("filearray", filearray);
		
		// view는 upload/download.jsp
		mv.setViewName("upload/download");
		
		return mv;
	}
	
	@GetMapping("/filedownloadresult")
	public void downloadResult(String filename, HttpServletResponse response) throws IOException {
		response.setContentType("application/download"); // 이 표현으로 뷰는 없음
		response.setHeader("Content-Disposition", "attchment;filename=\""+ filename + "\""); // 다운로드할 파일명
		
		File f = new File("c:/fullstack/upload/" + filename);
		response.setContentLength((int)f.length()); // 다운로드할 파일 길이

		OutputStream out = response.getOutputStream();
		FileInputStream fi = new FileInputStream(f);
		
		FileCopyUtils.copy(fi, out);
		
		fi.close();
		out.close();
	}

}
