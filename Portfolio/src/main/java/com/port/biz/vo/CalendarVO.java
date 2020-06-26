package com.port.biz.vo;

public class CalendarVO {
	private int year;
    private int month;
    private int day;
    private int week;
    private String date;
    private BookVO reserveVo;
    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
    }
    public int getMonth() {
        return month;
    }
    public void setMonth(int month) {
        this.month = month;
    }
    public int getDay() {
        return day;
    }
    public void setDay(int day) {
        this.day = day;
    }
    public int getWeek() {
        return week;
    }
    public void setWeek(int week) {
        this.week = week;
    }
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public BookVO getReserveVo() {
		return reserveVo;
	}
	public void setReserveVo(BookVO reserveVo) {
		this.reserveVo = reserveVo;
	}
    

}
