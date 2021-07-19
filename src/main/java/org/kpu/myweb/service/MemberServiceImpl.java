package org.kpu.myweb.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.AirportVO;
import org.kpu.myweb.domain.CustomerVO;
import org.kpu.myweb.domain.ReservationVO;
import org.kpu.myweb.persistence.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.cj.Session;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	
	//로그인 체크
	public boolean loginCheck(String id, String passwd, HttpSession session) throws Exception{
		boolean result = memberDAO.signin(id, passwd);
		
		if(result) {
			CustomerVO vo = memberDAO.getUserInfoById(id);
			session.setAttribute("userId", id);
			session.setAttribute("userName", vo.getName());
			session.setAttribute("userCustomerId", vo.getCustomerId());
		}
		return result;
	}
	
	//로그아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	//회원가입
	public boolean signUp(CustomerVO vo) throws Exception{
		return memberDAO.signUp(vo);
	}
	
	
	//항공기 리스트 읽기
	public List<AirportVO> readAirportList() throws Exception{
		return memberDAO.getAirportList();
	}
	
	
	//항공기 한개 읽기
	public AirportVO readAirport(String id) throws Exception{
		return memberDAO.getAirport(id);
	}
	
	//항공기id에 따른 예약내역
	public List<ReservationVO> readReserveAirportId(String id) throws Exception{
		return memberDAO.getReserveByAirport(id);
	}
	
	//예약시 전체 인원수 다운
	public void decreaseSeat(Integer airportId) throws Exception{
		memberDAO.decreaseSeat(airportId);
	}

	public void increaseSeat(Integer airportId) throws Exception{
		memberDAO.increaseSeat(airportId);
	}
	
	//예약중
	@Transactional (propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, timeout=10 )
	public void reserving(List<ReservationVO> ReservationList, Integer airportId) throws Exception{
		for(ReservationVO vo : ReservationList) {
			memberDAO.addReservation(vo);
			memberDAO.decreaseSeat(airportId);
		}
	}
	public Integer getLastReservingId() throws Exception{
		return memberDAO.getLastReservingId();
	}
	

	public ReservationVO getReserve(Integer reservId) throws Exception{
		return memberDAO.getResertvation(reservId.toString());
	}
	
	//사용자id에 따른 예약내역
	public List<ReservationVO> readReserveCustomerId(Integer userCustomerId) throws Exception{
		return memberDAO.getReserveByCustomer(userCustomerId);
	}
	
	public CustomerVO getUserInfo(String customerId) throws Exception{
		return memberDAO.getUserInfoBycId(customerId);
	}

	public void updateUserInfo(CustomerVO customer) throws Exception{
		memberDAO.updateUserInfo(customer);
	}
	public void deleteUserInfo(String customerId) throws Exception{
		memberDAO.deleteUserInfo(customerId);
	}
	

	public void deleteUserReserve(String customerId) throws Exception{
		memberDAO.deleteUserReserve(customerId);
	}
	
	@Transactional ( propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, timeout=10 )
	public void cancelReserve(String customerId, Integer airportId) throws Exception{
		memberDAO.deleteReservation(customerId);
		memberDAO.increaseSeat(airportId);
	}
	

	public void reserveAll(List<ReservationVO> reservationList) throws Exception{
		for(ReservationVO reservation : reservationList) {
			memberDAO.addReservation(reservation);
		}
	}
}
