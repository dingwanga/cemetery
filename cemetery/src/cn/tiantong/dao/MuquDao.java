package cn.tiantong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.Muqu;



public interface MuquDao {
     //查询所有的墓区名称
	List<Muqu> findAllMuqu();
	//查询总记录数
	int getCount(@Param("mqmc")
	               String mqmc
			);
	
	//用分页查询墓区信息
	List<Muqu> findByPage(
			@Param("mqmc")
            String mqmc,
            @Param("start")
			Integer start,
			@Param("pageSize")
			Integer pageSize
			);
	
	
	//查询所有
	List<Muqu> findAll();
	
	
	
	 
	
	//墓区新增
	Integer addMuQu(Muqu muqu);
	
	
	//Ajax验证墓区是否存在
	Muqu checkMqmc(
				@Param("mqmc")
				String mqmc);
	
	

	//根据mqmc查询墓区信息
	Muqu findMuquByMumc(
			@Param("mqmc")
			String mqmc);
	
	//根据id查询墓区信息
		Muqu findMuquById(
				@Param("id")
				Integer id);

	//根据id查询墓穴信息
		Muqu fingByMuxueId(
				@Param("mxid")
				Integer mxid
				);
		
		
		
    //墓区修改
	int updateMuQu(Muqu muqu);

    
	
	//墓区删除
	int delMuqu(
			@Param("id")
			Integer id);
	
}
