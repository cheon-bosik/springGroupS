package com.spring.springGroupS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.springGroupS.common.Pagination;
import com.spring.springGroupS.service.AdminService;
import com.spring.springGroupS.service.MemberService;
import com.spring.springGroupS.vo.MemberVO;
import com.spring.springGroupS.vo.PageVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	Pagination pagination;
	
		
	@GetMapping("/adminMain")
	public String adminMainGet() {
		return "admin/adminMain";
	}
	
	@GetMapping("/adminLeft")
	public String adminLeftGet() {
		return "admin/adminLeft";
	}
	
	@GetMapping("/adminContent")
	public String adminContentGet(Model model, PageVO pageVO) {
		pageVO.setSection("member");
		pageVO.setLevel(3);
		pageVO = pagination.pagination(pageVO);
		
		List<MemberVO> memberVOS = memberService.getMemberLevelCount(pageVO.getLevel());
		
		model.addAttribute("memberLevelCount", memberVOS.size());
		
		return "admin/adminContent";
	}
	
	@GetMapping("/member/adMemberList")
	public String adMemberListGet(Model model, PageVO pageVO) {
		pageVO.setSection("member");
		pageVO = pagination.pagination(pageVO);
		
		List<MemberVO> vos = memberService.getMemberList(pageVO.getStartIndexNo(), pageVO.getPageSize(), pageVO.getLevel());
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		return "admin/member/adMemberList";
	}
	
	// 회원 등급 변경 처리
//	@ResponseBody
//	@PostMapping("/member/memberLevelChange")
//	public String memberLevelChangePost(int idx, int level) {
//		return adminService.setMemberLevelChange(idx, level) + "";
//	}
	@ResponseBody
	@PostMapping("/member/memberLevelChange")
	public int memberLevelChangePost(int idx, int level) {
		return adminService.setMemberLevelChange(idx, level);
	}
	
	// 선택한 회원들 등급 변경 처리
	@ResponseBody
	@PostMapping("/member/memberLevelSelectChange")
	public int memberLevelSelectChangePost(String idxSelectArray, int levelSelect) {
		return adminService.setMemberLevelSelectChange(idxSelectArray, levelSelect);
	}
}
