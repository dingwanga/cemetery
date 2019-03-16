package cn.tiantong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.TombDecorationDao;
import cn.tiantong.entity.TombDecoration;
import cn.tiantong.util.PageBean;

@Service("tombDecorationService")
public class TombDecorationServiceImpl implements TombDecorationService {
	
	
	@Resource(name="tombDecorationDao")
	private TombDecorationDao tombDecorationDao;

	
	public PageBean<TombDecoration> findByPage(String sgdbh, Integer pageNo,
			Integer pageSize) {
		PageBean<TombDecoration> pageBean=new PageBean<TombDecoration>();
		pageBean.setPageSize(pageSize);
		
		int totalCount=tombDecorationDao.getCount(sgdbh);
		pageBean.setTotalCount(totalCount);
		pageBean.setCurPageNo(pageNo);
		Integer start=(pageBean.getCurPageNo()-1)*pageSize;
		List<TombDecoration> pageList=tombDecorationDao.findByPage(sgdbh, start, pageSize);
		pageBean.setPageList(pageList);
		return pageBean;
	}


	public TombDecoration findBySgdbhMuxueZhuangxiu(String sgdbh) {
		return tombDecorationDao.findBySgdbhMuxueZhuangxiu(sgdbh);
	}


	public Integer updateMuxueZhuangxiu(TombDecoration tombDecoration) {
		return tombDecorationDao.updateMuxueZhuangxiu(tombDecoration);
	}


	public TombDecoration findTombDecorationBySgdbh(String sgdbh) {
		return tombDecorationDao.findTombDecorationBySgdbh(sgdbh);
	}


	public TombDecoration findMXZXModify(String sgdbh) {
		return tombDecorationDao.findMXZXModify(sgdbh);
	}


	public void deleteMuxueZhuangxiu(String sgdbh) {
		tombDecorationDao.deleteMuxueZhuangxiu(sgdbh);
	}


	/*public Integer addMuxueZhuangxiu(TombDecoration tombDecoration) {
		// TODO Auto-generated method stub
		return tombDecorationDao.addMuxueZhuangxiu(tombDecoration);
	}


	public Integer modifyMuxueZhuangxiu(TombDecoration tombDecoration) {
		// TODO Auto-generated method stub
		return tombDecorationDao.modifyMuxueZhuangxiu(tombDecoration);
	}*/


	


	

	

}
