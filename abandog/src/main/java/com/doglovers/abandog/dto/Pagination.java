package com.doglovers.abandog.dto;

public class Pagination {
	
	private int listSize;
	private int startList;
	private int gender;
	private int neuter;
	private int location;
	private int uid;
	private String kind;
	private String age;
	private String marks;
	
	public Pagination() {
		super();
	}
	
	public Pagination(int listSize, int startList, int gender, int neuter, int location, int uid, String kind,
			String age, String marks) {
		super();
		this.listSize = listSize;
		this.startList = startList;
		this.gender = gender;
		this.neuter = neuter;
		this.location = location;
		this.uid = uid;
		this.kind = kind;
		this.age = age;
		this.marks = marks;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getNeuter() {
		return neuter;
	}

	public void setNeuter(int neuter) {
		this.neuter = neuter;
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getMarks() {
		return marks;
	}

	public void setMarks(String marks) {
		this.marks = marks;
	}

}