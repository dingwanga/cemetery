package cn.tiantong.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.TombDecoration;
import cn.tiantong.entity.Whf;

public interface WhfDao {
	
	
	
			//查询总记录数
			Integer getCount(Map<String,Object> map);
			
			//用分页查询墓区信息
			List<Whf> findByPage(Map<String,Object> map);
			
			//根据施工单编号查询维护费情况
			Whf findWhfDetailBySgdbh(@Param("sgdbh") String sgdbh);
			
			
			//查询新增中列表信息
			Whf findBySgdbh(@Param("sgdbh") String sgdbh);
			
			//维护费新建
			Integer addWhf(Whf whf);
			
			//维护费修改界面显示信息
			Whf updateFindBySgdbh(@Param("sgdbh") String sgdbh);
	
	        //维护费修改
			Integer updateWhf(Whf whf);
			
			//维护费删除
			void updateAndDelWhf(@Param("sgdbh") String sgdbh);
}
