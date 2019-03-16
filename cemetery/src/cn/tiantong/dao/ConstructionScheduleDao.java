package cn.tiantong.dao;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.ConstructionSchedule;
public interface ConstructionScheduleDao {
	
	
	//通过sgdbh查询施工进度
	ConstructionSchedule getSgdjdBySgdbh(@Param("sgdbh") String sgdbh);
	
	//修改施工进度
	void updateSgjdBySgdbh(ConstructionSchedule constructionSchedule);
	//給施工单进度表添加编号
	void addSGDBHForSGJD(@Param("sgdbh") String sgdbh);

}
