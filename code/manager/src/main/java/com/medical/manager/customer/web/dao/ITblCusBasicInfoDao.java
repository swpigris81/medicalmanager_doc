
/**
 * 系统项目名称
 * com.medical.manager.customer.web.dao
 * TblCusBasicInfoDao.java
 * 
 * 2015年12月3日-下午8:14:26
 * 2015版权所有
 * 
 */

package com.medical.manager.customer.web.dao;

import com.medical.manager.customer.web.model.TblCusBasicInfo;

/**
 * @description 客户基本信息管理DAO
 * 
 * @time 2015年12月3日 下午8:14:26
 * @author Jason
 * @version 1.0.0
 * 
 */

public interface ITblCusBasicInfoDao {

	/**
	 * @description 根据id查询客户基本信息
	 * @param id
	 * @return TblCusBasicInfo
	 * @exception 
	 * @author Jason
	 * @since  1.0.0
	 */
	TblCusBasicInfo queryById(String id);
	
	/**
	 * @description 更新客户基本信息
	 * @param basicInfo
	 * @return TblCusBasicInfo
	 * @exception 
	 * @author Jason
	 * @since  1.0.0
	 */
	TblCusBasicInfo update(TblCusBasicInfo basicInfo);
}
