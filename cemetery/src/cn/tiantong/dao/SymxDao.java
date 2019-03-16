package cn.tiantong.dao;

import java.util.List;
import java.util.Map;

import cn.tiantong.entity.Symx;

public interface SymxDao {
	/**
	 * 业务信息统计
	 * @param map
	 * @return
	 */
	List<Symx> getSymxCount(Map<String,Object> map);

}
