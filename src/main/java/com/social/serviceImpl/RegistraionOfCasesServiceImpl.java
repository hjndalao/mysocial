package com.social.serviceImpl;

import com.social.dao.RegistrationOfCasesMapper;
import com.social.pojo.RegistrationOfCases;
import com.social.service.RegistraionOfCasesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class RegistraionOfCasesServiceImpl implements RegistraionOfCasesService {
    @Autowired
    private RegistrationOfCasesMapper registrationOfCasesMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int status = registrationOfCasesMapper.deleteByPrimaryKey(id);
        return status;
    }

    @Override
    public int insert(RegistrationOfCases registrationOfCases) {
        //日期格式转换
        Date date = new Date();
        //设置当前年月日格式
        SimpleDateFormat yyyy_mm_dd = new SimpleDateFormat("yyyy-MM-dd");
        //设置当前月份格式
        SimpleDateFormat mm = new SimpleDateFormat("MM");
        //将时间转换成年月日
        String yyyy = yyyy_mm_dd.format(date);
        //将时间转换成月份
        String mms = mm.format(date);
        //设置登记时间
        registrationOfCases.setRegistrationTime(yyyy);
        //类型状态 (1、立案登记 2、日常审批 3、专项审批)
        if (registrationOfCases.getTypeStatus() == null) registrationOfCases.setTypeStatus(1);
        //审批状态 (0：提交未审批，1：审批通过，2：审批未通过，3：结案归档, 4 : 立案未提交);
        if (registrationOfCases.getApprovalStatus() == null) registrationOfCases.setApprovalStatus(4);
        //立案月
        registrationOfCases.setFilingMonth(Integer.valueOf(mms));
        //插入操作
        int status = registrationOfCasesMapper.insert(registrationOfCases);
        //返回插入数据状态(成功 or 失败)
        return status;
    }
    //动态sql插入方法
    @Override
    public int insertSelective(RegistrationOfCases record) {
        //动态插入操作
        int status = registrationOfCasesMapper.insertSelective(record);
        //返回插入数据状态(成功 or 失败)
        return status;
    }
    //根据主键查询数据
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public RegistrationOfCases selectByPrimaryKey(Integer id) {
        //主键查询方法
        RegistrationOfCases registrationOfCases = registrationOfCasesMapper.selectByPrimaryKey(id);
        //返回对象
        return registrationOfCases;
    }

    @Override
    public int updateByPrimaryKeySelective(RegistrationOfCases record) {
        int status = registrationOfCasesMapper.updateByPrimaryKeySelective(record);
        return status;
    }

    @Override
    public int updateByPrimaryKey(RegistrationOfCases record) {
        registrationOfCasesMapper.updateByPrimaryKey(record);
        return 0;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public List<RegistrationOfCases> caseRegistrationPage(Integer typeStatus, Integer approvalStatus, Integer page, Integer pageNum) {
        List<RegistrationOfCases> registrationOfCases = registrationOfCasesMapper.caseRegistrationPage(typeStatus, approvalStatus, page, pageNum);
        return registrationOfCases;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public List<RegistrationOfCases> caseRegistrationLike(String unitName, String nameOfRegistrant, String organizationalCode, Integer typeStatus, Integer approvalStatus, Integer page, Integer pageNUm) {
        if ("%%".equals(unitName)) unitName = null;
        if ("%%".equals(nameOfRegistrant)) nameOfRegistrant = null;
        if ("%%".equals(organizationalCode)) organizationalCode = null;
        List<RegistrationOfCases> registrationOfCasess = registrationOfCasesMapper.caseRegistrationLike(unitName, nameOfRegistrant, organizationalCode, typeStatus, approvalStatus, page, pageNUm);
        return registrationOfCasess;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public List<RegistrationOfCases> selectAllDaily(Integer page, Integer pageNUm) {
        List<RegistrationOfCases> registrationOfCases = registrationOfCasesMapper.selectAllDaily(page, pageNUm);
        return registrationOfCases;
    }

    @Override
    public int updateStatus(Integer approvalStatus, Integer typeStatus, Integer id) {
        int status = registrationOfCasesMapper.updateStatus(approvalStatus, typeStatus, id);
        return status;
    }

    //案件登记所有条数以及模糊查询返回条数
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public Integer caseRegistrationCount(String unitName, String nameOfRegistrant, String organizationalCode, Integer typeStatus, Integer approvalStatus) {
        if ("%%".equals(unitName)) unitName = null;
        if ("%%".equals(nameOfRegistrant)) nameOfRegistrant = null;
        if ("%%".equals(organizationalCode)) organizationalCode = null;
        Integer count = registrationOfCasesMapper.caseRegistrationCount(unitName, nameOfRegistrant, organizationalCode, typeStatus, approvalStatus);
        return count;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public Integer selectAllDailyCount() {
        Integer count = registrationOfCasesMapper.selectAllDailyCount();
        return count;
    }


    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public RegistrationOfCases selectRegistrationOfCases(String unitName, String organizationalCode, String nameOfTheComplainant) {
        if ("%%".equals(unitName)) unitName = null;
        if ("%%".equals(nameOfTheComplainant)) nameOfTheComplainant = null;
        if ("%%".equals(organizationalCode)) organizationalCode = null;
        RegistrationOfCases registrationOfCases = registrationOfCasesMapper.selectRegistrationOfCases(unitName, organizationalCode, nameOfTheComplainant);
        return registrationOfCases;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public Map<String, Object> selectBypage(int pare, int number) {
        Map<String, Object> stringObjectMap = registrationOfCasesMapper.selectBypage(pare, number);
        return stringObjectMap;
    }

	/*public Map<String, String> insertRegistrationOfCases(RegistrationOfCases registraion) {
		Map<String, String> map = new HashMap();
		int rows = 
				registrationOfCasesMapper.insertSelective(registraion);
		if (rows == 0) {
			throw new RuntimeException("数据添加失败");
		}
		map.put("code", "添加成功");
		return map;
	}

	public Map<String, Object> selectRegistrationOfCases(String unitName, String organizationalCode,
			String nameOfTheComplainant) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		RegistrationOfCases registrationOfCases = new RegistrationOfCases();
		registrationOfCases = registrationOfCasesMapper.selectRegistrationOfCases(
				unitName,organizationalCode,nameOfTheComplainant);
		if (registrationOfCases == null) {
			throw new RuntimeException("查询失败");
		}
		map.put("data",registrationOfCases);
		return map;
	}

	public Map<String, Object> selectBypage(int pare, int number) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> bypageMap = registrationOfCasesMapper.selectBypage(pare,number);
		if (bypageMap == null) {
			throw new RuntimeException("查询失败");
		}
		map.put("data", bypageMap);
		return map;
	}

	public Map<String, String> deleteRegistrationOfCases(Integer id) {
		Map<String, String> map = new HashMap<String, String>();
		int rows = registrationOfCasesMapper.deleteByPrimaryKey(id);
		if (rows == 0) {
			throw new RuntimeException("删除失败");
		}
		map.put("code", "删除成功");
		return map;
	}

	public Map<String, String> updateRegistrationOfCases(RegistrationOfCases registrationOfCases) {
		Map<String, String> map = new HashMap<String, String>();
		int rows = registrationOfCasesMapper.updateByPrimaryKeySelective(registrationOfCases);
		if (rows == 0) {
			throw new RuntimeException("修改失败");
		}
		map.put("code", "修改成功");
		return map;
	}*/

}
