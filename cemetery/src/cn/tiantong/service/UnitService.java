package cn.tiantong.service;

import java.util.List;

import cn.tiantong.entity.Unit;

public interface UnitService {

	
	 //查询所有
		List<Unit> findAll();
		
		//修改单位信息
		Integer modifyUnit(Unit unit);
}
