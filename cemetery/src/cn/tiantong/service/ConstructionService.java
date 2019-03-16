package cn.tiantong.service;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.Construction;
import cn.tiantong.util.PageBean;




public interface ConstructionService {
	
	//分页查询
	PageBean<Construction> findByPage(
            String sgdbh,
			Integer pageNo,
			Integer pageSize
			);
	//查询库中最大的施工单编号
	String querySGDnO();
	//施工单新建
	Integer addConstruction(Construction construction);
	//根据施工单编号查询信息 
	Construction findBySgdbh(String sgdbh);
	//施工单修改
	void updateConstruction(Construction construction);
	//根据施工单编号删除一条施工单数据
	void delConstruction(@Param("sgdbh")  String sgdbh);
	//更改施工单维护信息为最终数据 
    void updateConstructionWfInfo(Construction construction);
    //根据施工单编号查询维护信息是否为空
  	Construction queryWFKSRQIsNull(@Param("sgdbh")  String sgdbh);
}
