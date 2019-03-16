package cn.tiantong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.BasicDataDao;
import cn.tiantong.entity.BasicData;
import cn.tiantong.util.PageBean;


@Service("basicDataService")
public class BasicDataServiceImpl implements BasicDataService {
    
	@Resource(name="basicDataDao")
	private BasicDataDao basicDataDao;

	public PageBean<BasicData> findByPage(Integer pageNo, Integer pageSize) {
		PageBean<BasicData> pageBean = new PageBean<BasicData>();
		pageBean.setPageSize(pageSize);
		int totalCount = basicDataDao.getCount();
		pageBean.setTotalCount(totalCount );
		pageBean.setCurPageNo(pageNo);
		Integer start=(pageBean.getCurPageNo()-1)*pageSize;
		List<BasicData> pageList = basicDataDao.findByPage(start, pageSize);
		pageBean.setPageList(pageList );
		return pageBean;
	}

	public List<BasicData> findAll() {
		
		return basicDataDao.findAll();
	}

	
	 //基础数据新增
	public int addBasicData(BasicData basicData) {
		
		return basicDataDao.addBasicData(basicData);
	}
    
	
	//根据墓区名称和墓穴名称查找基础数据信息
	public BasicData findBasicDataByMqmcIdAndMxmc(String mqmcId, String mxmc) {
		
		return basicDataDao.findBasicDataByMqmcIdAndMxmc(mqmcId, mxmc);
	}

	
	//删除基础数据
	public int DelBasicData(String mqmcId, String mxmc) {
		
		return basicDataDao.DelBasicData(mqmcId, mxmc);
	}
}
