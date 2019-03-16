package cn.tiantong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.WfInfomationDao;
import cn.tiantong.entity.WfInfomation;
@Service("wfInfomationService")
public class WfInfomationServiceImpl implements WfInfomationService{
	@Resource(name="wfInfomationDao")
	private WfInfomationDao wfInfomationDao;
	//新增维护信息
	public void addWfInfomationForsgd(WfInfomation wfInfomation) {
		wfInfomationDao.addWfInfomationForsgd(wfInfomation);
	}
	//修改墓穴维护信息
	public void modifyWfInfomation(WfInfomation wfInfomation) {
		wfInfomationDao.modifyWfInfomation(wfInfomation);
	}
	//查询墓穴维护信息
	public List<WfInfomation> findWfInfomation(String sgdbh) {
		List<WfInfomation> wfInfomations = wfInfomationDao.findWfInfomation(sgdbh);
		return wfInfomations;
	}
	//獲取續交次數
	public Integer queryXJCS(String sgdbh) {
		return wfInfomationDao.queryXJCS(sgdbh);
	}
	//新增维护费续交信息
	public void addWfInfomation(WfInfomation wfInfomation) {
		wfInfomationDao.addWfInfomation(wfInfomation);
	}
	 //修改最后一次续交的墓穴维护信息
	public void modifyWfInfoMaxXJCS(WfInfomation wfInfomation) {
		wfInfomationDao.modifyWfInfoMaxXJCS(wfInfomation);
	}
	//根据施工单编号维护信息中维护信息 
	public void delWfinfomation(String sgdbh) {
		wfInfomationDao.delWfinfomation(sgdbh);
	}

}
