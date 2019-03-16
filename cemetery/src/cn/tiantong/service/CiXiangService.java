package cn.tiantong.service;





import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.Address;
import cn.tiantong.entity.CiXiang;
import cn.tiantong.util.PageBean;

public interface CiXiangService {
      
	
	//查询所有
    List<CiXiang> findAll();
    
    //分页查询
    PageBean<CiXiang> findByPage(Integer pageNo,Integer pageSize);
    
   //瓷像新增
	int addCiXiang(CiXiang ciXiang);
	
	//根据id查询瓷像信息
		CiXiang findCiXiangById(Integer id);
		
		
      //修改瓷像
		int updateCiXiang(CiXiang ciXiang);
        
		//瓷像删除
		int delCiXiang(Integer id);
		
		
		//根据瓷像名称查询瓷像id
		CiXiang findCxIdByCxmc(String cxmc);
		
		
}
