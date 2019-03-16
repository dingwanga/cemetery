package cn.tiantong.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.ConstructionScheduleDao;
import cn.tiantong.entity.ConstructionSchedule;


@Service("constructionScheduleService")
public class ConstructionScheduleServiceImpl implements
		ConstructionScheduleService {
	
	@Resource(name="constructionScheduleDao")
	private ConstructionScheduleDao constructionScheduleDao;

	public ConstructionSchedule getSgdjdBySgdbh(String sgdbh) {
		return constructionScheduleDao.getSgdjdBySgdbh(sgdbh);
	}

	public void updateSgjdBySgdbh(ConstructionSchedule constructionSchedule) {
		constructionScheduleDao.updateSgjdBySgdbh(constructionSchedule);
		
	}

	public void addSGDBHForSGJD(String sgdbh) {
		constructionScheduleDao.addSGDBHForSGJD(sgdbh);
		
	}

}
