/**
 * 
 */
package com.medical.manager.product.web.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medical.manager.common.dao.IBaseDao;
import com.medical.manager.common.util.DateUtil;
import com.medical.manager.product.web.dao.ITblDeliverProductDao;
import com.medical.manager.product.web.dao.ITblOrderDao;
import com.medical.manager.product.web.model.TblDeliverProduct;
import com.medical.manager.product.web.model.TblOrder;
import com.medical.manager.product.web.service.IOrderService;

/**
 * @author jason
 *
 * 2015-12-2 上午9:43:26
 * 
 * @version 1.0.0
 */
@Transactional
@Service("orderService")
public class OrderServiceImpl implements IOrderService {
    
    @Resource
    private ITblOrderDao tblOrderDao;
    
    @Resource
    private ITblDeliverProductDao tblDeliverProductDao;
    
    @Resource
    private IBaseDao<TblOrder> baseDao;

    @Override
    public List<TblOrder> queryOrderList(Map<String, Object> paramMap) {
        Integer pageNum=(Integer) paramMap.get("page");
        Integer pageSize=(Integer) paramMap.get("rows");
        return this.baseDao.queryWithPage(paramMap, pageNum, pageSize, "queryOrderList");
    }

    @Override
    public void modifyOrder(TblOrder tblOrder) {
        this.tblOrderDao.updateByPrimaryKeySelective(tblOrder);
    }

    @Override
    public void deliverProduct(TblDeliverProduct deliverProduct) {
        deliverProduct.setDeliverTime(DateUtil.getNowTimes());
        this.tblDeliverProductDao.insert(deliverProduct);
    }

}
