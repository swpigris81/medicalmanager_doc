package com.medical.manager.product.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.medical.manager.product.web.model.TblDeliverProduct;
import com.medical.manager.product.web.query.TblDeliverProductExample;

@Repository("tblDeliverProductDao")
public interface ITblDeliverProductDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    int countByExample(TblDeliverProductExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    int deleteByExample(TblDeliverProductExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    int insert(TblDeliverProduct record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    int insertSelective(TblDeliverProduct record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    List<TblDeliverProduct> selectByExample(TblDeliverProductExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    TblDeliverProduct selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") TblDeliverProduct record, @Param("example") TblDeliverProductExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") TblDeliverProduct record, @Param("example") TblDeliverProductExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(TblDeliverProduct record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_deliver_product
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(TblDeliverProduct record);
}