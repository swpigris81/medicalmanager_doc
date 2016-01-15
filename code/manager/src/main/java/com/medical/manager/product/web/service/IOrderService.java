/**
 * 
 */
package com.medical.manager.product.web.service;

import java.util.List;
import java.util.Map;

import com.medical.manager.product.web.model.TblDeliverProduct;
import com.medical.manager.product.web.model.TblOrder;

/**
 * @author Jason
 *
 * 2015-12-2 上午9:36:20
 * 
 * @version 1.0.0
 */
public interface IOrderService {

    /**
     * 查询订单信息
     * (这里描述这个方法适用条件 – 可选)
     * @param paramMap
     * @return
     * @exception
     * @since 1.0.0
     */
    List<TblOrder> queryOrderList(Map<String, Object> paramMap);

    /**
     * 修改订单状态
     * (这里描述这个方法适用条件 – 可选)
     * @param tblOrder
     * @exception
     * @since 1.0.0
     */
    void modifyOrder(TblOrder tblOrder);

    /**
     * 订单发货
     * (这里描述这个方法适用条件 – 可选)
     * @param deliverProduct
     * @exception
     * @since 1.0.0
     */
    void deliverProduct(TblDeliverProduct deliverProduct);

}
