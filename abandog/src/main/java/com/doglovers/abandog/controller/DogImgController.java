package com.doglovers.abandog.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Base64.Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.doglovers.abandog.dao.DogDAO;
import com.doglovers.abandog.dao.DogDAOImg;
import com.doglovers.abandog.dto.C;
import com.doglovers.abandog.dto.DogDTO;
import com.doglovers.abandog.dto.Pagination;
import com.doglovers.abandog.dto.Result;

@Controller
@RequestMapping("/")
public class DogImgController {

	@RequestMapping("/searchbyimage")
	public String searchbyimage(Model model) {
		DogDAO dao = C.sqlSession.getMapper(DogDAO.class);
		model.addAttribute("total", dao.selectDogListNum());
		model.addAttribute("page", 1);
		model.addAttribute("gender", 0);
		model.addAttribute("neuter", 0);
		model.addAttribute("location", 0);
		return "searchbyimage";
	}


	@RequestMapping({ "/imgUploadTest" })
	public String imgUploadTest(MultipartHttpServletRequest mre, HttpServletRequest request, Model model)
			throws Exception {

		MultipartFile mf = mre.getFile("imgFile");
		// fullName에 띄어쓰기 존재함->공백을 바꿔주야함
		Date date = new Date();
		String imgId = new SimpleDateFormat("yyyyMMddHHmmss").format(date); // 새로운 imgId 지정
		String uploadPath = "";
		// 확장자 따오기
		String originalName = mf.getOriginalFilename(); // 업로드하는 파일이름
		int beginIndex = originalName.lastIndexOf(".");
		String ext = originalName.substring(beginIndex + 1);

		String path = "";
		String folder_dir = "";
		if (request.getRequestURL().indexOf("localhost") > 0) {
			// 개발서버
			path = "C:\\" + "abandog_imgs\\";
			folder_dir = "C:\\abandog_imgs";
		} else {
			// 실서버
			path = "/home/wndvlf96/imgs/";
			folder_dir = "/home/wndvlf96/imgs";
		}
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		String ids = session.getId();
		String fileNewName = ids+imgId + "." + ext; // 새로운 파일 네임 지정
		uploadPath = path + fileNewName;
		System.out.println(uploadPath);
		// 경로에 path가 없다면 생성하기
		File Folder = new File(folder_dir);
		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}

		File temp = new File(uploadPath);
		mf.transferTo(temp); // 파일을 위 지정 경로로 업로드
		
		String result_cids = "";
		int flag = 0;
		int idx = 0;
		System.out.println("---------------------------------------");
		if (request.getRequestURL().indexOf("localhost") < 0) {
			//실서버				
			// 파이썬동작확인.
			String[] cmd3 = new String[3];
			cmd3[0] = "python3.7";	//파이썬3 실행
			cmd3[1] = "/home/wndvlf96/abandog/imgtest.py"; // 파이썬 파일 경로
			cmd3[2] = fileNewName; // 새롭게 저장된 사진의 이름
				
			idx = 0;
			Process p3 = Runtime.getRuntime().exec(cmd3);
			BufferedReader br3 = new BufferedReader(new InputStreamReader(p3.getInputStream(), "EUC-KR"));
			String line3 = null;
			while ((line3 = br3.readLine()) != null) {
				/* 만약 head말고 다른 부분도 여기서 단다면??? */
				System.out.println(idx + ": " + line3);
				if (line3.equals("fromhere")) {
					flag = 1;
				}
				else if(flag==1) {
					// flag 1이면 비슷한 강아지가 없음
					if (!line3.equals("error")) {
						result_cids = result_cids.concat(line3);
						flag++ ;
					}
					else {
						// flag 0이면 사진상 강아지가 없음
						flag-- ;
					}
				}
				else if(flag > 1) {
					line3 = ",".concat(line3);
					result_cids = result_cids.concat(line3);
				}
				idx++;
			}
			System.out.println("---------------------------------------");		
		} else {
			// 개발서버
			// 파이썬동작확인.
			String[] cmd3 = new String[3];
			cmd3[0] = "python";	//파이썬3 실행
			cmd3[1] = "C:\\abandog_imgs\\imgtest.py"; // 파이썬 파일 경로
			cmd3[2] = fileNewName; // 새롭게 저장된 사진의 이름
			
			idx = 0;
			Process p3 = Runtime.getRuntime().exec(cmd3);
			BufferedReader br3 = new BufferedReader(new InputStreamReader(p3.getInputStream(), "EUC-KR"));
			String line3 = null;
			
			while ((line3 = br3.readLine()) != null) {
				/* 만약 head말고 다른 부분도 여기서 단다면??? */
				System.out.println(idx + ": " + line3);
				if (idx==0) {	//저장된 파일경로 파이썬에서 출력
					System.out.println("Hi");
				}
				else if(idx==1) {
					result_cids = result_cids.concat(line3);
				}
				else {
					line3 = ",".concat(line3);
					result_cids = result_cids.concat(line3);
				}
				idx++;
			}
			System.out.println("---------------------------------------");
		}

		String[] result_arr = result_cids.split(",");		// 하나하나가 결과의 cid들
		// flag == 1 => 사진에 강아지 없음
		// flag == 
		for (int k = 0 ; k < result_arr.length;k++) {
			System.out.println(result_arr[k]);
		}
		
		DogDAO dao =  C.sqlSession.getMapper(DogDAO.class);/*
		Result result = new Result();
		Pagination pagination = new Pagination();
		pagination.setListSize(12);
		pagination.setStartList(0);
		pagination.setGender(0);
		pagination.setNeuter(0);
		pagination.setLocation(0);
		ArrayList<DogDTO> list = dao.selectDogList(pagination);
		result.setList(list);
		result.setCount(list.size());*/
		model.addAttribute("total", dao.selectDogListNum());
		model.addAttribute("page", 1);
		model.addAttribute("gender", 0);
		model.addAttribute("neuter", 0);
		model.addAttribute("location", 0);
		model.addAttribute("cid_result",result_cids);
		model.addAttribute("flag",flag);
		return "imgUploadTest";
	}
	@RequestMapping("/getDogList_cids")
	@ResponseBody
	public Result getDogList_cids(Model model, int page, int gender, int neuter, int location, String cids) {
		model.addAttribute("page", page);
		model.addAttribute("gender", gender);
		model.addAttribute("neuter", neuter);
		model.addAttribute("location", location);
		Pagination pagination = new Pagination();
		System.out.println("img"+cids);
		// cids를 배열로 바꾸기
		String[] cids_arr = cids.split(",");		// 하나하나가 결과의 cid들
		
		pagination.setListSize(12);
		pagination.setStartList((page - 1) * 12);
		pagination.setGender(gender);
		pagination.setNeuter(neuter);
		pagination.setLocation(location);
		
		DogDAOImg dao =  C.sqlSession.getMapper(DogDAOImg.class);
		Result result = new Result();
		
		ArrayList<DogDTO> list = dao.selectDogList_cids(cids_arr);
		result.setList(list);
		result.setCount(list.size());
		
		return result;
	}

}
