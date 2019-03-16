package cn.tiantong.service;
import cn.tiantong.entity.Whf;
import cn.tiantong.util.PageBean;

public interface WhfService {
	
			//用分页查询墓区信息
			PageBean<Whf> findByPage(
					String sgdbh,
		            String lxrxm,
		            String mqmcId,
		            String mxmc,
		            String whskrqStart,
		            String whskrqEnd,
		            String qfrq,
					Integer pageNo,
					Integer pageSize
					);
			
			//根据施工单编号查询维护费情况
			Whf findWhfDetailBySgdbh(String sgdbh);
			//查询新增中列表信息
			Whf findBySgdbh(String sgdbh);
			//维护费新建
			Integer addWhf(Whf whf);
			//维护费修改界面显示信息
			Whf updateFindBySgdbh(String sgdbh);
			//维护费修改
			Integer updateWhf(Whf whf);
			//维护费删除
			void updateAndDelWhf(String sgdbh);
}
