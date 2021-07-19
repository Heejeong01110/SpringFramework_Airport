package org.kpu.myweb.domain;

public class AirportVO {
	private int airportlistId;
	private int airportId;
	private int price;
	private int passengerNumber;
	private String departureTime;
	private String arriveTime;
	private String departureCountry;
	private String arriveCountry;
	
	public int getAirportlistId() {
		return airportlistId;
	}
	public void setAirportlistId(int airportlistId) {
		this.airportlistId = airportlistId;
	}
	public int getAirportId() {
		return airportId;
	}
	public void setAirportId(int airportId) {
		this.airportId = airportId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPassengerNumber() {
		return passengerNumber;
	}
	public void setPassengerNumber(int passengerNumber) {
		this.passengerNumber = passengerNumber;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public String getArriveTime() {
		return arriveTime;
	}
	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
	}
	public String getDepartureCountry() {
		return departureCountry;
	}
	public void setDepartureCountry(String departureCountry) {
		this.departureCountry = departureCountry;
	}
	public String getArriveCountry() {
		return arriveCountry;
	}
	public void setArriveCountry(String arriveCountry) {
		this.arriveCountry = arriveCountry;
	}
	
	@Override
	public String toString() {
		return "AirportVO [airportlistId=" + airportlistId + ", airportId=" + airportId + ", price=" + price + ", passengerNumber=" + passengerNumber + ", departureTime="
				+ departureTime + ", arriveTime=" + arriveTime + ", departureCountry=" + departureCountry + ", arriveCountry=" + arriveCountry + "]";
	}

	
	
	
}
