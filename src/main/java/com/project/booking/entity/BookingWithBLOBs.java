package com.project.booking.entity;

public class BookingWithBLOBs extends Booking {
    private String sample;

    private String bookingEvent;

    private String feeScale;

    private String feeSource;

    private String modify;

    public String getSample() {
        return sample;
    }

    public void setSample(String sample) {
        this.sample = sample == null ? null : sample.trim();
    }

    public String getBookingEvent() {
        return bookingEvent;
    }

    public void setBookingEvent(String bookingEvent) {
        this.bookingEvent = bookingEvent == null ? null : bookingEvent.trim();
    }

    public String getFeeScale() {
        return feeScale;
    }

    public void setFeeScale(String feeScale) {
        this.feeScale = feeScale == null ? null : feeScale.trim();
    }

    public String getFeeSource() {
        return feeSource;
    }

    public void setFeeSource(String feeSource) {
        this.feeSource = feeSource == null ? null : feeSource.trim();
    }

    public String getModify() {
        return modify;
    }

    public void setModify(String modify) {
        this.modify = modify == null ? null : modify.trim();
    }
}