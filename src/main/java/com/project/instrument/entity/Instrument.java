package com.project.instrument.entity;

public class Instrument {
    private Integer id;

    private String insName;

    private String insType;

    private Integer status;

    private Integer adminName;

    private String image;

    private String make;

    private String address;

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

    public String getInsType() {
        return insType;
    }

    public void setInsType(String insType) {
        this.insType = insType == null ? null : insType.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getAdminName() {
        return adminName;
    }

    public void setAdminName(Integer adminName) {
        this.adminName = adminName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make == null ? null : make.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }
}