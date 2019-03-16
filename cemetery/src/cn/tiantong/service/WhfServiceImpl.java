package cn.tiantong.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import cn.tiantong.dao.WhfDao;
import cn.tiantong.entity.Whf;
import cn.tiantong.util.PageBean;

@Service("whfService")
public class WhfServiceImpl implements WhfService {
	
	@Resource(name="whfDao")
	private WhfDao whfDao;
	

	public PageBean<Whf> findByPage(String sgdbh, String lxrxm, String mqmcId,
			String mxmc, String whskrqStart, String whskrqEnd, String qfrq,
			Integer pageNo, Integer pageSize) {
		PageBean<Whf> pageBean = new PageBean<Whf>();
		pageBean.setPageSize(pageSize);
		Map<String, Object> countMap = queryCountMap(sgdbh,lxrxm, mqmcId, mxmc,
				whskrqStart, whskrqEnd,qfrq);
		Integer totalCount=whfDao.getCount(countMap);
		pageBean.setTotalCount(totalCount);
		pageBean.setCurPageNo(pageNo);
		Integer start=(pageBean.getCurPageNo()-1)*pageSize;
		Map<String, Object> pageListMap = queryPageListMap(sgdbh,lxrxm, mqmcId, mxmc,
				whskrqStart, whskrqEnd,qfrq,start,pageSize);
		pageListMap.put("start", start);
		pageListMap.put("pageSize", pageSize);
		List<Whf> pageList = whfDao.findByPage(pageListMap);
		pageBean.setPageList(pageList );
		return pageBean;
		
	}
	
	

	 /**
	    * 将获取的页面参数存入Map集合，以传入到myBatis中所写SQL的条件参数。
	    * @param sqrxm
	    * @param mqmcId
	    * @param mxmc
	    * @param dmrqStart
	    * @param dmrqEnd
	    * @return
	    */

	private Map<String, Object> queryCountMap(String sgdbh, String lxrxm,
			String mqmcId, String mxmc, String whskrqStart, String whskrqEnd,
			String qfrq) {
		Map<String,Object> countMap  = new HashMap<String,Object>();
		countMap.put("sgdbh", sgdbh);
		countMap.put("lxrxm", lxrxm);
		countMap.put("mqmcId", mqmcId);
		countMap.put("mxmc", mxmc);
		countMap.put("whskrqStart", whskrqStart);
		countMap.put("whskrqEnd", whskrqEnd);
		countMap.put("qfrq", qfrq);
		return countMap;
		
	}
	
	
	private Map<String, Object> queryPageListMap(String sgdbh, String lxrxm,
			String mqmcId, String mxmc, String whskrqStart, String whskrqEnd,
			String qfrq, Integer start, Integer pageSize) {
		Map<String,Object> pageListMap  = new HashMap<String,Object>();
		pageListMap.put("sgdbh", sgdbh);
		pageListMap.put("lxrxm", lxrxm);
		pageListMap.put("mqmcId", mqmcId);
		pageListMap.put("mxmc", mxmc);
		pageListMap.put("whskrqStart", whskrqStart);
		pageListMap.put("whskrqEnd", whskrqEnd);
		pageListMap.put("qfrq", qfrq);
		pageListMap.put("start", start);
		pageListMap.put("pageSize", pageSize);
		return pageListMap;
	}



	public Whf findWhfDetailBySgdbh(String sgdbh) {
		return whfDao.findWhfDetailBySgdbh(sgdbh);
	}



	public Whf findBySgdbh(String sgdbh) {
		return whfDao.findBySgdbh(sgdbh);
	}



	public Integer addWhf(Whf whf) {
		return whfDao.addWhf(whf);
	}



	public Whf updateFindBySgdbh(String sgdbh) {
		return whfDao.updateFindBySgdbh(sgdbh);
	}



	public Integer updateWhf(Whf whf) {
		return whfDao.updateWhf(whf);
	}



	public void updateAndDelWhf(String sgdbh) {
		whfDao.updateAndDelWhf(sgdbh);
	}





}
