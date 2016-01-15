/**
 * 
 */
package com.medical.manager.product.web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medical.manager.common.dao.IBaseDao;
import com.medical.manager.common.util.DateUtil;
import com.medical.manager.product.web.dao.ITblMachineCodeDao;
import com.medical.manager.product.web.model.TblMachineCode;
import com.medical.manager.product.web.model.TblMachineUse;
import com.medical.manager.product.web.service.IMachineCodeService;

/**
 * @author jason
 *
 * 2015-12-2 上午9:44:11
 * 
 * @version 1.0.0
 */
@Transactional
@Service("machineCodeService")
public class MachineCodeServiceImpl implements IMachineCodeService {
    
    @Resource
    private ITblMachineCodeDao tblMachineCodeDao;
    
    @Resource
    private IBaseDao baseDao;

    @Override
    public List<TblMachineCode> queryMachineCodeList(Integer pageNum, Integer pageSize, String useStatus) {
        Map<String, String> paramMap=new HashMap<String, String>();
        paramMap.put("useStatus", useStatus);
        return this.baseDao.queryWithPage(paramMap, pageNum, pageSize, "queryMachineCodeList");
    }

    @Override
    public void produceMachineCodes(Integer number) {
        List<TblMachineCode> machineCodes=new ArrayList<TblMachineCode>();
        TblMachineCode machineCode=null;
        for (int i = 0; i < number; i++) {
            machineCode=new TblMachineCode();
            //TODO 机器码生成规则
            machineCode.setCode("a"+number);
            machineCode.setUseStatus("N");
            machineCode.setCreateTime(DateUtil.getNowTimes());
            machineCodes.add(machineCode);
        }
        this.tblMachineCodeDao.saveMachineCodes(machineCodes);
    }

    @Override
    public List<TblMachineUse> queryMachineUseList(Integer pageNum, Integer pageSize, String phoneNumber) {
        Map<String, String> paramMap=new HashMap<String, String>();
        paramMap.put("phoneNumber", phoneNumber);
        return this.baseDao.queryWithPage(paramMap, pageNum, pageSize, "queryMachineUseList");
    }

}
