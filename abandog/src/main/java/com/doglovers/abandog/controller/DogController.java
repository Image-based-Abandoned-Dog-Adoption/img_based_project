package com.doglovers.abandog.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.doglovers.abandog.dao.DogDAO;
import com.doglovers.abandog.dto.C;
import com.doglovers.abandog.dto.DogDTO;
import com.doglovers.abandog.dto.MemberDTO;
import com.doglovers.abandog.dto.Pagination;
import com.doglovers.abandog.dto.Result;
import com.doglovers.abandog.dto.SaveDogDTO;

@Controller
@RequestMapping("/")
public class DogController {
	
	@RequestMapping("/home")
	public String home(Model model) {
		return "home";
	}
	
	@RequestMapping("/main")
	public String main(Model model) {
		return "main";
	}
	
	@RequestMapping("/searchbycategory")
	public String searchbycategory(Model model) {
		DogDAO dao =  C.sqlSession.getMapper(DogDAO.class);
		model.addAttribute("total", dao.selectDogListNum());
		model.addAttribute("page", 1);
		model.addAttribute("gender", 0);
		model.addAttribute("neuter", 0);
		model.addAttribute("location", 0);
		model.addAttribute("kind", "null");
		model.addAttribute("age", "null");
		model.addAttribute("marks", "");
		model.addAttribute("kinds", dao.selectDogKind());
		model.addAttribute("ages", dao.selectDogAge());
		return "searchbycategory";
	}
	
	@RequestMapping("/searchbycategory2")
	public String searchbycategory2(Model model, int page, int gender, int neuter, int location, String kind, String age, String marks) {	
		model.addAttribute("page", page);
		model.addAttribute("gender", gender);
		model.addAttribute("neuter", neuter);
		model.addAttribute("location", location);
		model.addAttribute("kind", kind);
		model.addAttribute("age", age);
		model.addAttribute("marks", marks);
		
		Pagination pagination = new Pagination();
		pagination.setGender(gender);
		pagination.setNeuter(neuter);
		pagination.setLocation(location);
		pagination.setKind(kind);
		pagination.setAge(age);
		pagination.setMarks(marks);
		
		DogDAO dao =  C.sqlSession.getMapper(DogDAO.class);
		model.addAttribute("total", dao.selectDogListNum2(pagination));
		model.addAttribute("page", page);
		model.addAttribute("gender", gender);
		model.addAttribute("neuter", neuter);
		model.addAttribute("location", location);
		model.addAttribute("kind", kind);
		model.addAttribute("age", age);
		model.addAttribute("marks", marks);
		model.addAttribute("kinds", dao.selectDogKind());
		model.addAttribute("ages", dao.selectDogAge());
		return "searchbycategory";
	}
	
	@RequestMapping("/getDogList")
	@ResponseBody
	public Result getDogList(Model model, int page, int gender, int neuter, int location, String kind, String age, String marks) {
		model.addAttribute("page", page);
		model.addAttribute("gender", gender);
		model.addAttribute("neuter", neuter);
		model.addAttribute("location", location);
		model.addAttribute("kind", kind);
		model.addAttribute("age", age);
		model.addAttribute("marks", marks);
		Pagination pagination = new Pagination();
		
		pagination.setListSize(12);
		pagination.setStartList((page - 1) * 12);
		pagination.setGender(gender);
		pagination.setNeuter(neuter);
		pagination.setLocation(location);
		pagination.setKind(kind);
		pagination.setAge(age);
		pagination.setMarks(marks);
		
		DogDAO dao =  C.sqlSession.getMapper(DogDAO.class);
		Result result = new Result();
		
		ArrayList<DogDTO> list = dao.selectDogList(pagination);
		result.setList(list);
		result.setCount(list.size());
		
		return result;
	}
	
	@RequestMapping("/dogInfo")
	public String dogInfo(Model model, int cid) {	
		model.addAttribute("cid", cid);
		
		DogDAO dao =  C.sqlSession.getMapper(DogDAO.class);
		model.addAttribute("dog", dao.selectDog(cid));

		return "dogInfo";
	}
	
	@RequestMapping("/saveDog")
	@ResponseBody
	public String checkId(Model model, String cid, String uid) {
		model.addAttribute("cid", cid);
		model.addAttribute("uid", uid);
		
		SaveDogDTO dto = new SaveDogDTO(Integer.parseInt(cid), Integer.parseInt(uid));
		
		DogDAO dao =  C.sqlSession.getMapper(DogDAO.class);
		if (dao.duplicateDog(dto) != 0) {
			return "duplicate";
		}
		if (dao.insertDog(dto) == 1) {
			return "success";
		}else {
			return "fail";		
		}
	}
	
}