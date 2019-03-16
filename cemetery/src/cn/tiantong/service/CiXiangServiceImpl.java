package cn.tiantong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



import cn.tiantong.dao.CiXiangDao;
import cn.tiantong.entity.CiXiang;
import cn.tiantong.util.PageBean;


@Service("ciXiangService")
public class CiXiangServiceImpl implements CiXiangService{

	
	 @Resource(name="ciXiangDao")
	 private CiXiangDao ciXiangDao;
	 
	 
	public List<CiXiang> findAll() {
		// TODO Auto-generated method stub
		return ciXiangDao.findAll();
	}

	public PageBean<CiXiang> findByPage(Integer pageNo, Integer pageSize
			) {
		PageBean<CiXiang> pageBean=new PageBean<CiXiang>();
		pageBean.setPageSize(pageSize);
		int totalCount=ciXiangDao.getCount();
		pageBean.setTotalCount(totalCount);
		pageBean.setCurPageNo(pageNo);
		Integer start=(pageBean.getCurPageNo()-1)*pageSize;
		List<CiXiang> pageList=ciXiangDao.findByPage(start, pageSize);
		pageBean.setPageList(pageList);
		return pageBean;
	}
     
	
	 //瓷像新增
	public int addCiXiang(CiXiang ciXiang) {
		// TODO Auto-generated method stub
		return ciXiangDao.addCiXiang(ciXiang);
	}
	
    //根据id查找瓷像
	public CiXiang findCiXiangById(Integer id) {
		// TODO Auto-generated method stub
		return ciXiangDao.findCiXiangById(id);
	}
	
    //修改瓷像
	public int updateCiXiang(CiXiang ciXiang) {
		// TODO Auto-generated method stub
		return ciXiangDao.updateCiXiang(ciXiang);
	}

	//瓷像删除
	public int delCiXiang(Integer id) {
		// TODO Auto-generated method stub
		return ciXiangDao.delCiXiang(id);
	}

	
	//根据瓷像名称查询瓷像单价
	public CiXiang findCxIdByCxmc(String cxmc) {
		// TODO Auto-generated method stub
		return ciXiangDao.findCxIdByCxmc(cxmc);
	}

	
	
}
