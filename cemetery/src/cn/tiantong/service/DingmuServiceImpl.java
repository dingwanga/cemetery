package cn.tiantong.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import cn.tiantong.dao.DingmuDao;
import cn.tiantong.entity.Dingmu;
import cn.tiantong.util.PageBean;


@Service("dingmuService")
public class DingmuServiceImpl implements DingmuService {

	@Resource(name="dingmuDao")
	private DingmuDao dingmuDao;	
	
	public PageBean<Dingmu> findByPage(String sqrxm, String mqmcId, String mxmc,
			String dmrqStart,String dmrqEnd, Integer pageNo, Integer pageSize) {
		PageBean<Dingmu> pageBean=new PageBean<Dingmu>();
		pageBean.setPageSize(pageSize);
		Map<String, Object> countMap = queryCountMap(sqrxm, mqmcId, mxmc,
				dmrqStart, dmrqEnd);
		Integer totalCount=dingmuDao.getCount(countMap);
		pageBean.setTotalCount(totalCount);
		pageBean.setCurPageNo(pageNo);
		Integer start=(pageBean.getCurPageNo()-1)*pageSize;
		Map<String, Object> pageListMap = queryPageListMap(sqrxm, mqmcId, mxmc,
				dmrqStart, dmrqEnd,start,pageSize);
		pageListMap.put("start", start);
		pageListMap.put("pageSize", pageSize);
		List<Dingmu> pageList=dingmuDao.findByPage(pageListMap);
		pageBean.setPageList(pageList);
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
	private Map<String, Object> queryCountMap(String sqrxm, String mqmcId,
			String mxmc, String dmrqStart, String dmrqEnd) {
		
		Map<String,Object> countMap  = new HashMap<String,Object>();
		countMap.put("sqrxm", sqrxm);
		countMap.put("mqmcId", mqmcId);
		countMap.put("mxmc", mxmc);
		countMap.put("dmrqStart", dmrqStart);
		countMap.put("dmrqEnd", dmrqEnd);
		return countMap;
	}
    
	private Map<String, Object> queryPageListMap(String sqrxm, String mqmcId,
			String mxmc, String dmrqStart, String dmrqEnd,Integer start,Integer pageSize) {
		
		Map<String,Object> pageListMap  = new HashMap<String,Object>();
		pageListMap.put("sqrxm", sqrxm);
		pageListMap.put("mqmcId", mqmcId);
		pageListMap.put("mxmc", mxmc);
		pageListMap.put("dmrqStart", dmrqStart);
		pageListMap.put("dmrqEnd", dmrqEnd);
		pageListMap.put("start", start);
		pageListMap.put("pageSize", pageSize);
		return pageListMap;
	}
	
	
	 //根据id查询定墓信息
	public Dingmu fingByDingmuId(Integer mxid) {
		// TODO Auto-generated method stub
		return dingmuDao.fingByDingmuId(mxid);
	}

	public Integer UpdateDingmu(Dingmu dingmu) {
		// TODO Auto-generated method stub
		return dingmuDao.UpdateDingmu(dingmu);
	}

	public Integer delDingmu(Dingmu dingmu) {
		// TODO Auto-generated method stub
		return dingmuDao.delDingmu(dingmu);
	}

	
	//定墓新增
	public Integer modifyDingmu(Dingmu dingmu) {
		return dingmuDao.modifyDingmu(dingmu);
	}

	//根据墓区墓穴名称确定墓穴类别
	public Dingmu findMxlbByMqmcIdAndMxmc(String mqmcId, String mxmc) {
		// TODO Auto-generated method stub
		return dingmuDao.findMxlbByMqmcIdAndMxmc(mqmcId, mxmc);
	}

	
	//根据定墓判别，墓区名称，墓穴名称查询定墓金额和日期
	public Dingmu findDmjeAndDmrqByMqmcIdAndMxmcAndDmpb(String mqmcId,
			String mxmc, Integer dmpb) {
		// TODO Auto-generated method stub
		return dingmuDao.findDmjeAndDmrqByMqmcIdAndMxmcAndDmpb(mqmcId, mxmc, dmpb);
	}
     

}
