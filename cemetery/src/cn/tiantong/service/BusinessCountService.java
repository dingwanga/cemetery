package cn.tiantong.service;

import java.util.List;
import java.util.Map;

import cn.tiantong.entity.BusinessCount;

public interface BusinessCountService {
	/**
	 * 业务信息统计
	 * @param map
	 * @return
	 */
	List<BusinessCount> getBusinessInfo(Map<String,Object> map);

}
