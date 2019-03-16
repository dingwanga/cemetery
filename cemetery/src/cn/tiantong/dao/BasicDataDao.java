package cn.tiantong.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.tiantong.entity.BasicData;
import cn.tiantong.entity.CiXiang;
public interface BasicDataDao {
	
	//总记录数
	Integer getCount();
	
	 //分页查询
    List<BasicData> findByPage(
 		    @Param("start")
			    Integer start,
	   			@Param("pageSize")
	   			Integer pageSize
 		   );
    
    //查询所有
    List<BasicData> findAll();
    
    
    //基础数据新增
    int addBasicData(BasicData basicData);
    
    //根据mqmcId 和mxmc 查找基础资料信息信息 
    BasicData  findBasicDataByMqmcIdAndMxmc(@Param("mqmcId")String mqmcId,@Param("mxmc")String mxmc);
    
    //删除基础数据信息
    int  DelBasicData(@Param("mqmcId")String mqmcId,@Param("mxmc")String mxmc);
}
