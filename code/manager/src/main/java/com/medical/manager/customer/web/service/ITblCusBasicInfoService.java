
/**
 * 系统项目名称
 * com.medical.manager.customer.web.service
 * ITblCusBasicInfoService.java
 * 
 * 2015年12月3日-下午8:26:05
 * 2015版权所有
 * 
 */

package com.medical.manager.customer.web.service;

import com.medical.manager.customer.web.model.TblCusBasicInfo;

/**
 * @description 客户基本信息管理接口
 * 
 * @time 2015年12月3日 下午8:26:05
 * @author Jason
 * @version 1.0.0
 * 
 */

public interface ITblCusBasicInfoService {
	/**
	 * @description 根据id查询客户基本信息
	 * @param id
	 * @return TblCusBasicInfo
	 * @author Jason
	 * @since  1.0.0
	 */
	TblCusBasicInfo queryById(String id);
	
	/**
	 * @description 更新客户基本信息
	 * @param basicInfo
	 * @return TblCusBasicInfo
	 * @author Jason
	 * @since  1.0.0
	 */
	TblCusBasicInfo update(TblCusBasicInfo basicInfo);
}
