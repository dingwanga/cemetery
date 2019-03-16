package cn.tiantong.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.Muqu;
import cn.tiantong.util.PageBean;

public interface MuquService {
	
	
	//查询所有的墓区名称
		List<Muqu> findAllMuqu();
		
		
		
		//用分页查询墓区信息
		PageBean<Muqu> findByPage(
	            String mqmc,
				Integer pageNo,
				Integer pageSize
				);
		
		
		//查询所有
		List<Muqu> findAll();
		
		/*//查询所有墓区类别
		 List<Muqu> findAllLeiBie();*/
		
		//墓区新增
		Integer addMuQu(Muqu muqu);
		
		//Ajax验证墓区是否存在
		Muqu checkMqmc(String mqmc);


        //根据mqmc查询墓区信息
		Muqu findMuquByMumc(String mqmc);

        //根据id查询墓区信息
		Muqu findMuquById(Integer id);
		
		
		//根据id查询墓穴信息
				Muqu fingByMuxueId(
						Integer mxid
						);
				

        //墓区修改
		int updateMuQu(Muqu muqu);
  
        //墓区删除
		int delMuqu(Integer id);

}
