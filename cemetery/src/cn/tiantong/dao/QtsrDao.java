package cn.tiantong.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.tiantong.entity.Qtsr;

public interface QtsrDao {
	
	
	
	    //总记录数
		Integer  getTotal();
		
		//分页查询
		List<Qtsr> findByPage(
				    @Param("start")
				    Integer start,
		   			@Param("pageSize")
		   			Integer pageSize
				);
	
      
		
		//查询所有其他收入
		List<Qtsr> findAll();
		
		//其他收入新增
		Integer addQtsr(Qtsr qtsr);
		
		//根据id查询修改信息
		Qtsr findById(@Param("id") Integer id);
		
		
		//其他收入修改
		Integer updateQtsr(Qtsr qtsr);
		
		//其他收入删除
		Integer delQtsr(@Param("id") Integer id);
		
		
}
