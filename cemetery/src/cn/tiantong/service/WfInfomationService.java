package cn.tiantong.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.WfInfomation;

public interface WfInfomationService {
	//新增施工單時新增维护信息
	void addWfInfomationForsgd(WfInfomation wfInfomation);
	//修改墓穴维护信息
    void modifyWfInfomation(WfInfomation wfInfomation);
    //查询墓穴维护信息
  	List<WfInfomation> findWfInfomation(String sgdbh);
    //獲取續交次數
  	Integer queryXJCS(String sgdbh);
    //新增维护费续交信息
  	void addWfInfomation(WfInfomation wfInfomation);
    //修改最后一次续交的墓穴维护信息
  	void modifyWfInfoMaxXJCS(WfInfomation wfInfomation);
    //根据施工单编号维护信息中维护信息 
  	void delWfinfomation(@Param("sgdbh") String sgdbh);
}
