package cn.tiantong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import cn.tiantong.entity.Construction;
import cn.tiantong.entity.TombDecoration;

public interface TombDecorationDao {
	
	
	//查询总记录数
			int getCount(@Param("sgdbh")String sgdbh);
			
			
			//用分页查询墓区信息
			List<TombDecoration> findByPage(
					@Param("sgdbh")
		            String sgdbh,
		            @Param("start")
					Integer start,
					@Param("pageSize")
					Integer pageSize
					);
	
		//根据施工单编号查询墓穴装修情况
			TombDecoration findBySgdbhMuxueZhuangxiu(@Param("sgdbh") String sgdbh);
			
			//根据施工单编号查询所有
			TombDecoration findTombDecorationBySgdbh(@Param("sgdbh")  String sgdbh);
			
			
			//墓穴装修新增修改
			Integer updateMuxueZhuangxiu(TombDecoration tombDecoration);
			//根据施工单编号查询墓穴装修信息_显示墓穴装修修改
			TombDecoration findMXZXModify(@Param("sgdbh")  String sgdbh);
			//删除一条墓穴装修信息
			void deleteMuxueZhuangxiu(@Param("sgdbh") String sgdbh);
}
