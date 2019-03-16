package cn.tiantong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.CiXiang;

public interface CiXiangDao {
	
        //获得所有记录数
       Integer getCount();
       
       //分页查询
       List<CiXiang> findByPage(
    		    @Param("start")
   			    Integer start,
	   			@Param("pageSize")
	   			Integer pageSize
    		   );
       
       
       //查询所有
       List<CiXiang> findAll();

       
       //瓷像新增
	int addCiXiang(CiXiang ciXiang);
	
	//根据id查询瓷像信息
	CiXiang findCiXiangById(
			@Param("id")
			Integer id
			);
     
	
	//修改瓷像
	int updateCiXiang(CiXiang ciXiang);

	
	//删除瓷像
	int delCiXiang(@Param("id")
	                Integer id);

	
	//根据瓷像名称查询瓷像id
	CiXiang findCxIdByCxmc(
			@Param("cxmc")
			String cxmc);
}
