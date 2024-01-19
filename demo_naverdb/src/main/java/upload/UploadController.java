package upload;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	// 폼 화면
	@GetMapping("/fileupload")
	public String uploadForm() {
		return "upload/uploadForm";
	}
	
	// 결과 화면
	@PostMapping("/fileupload")
	public ModelAndView uploadResult(UploadDTO dto) throws IOException {
		// 요청 파라미터명 = dto 변수명 -> 자동 전달 주입
		String savePath = "C:/fullstack/upload/";
		String filename1 = null, newFilename1 = null, newFilename2 = null, filename2 = null;
		
		// 클라이언트 파일 전송 - http stream - 파일형태로 서버에서 받음
		MultipartFile file1 = dto.getFile1();
		if(!file1.isEmpty()) {
			filename1 = file1.getOriginalFilename();

			String beforeExt1 = filename1.substring(0, filename1.lastIndexOf(".")); // 파일명
			String ext1 = filename1.substring(filename1.lastIndexOf(".")); // 확장자명
			
			newFilename1 = beforeExt1 + "(" + UUID.randomUUID().toString() + ")" + ext1;

			File savefile1 = new File(savePath + newFilename1); // 빈 파일 생성
			file1.transferTo(savefile1); // 업로드 스트림을 서버 내부 파일 형태 저장			
		}
		
		MultipartFile file2 = dto.getFile2();
		if(!file2.isEmpty()) {
			filename2 = file2.getOriginalFilename();
			
			String beforeExt2 = filename2.substring(0, filename2.lastIndexOf(".")); // 파일명
			String ext2 = filename2.substring(filename2.lastIndexOf(".")); // 확장자명
			
			newFilename2 = beforeExt2 + "(" + UUID.randomUUID().toString() + ")" + ext2;

			File savefile2 = new File(savePath + newFilename2);
			file2.transferTo(savefile2);			
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("saveresult1", filename1 + " 파일을 " + savePath + newFilename1 + " 파일 이름으로 저장 완료");
		mv.addObject("saveresult2", filename2 + " 파일을 " + savePath + newFilename2 + " 파일 이름으로 저장 완료");
		mv.setViewName("upload/uploadResult");
		
		return mv;
	}
}
