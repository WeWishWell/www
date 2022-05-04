package com.wewishwell.shop.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.wewishwell.shop.service.MemberService;
import com.wewishwell.shop.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService ms;
	
	@GetMapping("/index")
	public String home(HttpServletRequest req) {
		Cookie cookie = WebUtils.getCookie(req, "nm_ID");
		HttpSession s = req.getSession();
		String data = (String)s.getAttribute("data");
		if(data == null) {
			if(cookie !=null) {
				
				s.setAttribute("data", cookie.getValue());
			}else {
				String Cookie_id = String.valueOf(Math.random()); 
				Cookie cookie2 = new Cookie("nm_ID", Cookie_id);
				cookie2.setMaxAge(60*60*24*1);
				s.setAttribute("data", cookie2.getValue());
			}
		}
		return "index";
	}
	
	@GetMapping("/memberInsert")
	public String memberInsert() {
		return "memberInsert";
	}
	
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public ModelAndView insert(MemberVO vo, HttpServletRequest req) {
		/* System.out.println("넘어온 데이터"+vo); */
		int rs = ms.memberinsert(vo);
		ModelAndView mav = new ModelAndView();
		if(rs==1) {
			HttpSession s = req.getSession();
			s.setAttribute("data", vo.getId());
			mav.setViewName("index");
			/* System.out.println("@회원가입 성공"); */
		}else {
			mav.setViewName("memberInsert");
			/* System.out.println("@회원가입 실패"); */
		}
		return mav;
	}
	@GetMapping("/logIn")
	public String logIn() {
		return "login";
	}
	@PostMapping("/logIn")
	public String login(MemberVO vo ,HttpServletRequest req) {
		/* System.out.println("@넘어온값" + vo); */
		MemberVO log = ms.memberLogin(vo);
		HttpSession s = req.getSession();
		s.setAttribute("data", log.getId());
		if(log.getRole().equals("admin")) {
			s.setAttribute("roleCheck", log.getRole());
		}
		return "index";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession s = req.getSession();
		Cookie coo = WebUtils.getCookie(req, "nm_ID");
		s.setAttribute("data", coo.getValue());
		s.removeAttribute("roleCheck");
		return "index";
	}
	
	@GetMapping(value = "/memberDetail") //실제 주소 경로
	public ModelAndView detail(MemberVO vo) {
		//Service
		MemberVO detail = ms.memberdetail(vo);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data",detail); // =request.setAttrbute("data",list)
		mav.setViewName("memberDetail"); // list.jsp
		
		return mav; //jsp 저장 위치와 파일명
	}
	
	@GetMapping("/memberUpdate")
	public ModelAndView gotoMemberUpdate(HttpServletRequest req) {
		HttpSession s = req.getSession();
		MemberVO vo = new MemberVO();
		vo.setId((String)s.getAttribute("data"));
		MemberVO detail = ms.memberdetail(vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detail);
		mav.setViewName("memberUpdate");
		return mav;
	}
	
	
	@PostMapping("/memberUpdate")
	public ModelAndView memberUpdate(MemberVO vo) {
		/* System.out.println("@넘어 온 값" + vo); */
		int rs = ms.memberUpdate(vo);
		ModelAndView mav = new ModelAndView();
		if(rs==1) {
			mav.setViewName("redirect:/memberDetail?id="+vo.getId());
			/* System.out.println("@회원정보수정 성공"); */
		}else {
			mav.setViewName("memberUpdate");
			/* System.out.println("@회원정보수정 실패"); */
		}
		return mav;
	}
	
	@GetMapping("/delete")
	public String delete(MemberVO vo, HttpServletRequest req) {
		ms.delete(vo);
		HttpSession s = req.getSession();
		Cookie coo = WebUtils.getCookie(req, "nm_ID");
		s.setAttribute("data", coo.getValue());
		s.removeAttribute("roleCheck");
		return "index";
	}
	
	@GetMapping("/pwTrue")
	public String pwTrue(@RequestParam String ref) {
		if(!ref.equals("go")) {
			if(ref.equals("memberDetail")) {
				return "redirect:/memberUpdate";
			}
			return "index";
		} else {
			return "include/pwTrue";
		}
	}
	
	
	@GetMapping("review")
	public ModelAndView review() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviews", ms.review());
		mav.setViewName("review");
		return mav;
	}
	
	@GetMapping("reviewWrite")
	public ModelAndView reviewWrite(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("prodata", map);
		mav.setViewName("reviewWrite");
		return mav;
	}

}
