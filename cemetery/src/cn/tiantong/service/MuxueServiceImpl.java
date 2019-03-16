package cn.tiantong.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import cn.tiantong.dao.MuxueDao;
import cn.tiantong.entity.Muxue;
import cn.tiantong.util.PageBean;


@Service("muxueService")
public class MuxueServiceImpl implements MuxueService {
	
	
	@Resource(name="muxueDao")
	private MuxueDao muxueDao;

	public List<Muxue> findByMqmcId(String mqmcId) {
		
		return muxueDao.findByMqmcId(mqmcId);
	}


	public List<Muxue> findAllSy() {
		
		return muxueDao.findAllSy();
	}

	public List<Muxue> findAllDm() {
		
		return muxueDao.findAllDm();
	}

	
	
	public PageBean<Muxue> findByPage(String mqmcId,String mxmc, Integer ryqk, Integer dmpb,
			Integer pageNo, Integer pageSize) {
		PageBean<Muxue> pageBean=new PageBean<Muxue>();
		pageBean.setPageSize(pageSize);
		int totalCount=muxueDao.getCount(mqmcId,mxmc, ryqk, dmpb);
		pageBean.setTotalCount(totalCount);
		pageBean.setCurPageNo(pageNo);
		Integer start=(pageBean.getCurPageNo()-1)*pageSize;
		List<Muxue> pageList=muxueDao.findByPage(mqmcId,mxmc, ryqk, dmpb, start, pageSize);
		pageBean.setPageList(pageList);
		return pageBean;
	}

	public List<Muxue> findAll() {
		
		return muxueDao.findAll();
	}


	public List<Muxue> findAllLeiBie() {
		
		return muxueDao.findAllLeiBie();
	}


	public Integer addMuxue(Muxue muxue) {
		
		return muxueDao.addMuxue(muxue);
	}


	public Muxue fingByMuxueId(Integer mxid) {
		
		return muxueDao.fingByMuxueId(mxid);
	}


	public Integer updateMuxue(Muxue muxue) {
		
		return muxueDao.updateMuxue(muxue);
	}


	public Integer delMuxue(Integer mxid) {
		
		return muxueDao.delMuxue(mxid);
	}


	public Muxue findByMqAndMx(String mqmcId, String mxmc) {
		
		return muxueDao.findByMqAndMx(mqmcId, mxmc);
	}


	public List<Muxue> findByMqmcIdAndZeroOfDMPB(String mqmcId) {
		
		return muxueDao.findByMqmcIdAndZeroOfDMPB(mqmcId);
	}


	/*public List<Muxue> findByMqmcIdAndOneOfDMPB(String mqmcId) {
		// TODO Auto-generated method stub
		return muxueDao.findByMqmcIdAndOneOfDMPB(mqmcId);
	}*/

	public List<Muxue> queryMxmcByMqmcAndDmpb(String mqmcId, Integer dmpb) {
		
		return muxueDao.queryMxmcByMqmcAndDmpb(mqmcId, dmpb);
	}
    //修改sgdbh不为null
	public Integer updateSGDBHForMuxue(Muxue muxue) {
		return muxueDao.updateSGDBHForMuxue(muxue);
	}

	public void updateMuxueBysgdbhId(Muxue muxue) {
		muxueDao.updateMuxueBysgdbhId(muxue);
	}

	//修改sgdbh为null
	public void updateSGDBHIsNull(Muxue muxue) {
		muxueDao.updateSGDBHIsNull(muxue);
	}


	public List<Muxue> queryModifyMxmcByMqmcAndDmpb(String mqmcId,
			Integer dmpb, String sgdbhId) {
		return muxueDao.queryModifyMxmcByMqmcAndDmpb(mqmcId, dmpb, sgdbhId);
	}


	
	//查询墓区中所有cid=null 的墓穴
	public List<Muxue> findByMqmcIdAndConcessionList(String mqmcId) {
		
		return muxueDao.findByMqmcIdAndConcessionList(mqmcId);
	}
	
	

	
}
