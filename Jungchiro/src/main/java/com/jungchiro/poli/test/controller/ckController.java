package com.jungchiro.poli.test.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ckController {

	private File fileDir;

	// ckEditor img file 업로드 처리
	@RequestMapping("/poli/imageUpload.do")
	public void imgUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

		//http hearder 설정
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//http body
		//업로드한 파일 이름
		String fileName = upload.getOriginalFilename();

		//바이트 배열로 변환
		byte[] bytes = upload.getBytes();
		//이미지를 업로드할 디렉토리(배포 경로로 설정)
		
		/*
		 *업로드 될 경로
		String imgPath = "/resources/imageUpload/";
		* 업로드 될 실제 경로
		String uploadPath = getServletContext().getRealPath(imgPath);
		
		File isDir = new File(uploadPath);
		
		if(!isDir.isDirectory(){
		isDir.mkdir();
		}
		
		System.out.println(uploadPath);
		*/

		String uploadPath = "C:\\Workspace_Spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Jungchiro\\resources\\imageUpload";

		//서버에 저장됨

		OutputStream out = new FileOutputStream(new File(uploadPath + "\\" + fileName)); 

		out.write(bytes);

		String callback = request.getParameter("CKEditorFuncNum");

		PrintWriter printWriter = response.getWriter();
		response.setContentType("text/html");
		String fileUrl = request.getContextPath() + "/imageUpload/" + fileName;

		System.out.println("fileUrl: " + fileUrl);
		
		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드 되었습니다.')" + "</script>");		 
	
		//스트림닫기
		printWriter.flush();
	}

	// ckEditor img file 화면에 출력
	@RequestMapping(value = "/poli/ckImgSubmit.do")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 서버에 저장된 이미지 경로
		String path = fileDir.getPath() + "ckImage/";

		String sDirPath = path + uid + "_" + fileName;

		File imgFile = new File(sDirPath);

		// 사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();

				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}

				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();

			} catch (IOException e) {
				System.out.println("chEditor submit error");
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}

		}
	}

}
