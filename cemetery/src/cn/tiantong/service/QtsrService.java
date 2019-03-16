package cn.tiantong.service;
import java.util.List;
import cn.tiantong.entity.Qtsr;
import cn.tiantong.util.PageBean;

public interface QtsrService {
	
	
	      
			
			//分页查询
			PageBean<Qtsr> findByPage(Integer pageNo,Integer pageSize);
			
			//查询所有其他收入
			List<Qtsr> findAll();
			
			//其他收入新增
			Integer addQtsr(Qtsr qtsr);
			
			//根据id查询修改信息
			Qtsr findById(Integer id);
			
			
			//其他收入修改
			Integer updateQtsr(Qtsr qtsr);
			
			//其他收入删除
			Integer delQtsr(Integer id);
			

}
