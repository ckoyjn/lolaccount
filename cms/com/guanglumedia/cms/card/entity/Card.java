package com.guanglumedia.cms.card.entity;


/**
 * 电子劵
 */
public class Card {
	private Long evcnId;//电子劵号
	private Integer epkId;//批次号
	private String evcnUsername;
	private String programeId;//影片ID
	private String userId;//用户卡号
	private String cityId;
	private String evcnShowbatch;
	private Integer evcnOrderStatus;
	private String createTime;
	private String evcnGettime;
	private String evcnOrderTime;
	private String evcnUsetime;//电子劵使用时间
	private Integer validStatus;
	private Integer timeStatus;
	private Integer operateStatus;//电子劵状态
	private String evcnOrderId;
	private String evcnProgrameNames;//影片名称
	private String evcnCityNames;
	private String phone;
	
	public Long getEvcnId() {
		return evcnId;
	}
	public void setEvcnId(Long evcnId) {
		this.evcnId = evcnId;
	}
	public Integer getEpkId() {
		return epkId;
	}
	public void setEpkId(Integer epkId) {
		this.epkId = epkId;
	}
	public String getEvcnUsername() {
		return evcnUsername;
	}
	public void setEvcnUsername(String evcnUsername) {
		this.evcnUsername = evcnUsername;
	}
	public String getProgrameId() {
		return programeId;
	}
	public void setProgrameId(String programeId) {
		this.programeId = programeId;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getEvcnShowbatch() {
		return evcnShowbatch;
	}
	public void setEvcnShowbatch(String evcnShowbatch) {
		this.evcnShowbatch = evcnShowbatch;
	}
	public Integer getEvcnOrderStatus() {
		return evcnOrderStatus;
	}
	public void setEvcnOrderStatus(Integer evcnOrderStatus) {
		this.evcnOrderStatus = evcnOrderStatus;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getEvcnGettime() {
		return evcnGettime;
	}
	public void setEvcnGettime(String evcnGettime) {
		this.evcnGettime = evcnGettime;
	}
	public String getEvcnOrderTime() {
		return evcnOrderTime;
	}
	public void setEvcnOrderTime(String evcnOrderTime) {
		this.evcnOrderTime = evcnOrderTime;
	}
	public String getEvcnUsetime() {
		return evcnUsetime;
	}
	public void setEvcnUsetime(String evcnUsetime) {
		this.evcnUsetime = evcnUsetime;
	}
	public Integer getValidStatus() {
		return validStatus;
	}
	public void setValidStatus(Integer validStatus) {
		this.validStatus = validStatus;
	}
	public Integer getTimeStatus() {
		return timeStatus;
	}
	public void setTimeStatus(Integer timeStatus) {
		this.timeStatus = timeStatus;
	}
	public Integer getOperateStatus() {
		return operateStatus;
	}
	public void setOperateStatus(Integer operateStatus) {
		this.operateStatus = operateStatus;
	}
	public String getEvcnOrderId() {
		return evcnOrderId;
	}
	public void setEvcnOrderId(String evcnOrderId) {
		this.evcnOrderId = evcnOrderId;
	}
	public String getEvcnProgrameNames() {
		return evcnProgrameNames;
	}
	public void setEvcnProgrameNames(String evcnProgrameNames) {
		this.evcnProgrameNames = evcnProgrameNames;
	}
	public String getEvcnCityNames() {
		return evcnCityNames;
	}
	public void setEvcnCityNames(String evcnCityNames) {
		this.evcnCityNames = evcnCityNames;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}