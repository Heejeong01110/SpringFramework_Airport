package org.kpu.myweb.domain;

public class ReservationVO {
	private int reservId;
	private int airportId;
	private int customerId;
	private int reserveSeat;
	private String reserveTime;
	private int reservePrice;
	private int reserveSuccess;
	private String reserveName;
	private String reservePassport;
	
	
	public int getReservId() {
		return reservId;
	}
	public void setReservId(int reservId) {
		this.reservId = reservId;
	}
	public int getAirportId() {
		return airportId;
	}
	public void setAirportId(int airportId) {
		this.airportId = airportId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getReserveSeat() {
		return reserveSeat;
	}
	public void setReserveSeat(int reserveSeat) {
		this.reserveSeat = reserveSeat;
	}
	public String getReserveTime() {
		return reserveTime;
	}
	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}
	public int getReservePrice() {
		return reservePrice;
	}
	public void setReservePrice(int reservePrice) {
		this.reservePrice = reservePrice;
	}
	public int getReserveSuccess() {
		return reserveSuccess;
	}
	public void setReserveSuccess(int reserveSuccess) {
		this.reserveSuccess = reserveSuccess;
	}
	public String getReserveName() {
		return reserveName;
	}
	public void setReserveName(String reserveName) {
		this.reserveName = reserveName;
	}
	public String getReservePassport() {
		return reservePassport;
	}
	public void setReservePassport(String reservePassport) {
		this.reservePassport = reservePassport;
	}
	@Override
	public String toString() {
		return "ReservationVO [reservId=" + reservId + ", airportId=" + airportId + ", customerId=" + customerId + ", reserveSeat=" + reserveSeat + ", reserveTime="
				+ reserveTime + ", reservePrice=" + reservePrice +  ", reserveSuccess=" + reserveSuccess + "]";
	}
	
}
