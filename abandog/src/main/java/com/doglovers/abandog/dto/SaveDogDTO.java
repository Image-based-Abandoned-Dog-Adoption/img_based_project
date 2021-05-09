package com.doglovers.abandog.dto;

public class SaveDogDTO {

	private int cid;
	private int uid;

	public SaveDogDTO() {
		super();
	}

	public SaveDogDTO(int cid, int uid) {
		super();
		this.cid = cid;
		this.uid = uid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

}