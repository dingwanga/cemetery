package cn.tiantong.service;

import java.util.List;
import java.util.Map;

import cn.tiantong.entity.Symx;

public interface SymxService {
	/**
	 * 业务信息统计
	 * @param map
	 * @return
	 */
	List<Symx> getSymxCount(Map<String,Object> map);

}
