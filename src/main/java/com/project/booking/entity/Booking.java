package com.project.booking.entity;

import java.util.Date;

public class Booking {
    private Integer id;

    private String insName;

    private String proName;

    private String proSource;

    private String proNumber;

    private String proPerson;

    private String proPersonMobile;

    private String bookingPerson;

    private String bookingPersonMobile;

    private String bookingPersonNumber;

    private Integer bookingOperationSkill;

    private Date bookingStartTime;

    private Date bookingStopTime;

    private Integer auditing;


    private String statTime;

    public String getStatTime() {
        return statTime;
    }

    public void setStatTime(String statTime) {
        this.statTime = statTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    private String endTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInsName() {
        return insName;
    }

    public void setInsName(String insName) {
        this.insName = insName == null ? null : insName.trim();
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName == null ? null : proName.trim();
    }

    public String getProSource() {
        return proSource;
    }

    public void setProSource(String proSource) {
        this.proSource = proSource == null ? null : proSource.trim();
    }

    public String getProNumber() {
        return proNumber;
    }

    public void setProNumber(String proNumber) {
        this.proNumber = proNumber == null ? null : proNumber.trim();
    }

    public String getProPerson() {
        return proPerson;
    }

    public void setProPerson(String proPerson) {
        this.proPerson = proPerson == null ? null : proPerson.trim();
    }

    public String getProPersonMobile() {
        return proPersonMobile;
    }

    public void setProPersonMobile(String proPersonMobile) {
        this.proPersonMobile = proPersonMobile == null ? null : proPersonMobile.trim();
    }

    public String getBookingPerson() {
        return bookingPerson;
    }

    public void setBookingPerson(String bookingPerson) {
        this.bookingPerson = bookingPerson == null ? null : bookingPerson.trim();
    }

    public String getBookingPersonMobile() {
        return bookingPersonMobile;
    }

    public void setBookingPersonMobile(String bookingPersonMobile) {
        this.bookingPersonMobile = bookingPersonMobile == null ? null : bookingPersonMobile.trim();
    }

    public String getBookingPersonNumber() {
        return bookingPersonNumber;
    }

    public void setBookingPersonNumber(String bookingPersonNumber) {
        this.bookingPersonNumber = bookingPersonNumber == null ? null : bookingPersonNumber.trim();
    }

    public Integer getBookingOperationSkill() {
        return bookingOperationSkill;
    }

    public void setBookingOperationSkill(Integer bookingOperationSkill) {
        this.bookingOperationSkill = bookingOperationSkill;
    }

    public Date getBookingStartTime() {
        return bookingStartTime;
    }

    public void setBookingStartTime(Date bookingStartTime) {
        this.bookingStartTime = bookingStartTime;
    }

    public Date getBookingStopTime() {
        return bookingStopTime;
    }

    public void setBookingStopTime(Date bookingStopTime) {
        this.bookingStopTime = bookingStopTime;
    }

    public Integer getAuditing() {
        return auditing;
    }

    public void setAuditing(Integer auditing) {
        this.auditing = auditing;
    }
}