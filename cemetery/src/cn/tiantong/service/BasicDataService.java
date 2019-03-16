package cn.tiantong.service;

import java.util.List;
import cn.tiantong.entity.BasicData;
import cn.tiantong.util.PageBean;

public interface BasicDataService {
	
	
	
		 //分页查询
	    PageBean<BasicData> findByPage(
				    Integer pageNo,
		   			Integer pageSize
	 		   );
	    
	    //查询所有
	    List<BasicData> findAll();
	    
	    
	    //基础数据新增
	    int addBasicData(BasicData basicData);
	    
	  //根据mqmcId 和mxmc 查找基础资料信息信息 
	    BasicData  findBasicDataByMqmcIdAndMxmc(String mqmcId,String mxmc);
	    
	    //删除基础数据信息
	    int  DelBasicData(String mqmcId,String mxmc);
	
}
