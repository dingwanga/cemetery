package cn.tiantong.dao;

import java.util.List;
import java.util.Map;

import cn.tiantong.entity.BusinessCount;

public interface BusinessCountDao {
	/**
	 * 业务信息统计
	 * @param map
	 * @return
	 */
	List<BusinessCount> getBusinessInfo(Map<String,Object> map);
}
