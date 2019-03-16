package cn.tiantong.service;
import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.TombDecoration;
import cn.tiantong.util.PageBean;

public interface TombDecorationService {
	
	

	      
			
	//用分页查询墓区信息
	PageBean<TombDecoration> findByPage(
            String sgdbh,
			Integer pageNo,
			Integer pageSize
			);

	
	//根据施工单编号查询墓穴装修情况
	TombDecoration findBySgdbhMuxueZhuangxiu(String sgdbh);
	
	//根据施工单编号查询所有
	TombDecoration findTombDecorationBySgdbh(String sgdbh);
	
	
	//业务员和瓷像修改
	/*Integer modifyMuxueZhuangxiu(TombDecoration tombDecoration);*/
	
	//墓穴装修新增修改
	Integer updateMuxueZhuangxiu(TombDecoration tombDecoration);
	//根据施工单编号查询墓穴装修信息_显示墓穴装修修改
	TombDecoration findMXZXModify(@Param("sgdbh")  String sgdbh);
	//删除一条墓穴装修信息
	void deleteMuxueZhuangxiu(@Param("sgdbh") String sgdbh);
}
