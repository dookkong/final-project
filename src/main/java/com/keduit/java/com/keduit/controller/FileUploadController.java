package com.keduit.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileUploadController {
	
	private static final String CURR_IMAGE_REPO_PATH = 
			"D:\\A_TeachingMaterial\\6.JspSpring\\other\\images";
	
	@RequestMapping(value="/form")
	public String form() {
		//1. form()를 호출 시 uploadForm.jsp를 반환
		return "uploadForm";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		Map map = new HashMap(); //2. 매개변수 정보와 파일 정보를 저장할 Map 생성
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value); //3. 전송 된 매개변수 값을 key, value로 map에 저장
		}
		
		List fileList = fileProcess(multipartRequest); //6. fileProcess()에서 리턴한 파일 이름을 fileList에 넣기
		map.put("fileList", fileList); //7. fileList를 map에 저장
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map",map); //8. map을 결과창으로 포워딩
		mav.setViewName("result"); //
		
		return mav; //9. mav을 리턴 > RequestMethod가 POST이므로 fileProcess()로 돌아감
	}
	
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames(); //10. 첨부 된 파일 이름을 가져온다.
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName); //11. 파일 이름에 대한 MultipartFile 객체를 가져온다.
			String originalFileName = mFile.getOriginalFilename(); //12. 실제 파일 이름을 가져온다.
			fileList.add(originalFileName); //4. originalFileName > 파일 이름을 저장한 String 객체를 add ??//13. 파일 이름을 하나씩 fileList에 저장
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+fileName); //파일 경로 생성
			
			if(mFile.getSize() != 0) { //14. 첨부된 파일이 있는지 체크
				if(!file.exists()) { //15.경로에 파일이 없으면
					if(file.getParentFile().mkdir()) { //16. 그 경로에 해당하는 디렉터리를 만든 후
						file.createNewFile(); //파일 생성
					}
				}
				//16. 임시로 저장된 mulitpartFile(mFile)을 실제 파일로 전송
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+originalFileName));
			}
		}
		
		return fileList; //5. 저장 된 파일 이름을 리턴?? //17. 첨부한 파일 이름이 저장된 fileList 반환
	}
}
