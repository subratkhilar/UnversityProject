package com.institute.bean;

public class Event {
	
	private int eventId;
	private String eventName;
	// test
	private String createdDate;
	private String item;
	private String qty;
	private String estmatedPrice;
	private String actPrice;
	private String comment;
	
	
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getEstmatedPrice() {
		return estmatedPrice;
	}
	public void setEstmatedPrice(String estmatedPrice) {
		this.estmatedPrice = estmatedPrice;
	}
	public String getActPrice() {
		return actPrice;
	}
	public void setActPrice(String actPrice) {
		this.actPrice = actPrice;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	//end
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	

}
