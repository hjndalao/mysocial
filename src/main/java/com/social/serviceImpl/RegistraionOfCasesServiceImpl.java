package com.social.serviceImpl;

import com.social.dao.RegistrationOfCasesMapper;
import com.social.pojo.RegistrationOfCases;
import com.social.service.RegistraionOfCasesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
    public int insert(RegistrationOfCases record) {
        int status = registrationOfCasesMapper.insert(record);
        return status;
    }

    @Override
    public int insertSelective(RegistrationOfCases record) {
        int status = registrationOfCasesMapper.insertSelective(record);
        return status;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public RegistrationOfCases selectByPrimaryKey(Integer id) {
        RegistrationOfCases registrationOfCases = registrationOfCasesMapper.selectByPrimaryKey(id);
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
        List<RegistrationOfCases> registrationOfCasess = registrationOfCasesMapper.caseRegistrationLike(unitName, nameOfRegistrant, organizationalCode, typeStatus, approvalStatus, page, pageNUm);
        return registrationOfCasess;
    }

    @Override
    public Integer pageByLikeSelectCount(String unitName, String nameOfRegistrant, String organizationalCode) {
        Integer count = registrationOfCasesMapper.pageByLikeSelectCount(unitName, nameOfRegistrant, organizationalCode);
        return count;
    }

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

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public Integer caseRegistrationCount(Integer typeStatus, Integer approvalStatus) {
        Integer count = registrationOfCasesMapper.caseRegistrationCount(typeStatus, approvalStatus);
        return count;
    }

    @Override
    public Integer selectAllDailyCount() {
        Integer count = registrationOfCasesMapper.selectAllDailyCount();
        return count;
    }


    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public RegistrationOfCases selectRegistrationOfCases(String unitName, String organizationalCode, String nameOfTheComplainant) {
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
