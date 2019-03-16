package cn.tiantong.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.Construction;




public interface ConstructionDao {
	
	

	//查询总记录数
		int getCount(@Param("sgdbh")String sgdbh);
		
		
		//用分页查询墓区信息
		List<Construction> findByPage(
				@Param("sgdbh")
	            String sgdbh,
	            @Param("start")
				Integer start,
				@Param("pageSize")
				Integer pageSize
				);
		
	
		
		//查询库中最大的施工单编号
		String querySGDnO();
		
		
		//施工单新建
		Integer addConstruction(Construction construction);
		
		//根据施工单编号查询信息 
		Construction findBySgdbh(@Param("sgdbh")  String sgdbh);
		
		//施工单修改
		void updateConstruction(Construction construction);
		//根据施工单编号删除一条施工单数据
		void delConstruction(@Param("sgdbh")  String sgdbh);
		//更改施工单维护信息为最终数据 
		void updateConstructionWfInfo(Construction construction);
		//根据施工单编号查询维护信息是否为空
		Construction queryWFKSRQIsNull(@Param("sgdbh")  String sgdbh);

}
