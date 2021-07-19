package org.kpu.myweb.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.AirportVO;
import org.kpu.myweb.domain.CustomerVO;
import org.kpu.myweb.domain.ReservationVO;
import org.kpu.myweb.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/account")
public class AccountController {
	
	@Autowired
    private MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	//로그인 화면javascript input 제거
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() throws Exception {
        return "account/login";
    }
	
	//로그인 처리
	@RequestMapping(value = {"/login"}, method = RequestMethod.POST)
	public ModelAndView loginCheck( @RequestParam("login_id") String id, @RequestParam("login_password")String passwd, 
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		boolean result = memberService.loginCheck(id, passwd,session);
		ModelAndView mav = new ModelAndView();
		if(result){//로그인 성공
			mav.setViewName("/home");
			mav.addObject("msg","success");
		}else {//로그인 실패
			mav.setViewName("account/login");
			mav.addObject("msg","failure");			
		}
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
	public ModelAndView myPagelogout(HttpSession session) throws Exception {
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/login");
		mav.addObject("msg","logout");
		return mav;
	}
	
	//회원가입 화면
	@RequestMapping(value = "/signUp", method = RequestMethod.GET) 
	public String signUp() throws Exception { 
		return "/account/signUp"; 
	}
	
	//회원가입 처리
	@RequestMapping(value = "/signUp", method = RequestMethod.POST) 
	public ModelAndView signUpPOST(@ModelAttribute("customer") CustomerVO vo,HttpServletRequest request) throws Exception { 
		ModelAndView mav = new ModelAndView();
		if(memberService.signUp(vo)) {
			mav.setViewName("/account/login");
			mav.addObject("msg","REGISTERED");
		}else {
			mav.setViewName("/account/signUp");
			mav.addObject("msg","REGISTERED");
		}
		return mav;
	}
	
	
	//내정보 처리
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
    public String readmyPage(Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession(false);
		if(session == null|| session.getAttribute("userCustomerId") == null ) {
			return "/account/login";
		}
		Integer userCustomerId = (Integer)session.getAttribute("userCustomerId");
		String stringuci = String.valueOf(userCustomerId);
		
		List<ReservationVO> reserveLists = memberService.readReserveCustomerId(userCustomerId);
		List<AirportVO> airports = memberService.readAirportList();
		
		CustomerVO customer = memberService.getUserInfo(stringuci);
		System.out.println("customer Test : "+userCustomerId + ", "+stringuci);
    	
		
		model.addAttribute("customer", customer);
        model.addAttribute("airports", airports);
        model.addAttribute("reservations",reserveLists);
        return "/account/myPage";
    }
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modifymyPagerGet(@RequestParam("id") String id, Model model,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		if(session == null|| session.getAttribute("userCustomerId") == null ) {
			return "/account/login";
		}
		CustomerVO customer = memberService.getUserInfo(id);
        model.addAttribute("customer", customer);
        return "account/mypage_modify";
    }
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifymyPagePost(@ModelAttribute("customer") CustomerVO vo, HttpServletRequest request) throws Exception {
    	memberService.updateUserInfo(vo);
        return "redirect:/account/myPage";
    }
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView deletemyPageCustomer(@ModelAttribute("customer") CustomerVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		if(session == null|| session.getAttribute("userCustomerId") == null ) {
			mav.setViewName("account/login");
			mav.addObject("msg","accessReject");
			return mav;
		}
		memberService.deleteUserInfo(String.valueOf((Integer)session.getAttribute("userCustomerId")));
		//사용자랑 관련된 정보 전체 삭제
		memberService.deleteUserReserve(String.valueOf((Integer)session.getAttribute("userCustomerId")));
		memberService.logout(session);
		mav.setViewName("/home");
		mav.addObject("msg","deleteUser");
		return mav;
    }


	
	
	@RequestMapping(value = {"/reserceCancel"}, method = RequestMethod.GET)
	public ModelAndView myPagereserveCancel( @RequestParam("id") String reserveId,  HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		ModelAndView mav = new ModelAndView();
		
		
		if(session == null|| session.getAttribute("userCustomerId") == null ) {
			mav.setViewName("/account/login");
			return mav;
		}
		Integer userCustomerId = (Integer)session.getAttribute("userCustomerId");
		String stringuci = String.valueOf(userCustomerId);
		
		
		//클릭한 예약
		ReservationVO reserve = memberService.getReserve(Integer.parseInt(reserveId));
		//airpirtlistid
		Integer airportlistId = reserve.getAirportId();
				
		memberService.cancelReserve(reserveId, airportlistId);
		//memberService.increaseSeat(airportlistId);
		
		
		
		List<ReservationVO> reserveLists = memberService.readReserveCustomerId(userCustomerId);
		List<AirportVO> airports = memberService.readAirportList();
		
		CustomerVO customer = memberService.getUserInfo(stringuci);
		System.out.println("customer Test : "+userCustomerId + ", "+stringuci);
    	
		
		mav.addObject("customer", customer);
        mav.addObject("airports", airports);
        mav.addObject("reservations",reserveLists);

		mav.setViewName("/account/myPage");
		 
		return mav;
	}
	
}