package com.model;

public class RetrieveAll {
	
	private String nameRequester, lat_Building, long_Building, lat_Service, long_Service;
	private String dateFinished, dateStarted, namePackage, urlPicture;
	private int zipCode;

	public String getNameRequester() {
		return nameRequester;
	}

	public void setNameRequester(String nameRequester) {
		this.nameRequester = nameRequester;
	}

	public String getLong_Building() {
		return long_Building;
	}

	public void setLong_Building(String long_Building) {
		this.long_Building = long_Building;
	}

	public String getLat_Building() {
		return lat_Building;
	}

	public void setLat_Building(String lat_Building) {
		this.lat_Building = lat_Building;
	}

	public String getLat_Service() {
		return lat_Service;
	}

	public void setLat_Service(String lat_Service) {
		this.lat_Service = lat_Service;
	}

	public String getLong_Service() {
		return long_Service;
	}

	public void setLong_Service(String long_Service) {
		this.long_Service = long_Service;
	}

	public String getDateStarted() {
		return dateStarted;
	}

	public void setDateStarted(String dateStarted) {
		this.dateStarted = dateStarted;
	}

	public String getUrlPicture() {
		return urlPicture;
	}

	public void setUrlPicture(String urlPicture) {
		this.urlPicture = urlPicture;
	}

	public String getDateFinished() {
		return dateFinished;
	}

	public void setDateFinished(String dateFinished) {
		this.dateFinished = dateFinished;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getNamePackage() {
		return namePackage;
	}

	public void setNamePackage(String namePackage) {
		this.namePackage = namePackage;
	}

}
