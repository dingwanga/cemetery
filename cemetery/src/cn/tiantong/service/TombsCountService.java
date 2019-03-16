package cn.tiantong.service;

import java.util.Map;

import cn.tiantong.entity.Kzcx;

public interface TombsCountService {
	//查询墓穴使用数
	Integer findRyqkCount(Map<String,Object> map);
	//查询已定墓数
	Integer findDmpbCount(Map<String,Object> map);
	//查询墓穴总个数
	Integer findMxgs();

}
