package com.wan.basis.dto;

public class massageDTO {
	private String targetid;
	private String sender;
	private String massage;
	
	public massageDTO() {
		super();
	}
	public massageDTO(String targetid, String sender, String massage)
    {
        super();
        System.out.println(targetid+", "+sender+", "+massage);
        this.targetid = targetid;
        this.sender = sender;
        this.massage = massage;

    }
	
	public String getTargetid() {
		return targetid;
	}
	public void setTargetid(String targetid) {
		this.targetid = targetid;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMassage() {
		return massage;
	}
	
	public void setMassage(String massage) {
		this.massage = massage;
	}
	@Override
	public String toString() {
		return "massageDTO [targetid=" + targetid + ", sender=" + sender + ", massage=" + massage + "]";
	}
	
}
