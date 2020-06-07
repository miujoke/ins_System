package com.project.instrument.entity;

public class InstrumentWithBLOBs extends Instrument {
    private String techTarget;

    private String function;

    private String application;

    public String getTechTarget() {
        return techTarget;
    }

    public void setTechTarget(String techTarget) {
        this.techTarget = techTarget == null ? null : techTarget.trim();
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function == null ? null : function.trim();
    }

    public String getApplication() {
        return application;
    }

    public void setApplication(String application) {
        this.application = application == null ? null : application.trim();
    }
}