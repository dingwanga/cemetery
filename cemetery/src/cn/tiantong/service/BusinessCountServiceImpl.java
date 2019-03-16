package cn.tiantong.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.BusinessCountDao;
import cn.tiantong.entity.BusinessCount;
@Service("businessCountService")
public class BusinessCountServiceImpl implements BusinessCountService {
	@Resource(name="businessCountDao")
	private BusinessCountDao businessCountDao;
    /**
     * 业务信息统计
     */
	public List<BusinessCount> getBusinessInfo(Map<String, Object> map) {
		List<BusinessCount> businessCounts = businessCountDao.getBusinessInfo(map);
		return businessCounts;
	}

}
