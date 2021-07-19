package org.kpu.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kpu.myweb.domain.AirportVO;
import org.kpu.myweb.domain.CustomerVO;
import org.kpu.myweb.domain.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String airportNamespace = "org.kpu.myweb.mapper.AirportMapper";
	private static final String customerNamespace = "org.kpu.myweb.mapper.CustomerMapper";
	private static final String reservationNamespace = "org.kpu.myweb.mapper.ReservationMapper";
	
	//customer
	public boolean signUp(CustomerVO customer) throws Exception{
		String id = customer.getId();
		int count = sqlSession.selectOne(customerNamespace+".checkid",id);
		if(count == 0) {
			sqlSession.insert(customerNamespace+".insert",customer);
			return true;
		}else {
			return false;
		}
	}
	
	//로그인 체크
	public boolean signin(String id, String passwd) throws Exception{
		int count = sqlSession.selectOne(customerNamespace+".checkid",id);
		
		if(count == 0) {
			return false;
		}
		String dbPasswd = sqlSession.selectOne(customerNamespace+".getPasswd", id);
		
		if(dbPasswd.equals(passwd)) {
			return true;
		}else {
			return false;
		}
	}
	
	//로그인 정보
	public CustomerVO getUserInfoBycId(String id) throws Exception{
		CustomerVO vo = sqlSession.selectOne(customerNamespace+".selectByCustomerid", id);
		return vo;   
	}
	//로그인 정보
	public CustomerVO getUserInfoById(String customerId) throws Exception{
		CustomerVO vo = sqlSession.selectOne(customerNamespace+".selectByid", customerId);
		return vo;   
	}
	public void updateUserInfo(CustomerVO customer) throws Exception{
	    sqlSession.update(customerNamespace + ".update", customer);
	}
	
	public void deleteUserInfo(String customerId) throws Exception{
		sqlSession.delete(customerNamespace + ".delete", customerId);
	}
	
	//예약내역 삭제
	public void deleteUserReserve(String customerId) throws Exception{
		sqlSession.delete(reservationNamespace+".deleteCustomer",customerId);
	}
	//아이디 중복 확인
	public boolean checkid(String id) throws Exception{
		int count = sqlSession.selectOne(customerNamespace+".checkid",id);
		if(count == 0) {
			return true;
		}else {
			return false;
		}
	}
	
	
	//airport
	public void addAirport(AirportVO airport) throws Exception{
		sqlSession.insert(airportNamespace + ".insert", airport);
		
	}
	public List<AirportVO> getAirportList() throws Exception{
		List<AirportVO> airportList = new ArrayList<AirportVO>();
		airportList = sqlSession.selectList(airportNamespace + ".selectAll");
		return airportList;
		
	}
	public AirportVO getAirport(String airportlistId) throws Exception{
		AirportVO vo = sqlSession.selectOne(airportNamespace+".selectByid", airportlistId);
		return vo;   
	}
	public void updateAirportInfo(AirportVO airport) throws Exception{
	    sqlSession.update(airportNamespace + ".update", airport);
	}
	public void deleteAirportInfo(String airportlistId) throws Exception{
		sqlSession.delete(airportNamespace + ".delete", airportlistId);
	}
	public void decreaseSeat(Integer airporlisttId) throws Exception{
		sqlSession.update(airportNamespace+".decreaseSeat",airporlisttId);
	}

	public void increaseSeat(Integer airportId) throws Exception{
		sqlSession.update(airportNamespace+".increaseSeat",airportId);
	}
	
	
	//reservation
	public void addReservation(ReservationVO resevation) throws Exception{
		sqlSession.insert(reservationNamespace + ".insert", resevation);
	}
	public List<ReservationVO> getReservationList(String customerId) throws Exception{
		List<ReservationVO> customerList = new ArrayList<ReservationVO>();
		customerList = sqlSession.selectList(reservationNamespace + ".selectByCustomer",customerId);
		return customerList;
	}
	public ReservationVO getResertvation(String reservId) throws Exception{
		ReservationVO vo = sqlSession.selectOne(reservationNamespace+".selectByReservid", reservId);
		return vo;   
	}
	public void updateReservation(ReservationVO resevation) throws Exception{
	    sqlSession.update(reservationNamespace + ".update", resevation);
	}
	public void deleteReservation(String reservId) throws Exception{
	    sqlSession.delete(reservationNamespace + ".delete", reservId);
	}

	public List<ReservationVO> getReserveByAirport(String airportId) throws Exception{
		List<ReservationVO> customerList = new ArrayList<ReservationVO>();
		customerList = sqlSession.selectList(reservationNamespace + ".selectByAirport",airportId);
		return customerList;
	}

	public List<ReservationVO> getReserveByCustomer(Integer customerId) throws Exception{
		List<ReservationVO> customerList = new ArrayList<ReservationVO>();
		customerList = sqlSession.selectList(reservationNamespace + ".selectByCustomer",customerId);
		return customerList;
	}
	
	
	public void addReserving(Integer seat) throws Exception{
		sqlSession.insert(reservationNamespace + ".insert", seat);
	}
	
	public Integer getLastReservingId() throws Exception{
		Integer reservId = sqlSession.selectOne(reservationNamespace+".getLastId");
		return reservId;
	}
	

	
}
