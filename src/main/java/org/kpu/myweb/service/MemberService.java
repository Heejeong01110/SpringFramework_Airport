package org.kpu.myweb.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.AirportVO;
import org.kpu.myweb.domain.CustomerVO;
import org.kpu.myweb.domain.ReservationVO;

public interface MemberService {

	public boolean loginCheck(String id, String passwd, HttpSession session) throws Exception;
	public void logout(HttpSession session) throws Exception;
	public boolean signUp(CustomerVO vo) throws Exception;
	
	public List<AirportVO> readAirportList() throws Exception;
	public AirportVO readAirport(String id) throws Exception;
	public void decreaseSeat(Integer airportId) throws Exception;
	public void increaseSeat(Integer airportId) throws Exception;
	
	public List<ReservationVO> readReserveAirportId(String id) throws Exception;
	public void reserving(List<ReservationVO> ReservationList, Integer airportId) throws Exception;
	public Integer getLastReservingId() throws Exception;
	public ReservationVO getReserve(Integer reservId) throws Exception;
	public List<ReservationVO> readReserveCustomerId(Integer userCustomerId) throws Exception;
	

	public CustomerVO getUserInfo(String customerId) throws Exception;
	public void updateUserInfo(CustomerVO customer) throws Exception;
	public void deleteUserInfo(String customerId) throws Exception;
	public void deleteUserReserve(String customerId) throws Exception;
	public void cancelReserve(String customerId, Integer airportId) throws Exception;
	public void reserveAll(List<ReservationVO> reservationList) throws Exception;
}
