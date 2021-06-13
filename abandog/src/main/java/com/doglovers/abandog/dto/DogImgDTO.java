package com.doglovers.abandog.dto;

public class DogImgDTO {
	
	private String[] cids_arr;
	private int startList;
	
	
	public DogImgDTO() {
		super();
	}

	public DogImgDTO(String[] cids_arr, int startList) {
		super();
		this.cids_arr = cids_arr;
		this.startList = startList;
	}

	public String[] getCids_arr() {
		return cids_arr;
	}

	public void setCids_arr(String[] cids_arr) {
		this.cids_arr = cids_arr;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}
	

	
}