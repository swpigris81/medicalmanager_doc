
/**
 * 系统项目名称
 * com.medical.manager.customer.web.model
 * TblCusBasicInfo.java
 * 
 * 2015年12月3日-下午8:19:25
 * 2015版权所有
 * 
 */

package com.medical.manager.customer.web.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @description 客户基本信息管理实体
 * 
 * @time 2015年12月3日 下午8:19:25
 * @author Jason
 * @version 1.0.0
 * 
 */

public class TblCusBasicInfo implements Serializable{
	private static final long serialVersionUID = 8534128332361064767L;
	private Long id;
	private String nickname;
	private String realName;
	private String phone;
	private String idCardNo;
	private String cusType;
	private String province;
	private String city;
	private String county;
	private Date registerTime;
	private Date serviceExpireTime;
	private Long creditScore;
	private String lastLoginIp;
	private Date lastLoginTime;
	private String activationFlag;
	private Date activationTime;
	private String activationUser;
	private String lockFlag;
	private Date lockTime;
	private String lockUser;
	private String remark;
	private String updateUser;
	private Date updateTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIdCardNo() {
		return idCardNo;
	}

	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}

	public String getCusType() {
		return cusType;
	}

	public void setCusType(String cusType) {
		this.cusType = cusType;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Date getServiceExpireTime() {
		return serviceExpireTime;
	}

	public void setServiceExpireTime(Date serviceExpireTime) {
		this.serviceExpireTime = serviceExpireTime;
	}

	public Long getCreditScore() {
		return creditScore;
	}

	public void setCreditScore(Long creditScore) {
		this.creditScore = creditScore;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getActivationFlag() {
		return activationFlag;
	}

	public void setActivationFlag(String activationFlag) {
		this.activationFlag = activationFlag;
	}

	public Date getActivationTime() {
		return activationTime;
	}

	public void setActivationTime(Date activationTime) {
		this.activationTime = activationTime;
	}

	public String getActivationUser() {
		return activationUser;
	}

	public void setActivationUser(String activationUser) {
		this.activationUser = activationUser;
	}

	public String getLockFlag() {
		return lockFlag;
	}

	public void setLockFlag(String lockFlag) {
		this.lockFlag = lockFlag;
	}

	public Date getLockTime() {
		return lockTime;
	}

	public void setLockTime(Date lockTime) {
		this.lockTime = lockTime;
	}

	public String getLockUser() {
		return lockUser;
	}

	public void setLockUser(String lockUser) {
		this.lockUser = lockUser;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
