package cn.tiantong.service;
import cn.tiantong.entity.Dingmu;
import cn.tiantong.util.PageBean;
public interface DingmuService {
			
			//用分页查询墓区信息
			PageBean<Dingmu> findByPage(
		            String sqrxm,
	                String mqmcId,
	                String mxmc,
	                String dmrqStart,
	                String dmrqEnd,
					Integer pageNo,
					Integer pageSize
					);
			
			
			
			//根据id查询信息
			Dingmu fingByDingmuId(Integer mxid);



            //修改定墓
			Integer UpdateDingmu(Dingmu dingmu);


              
			//定墓删除
			Integer delDingmu(Dingmu dingmu);


			//定墓新增
			Integer modifyDingmu(Dingmu dingmu);
			
			//根据墓区墓穴名称确定墓穴类别
			Dingmu findMxlbByMqmcIdAndMxmc(String mqmcId,String mxmc);
			
			//根据定墓判别，墓区名称，墓穴名称查询定墓金额和日期
			Dingmu findDmjeAndDmrqByMqmcIdAndMxmcAndDmpb(String mqmcId,String mxmc,Integer dmpb);
			

}
