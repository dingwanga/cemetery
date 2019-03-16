package cn.tiantong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.UnitDao;
import cn.tiantong.entity.Unit;


@Service("unitService")
public class UnitServiceImpl implements UnitService{
	
	
	@Resource(name="unitDao")
	private UnitDao unitDao;

	public List<Unit> findAll() {
		
		return unitDao.findAll();
	}

	public Integer modifyUnit(Unit unit) {
		// TODO Auto-generated method stub
		return unitDao.modifyUnit(unit);
	}
	
	
	

}
