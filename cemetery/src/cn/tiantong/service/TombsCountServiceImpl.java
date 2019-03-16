package cn.tiantong.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.TombsCountDao;


@Service("tombsCountService")
public class TombsCountServiceImpl implements TombsCountService {
	
	
	@Resource(name="tombsCountDao")
	private TombsCountDao tombsCountDao;
    /**
     * 查询墓穴使用数
     */
	public Integer findRyqkCount(Map<String, Object> map) {
		return tombsCountDao.findRyqkCount(map);
	}
    /**
     * 查询已定墓数
     */
	public Integer findDmpbCount(Map<String, Object> map) {
		return tombsCountDao.findDmpbCount(map);
	}
    /**
     * 查询墓穴总个数
     */
	public Integer findMxgs() {
		return tombsCountDao.findMxgs();
	}


}
