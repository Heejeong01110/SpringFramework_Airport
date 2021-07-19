package org.kpu.myweb.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/airport")
public class AirportController {
private static final Logger logger = LoggerFactory.getLogger(AirportController.class);
   @Autowired
   private MemberService memberService;

   @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String listAirportGet(Model model) throws Exception {
       List<AirportVO> airports = memberService.readAirportList();
       
        model.addAttribute("airports", airports);
        return "airport/airport_list";
    }
   
   @RequestMapping(value = "/reserving", method = RequestMethod.GET)
    public String readMember(@RequestParam("id") String id, Model model) throws Exception {
        AirportVO airport = memberService.readAirport(id);
        List<ReservationVO> reserveLists = memberService.readReserveAirportId(id);
       
        model.addAttribute("airport", airport);
        model.addAttribute("reservations",reserveLists);
        return "airport/reserving";
    }
   
      //좌석선택화면에서 확인 누른 후 처리하는 화면 (티켓화면으로 정보 넘김)
      @RequestMapping(value = {"/reservingPost"}, method = RequestMethod.POST)
      public ModelAndView reservingSeat( @RequestParam("arrayParam") String checked,
            @RequestParam("basicInfo") Integer basicInfo, HttpServletRequest request) throws Exception {
         HttpSession session = request.getSession(false);
         ModelAndView mav = new ModelAndView();
         
         
         if(session == null|| session.getAttribute("userCustomerId") == null ) {
            mav.setViewName("/account/login");
            return mav;
         }
         
         Date date = new Date();
         SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
         String formattedDate = format.format(date);
         
         Integer userCustomerId = (Integer)session.getAttribute("userCustomerId");
         String stringuci = String.valueOf(userCustomerId);
         CustomerVO customer = memberService.getUserInfo(stringuci);
         
         ReservationVO vo;
         String[] checks;
         checks = checked.split(",");
         
         List<ReservationVO> reservelist = new ArrayList<>();
         List<AirportVO> airportlist = new ArrayList<>();

          for(int i=0;i<checks.length;i++) {
             vo = new ReservationVO();
             vo.setAirportId(basicInfo);
             vo.setCustomerId((Integer)session.getAttribute("userCustomerId"));
             vo.setReserveTime(formattedDate);
             vo.setReservePrice(0);
             vo.setReserveSuccess(0);
             vo.setReserveName(customer.getName());
             vo.setReserveSeat(Integer.parseInt(checks[i]));
             vo.setReservePassport(customer.getPassportNumber());
              reservelist.add(i,vo);//이번에 예약하겠다고 누른 좌석들
              airportlist.add(memberService.readAirport(basicInfo.toString()));
          }
          mav.setViewName("/airport/reservingList");
          mav.addObject("reservations",reservelist);
          mav.addObject("checks",checks);
          mav.addObject("airports",airportlist);
          mav.addObject("airportId",basicInfo);
          mav.addObject("customer",customer);
          mav.addObject("seatString",checked);
          
         return mav;
      }

        
      @RequestMapping(value = {"/reserveSuccess"}, method = RequestMethod.POST)
      public ModelAndView reserveComplete( @RequestParam("namelist") String namelist, @RequestParam("airportId") String airportId, 
            @RequestParam("passportlist") String passportlist, @RequestParam("seatlist") String seatlist, HttpServletRequest request) throws Exception {
         
    	  ModelAndView mav = new ModelAndView();
    	 
    	  HttpSession session = request.getSession(false);
         
         
         
         if(session == null|| session.getAttribute("userCustomerId") == null ) {
            mav.setViewName("/account/login");
            return mav;
         }
         
         String[] nameL;
         nameL = namelist.split(",");
         String[] passportL;
         passportL = passportlist.split(",");
         String[] seatL;
         seatL = seatlist.split(",");
         
         
         Date date = new Date();
         SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
         String formattedDate = format.format(date);
         
         Integer userCustomerId = (Integer)session.getAttribute("userCustomerId");
         String stringuci = String.valueOf(userCustomerId);
         CustomerVO customer = memberService.getUserInfo(stringuci);

         List<ReservationVO> resVOList = new ArrayList<>();
         ReservationVO vo = new ReservationVO();
         
         for(int i=0;i<nameL.length;i++) {
        	 vo = new ReservationVO();
             vo.setAirportId(Integer.parseInt(airportId));
             vo.setCustomerId((Integer)session.getAttribute("userCustomerId"));
             vo.setReserveSeat(Integer.parseInt(seatL[i]));
             vo.setReserveTime(formattedDate);
             vo.setReservePrice(0);
             vo.setReserveSuccess(0);
             vo.setReserveName(nameL[i]);
             vo.setReservePassport(passportL[i]);
             resVOList.add(vo);
         }
       
        	//트랜잭션 실행할 부분
             memberService.reserving(resVOList, Integer.parseInt(airportId));
             
             if(memberService.getReserve(memberService.getLastReservingId()).getReserveSeat() == resVOList.get(resVOList.size()-1).getReserveSeat()) {
            	 mav.setViewName("/home");
                 mav.addObject("msg","RESERVATIONSUCCESS");
             }else {
            	 mav.setViewName("/home");
                 mav.addObject("msg","RESERVATIONFAIL");
             }
          
         return mav;
      }
   

}