package cn.tiantong.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.Dingmu;


public interface DingmuDao {
        
	
	//查询总记录数
		Integer getCount(Map<String,Object> map);
		
		//用分页查询墓区信息
		List<Dingmu> findByPage(Map<String,Object> map);
		
		//根据id查询信息
		Dingmu fingByDingmuId(
				@Param("mxid")
				Integer mxid);
		
		
        //定墓修改
		Integer UpdateDingmu(Dingmu dingmu);
		
		//定墓删除
		Integer delDingmu(Dingmu dingmu);
         
		
		//定墓新增
		Integer modifyDingmu(Dingmu dingmu);
		
		//根据墓区墓穴名称确定墓穴类别
		Dingmu findMxlbByMqmcIdAndMxmc(@Param("mqmcId")String mqmcId,@Param("mxmc")String mxmc);
		
		//根据定墓判别，墓区名称，墓穴名称查询定墓金额和日期
		Dingmu findDmjeAndDmrqByMqmcIdAndMxmcAndDmpb(@Param("mqmcId")String mqmcId,
				@Param("mxmc")String mxmc,
				@Param("dmpb")Integer dmpb);
	
}
