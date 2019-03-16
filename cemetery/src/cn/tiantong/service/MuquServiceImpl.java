package cn.tiantong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.MuquDao;
import cn.tiantong.entity.Muqu;
import cn.tiantong.util.PageBean;


@Service("muquService")
public class MuquServiceImpl implements MuquService {
	
	@Resource(name="muquDao")
	private MuquDao muquDao;

	
	//查询所有墓区名称
	public List<Muqu> findAllMuqu() {
		// TODO Auto-generated method stub
		return muquDao.findAllMuqu();
	}

   //分页显示
	public PageBean<Muqu> findByPage(String mqmc, Integer pageNo,
			Integer pageSize) {
		PageBean<Muqu> pageBean=new PageBean<Muqu>();
		pageBean.setPageSize(pageSize);
		int totalCount=muquDao.getCount(mqmc);
		pageBean.setTotalCount(totalCount);
		
		pageBean.setCurPageNo(pageNo);
		
		Integer start=(pageBean.getCurPageNo()-1)*pageSize;
		List<Muqu> pageList=muquDao.findByPage(mqmc, start, pageSize);
		pageBean.setPageList(pageList);
		return pageBean;
	}
	

    //查询所有
	public List<Muqu> findAll() {
		
		return muquDao.findAll();
	}

	
	/*//查询所有墓区类别
		public List<Muqu> findAllLeiBie() {
			// TODO Auto-generated method stub
			return muquDao.findAllLeiBie();
		}*/
		
		
    //墓区新增
	public Integer addMuQu(Muqu muqu) {
		
		return muquDao.addMuQu(muqu);
	}

	
	 //根据mqmc查询墓区信息
	public Muqu findMuquByMumc(String mqmc) {
		// TODO Auto-generated method stub
		return muquDao.findMuquByMumc(mqmc);
	}
	
 //根据id查询墓区信息
	public Muqu findMuquById(Integer id) {
		// TODO Auto-generated method stub
		return muquDao.findMuquById(id);
	}

	 //墓区修改
	public int updateMuQu(Muqu muqu) {
		// TODO Auto-generated method stub
		return muquDao.updateMuQu(muqu);
	}
    
	
	//墓区删除
	public int delMuqu(Integer id) {
		// TODO Auto-generated method stub
		return muquDao.delMuqu(id);
	}

	
	
	//用AJAX验证墓区是否存在
	public Muqu checkMqmc(String mqmc) {
		return muquDao.checkMqmc(mqmc);
	}

	public Muqu fingByMuxueId(Integer mxid) {
		return muquDao.fingByMuxueId(mxid);
	}
   

}
