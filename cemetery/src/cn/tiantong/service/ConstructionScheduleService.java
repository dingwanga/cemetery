package cn.tiantong.service;



import cn.tiantong.entity.ConstructionSchedule;

public interface ConstructionScheduleService {
	
	    //通过sgdbh查询施工进度
		ConstructionSchedule getSgdjdBySgdbh(String sgdbh);
		
		//修改施工进度
		void updateSgjdBySgdbh(ConstructionSchedule constructionSchedule);
		//給施工单进度表添加编号
		void addSGDBHForSGJD(String sgdbh);
}
