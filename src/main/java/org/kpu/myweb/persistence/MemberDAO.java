package org.kpu.myweb.persistence;

import java.util.List;

import org.kpu.myweb.domain.AirportVO;
import org.kpu.myweb.domain.CustomerVO;
import org.kpu.myweb.domain.ReservationVO;

public interface MemberDAO {

	public boolean signUp(CustomerVO customer) throws Exception;
	public boolean signin(String id, String passwd) throws Exception;
	public CustomerVO getUserInfoBycId(String customerId) throws Exception;
	public CustomerVO getUserInfoById(String id) throws Exception;
	public void updateUserInfo(CustomerVO customer) throws Exception;
	public void deleteUserInfo(String customerId) throws Exception;
	public void deleteUserReserve(String customerId) throws Exception;
	public boolean checkid(String id) throws Exception;
	
	

	public void addAirport(AirportVO airport) throws Exception;
	public List<AirportVO> getAirportList() throws Exception;
	public AirportVO getAirport(String airportlistId) throws Exception;
	public void updateAirportInfo(AirportVO airport) throws Exception;
	public void deleteAirportInfo(String airportlistId) throws Exception;
	
	
	public void addReservation(ReservationVO resevation) throws Exception;
	public List<ReservationVO> getReservationList(String customerId) throws Exception;
	public ReservationVO getResertvation(String reservId) throws Exception;
	public void updateReservation(ReservationVO resevation) throws Exception;
	public void deleteReservation(String reservId) throws Exception;
	public List<ReservationVO> getReserveByAirport(String airportlistId) throws Exception;
	public List<ReservationVO> getReserveByCustomer(Integer userCustomerId) throws Exception;
	

	public void addReserving(Integer seat) throws Exception;
	public void decreaseSeat(Integer airportId) throws Exception;
	public void increaseSeat(Integer airportId) throws Exception;
	public Integer getLastReservingId() throws Exception;
	
	
	
	

}
