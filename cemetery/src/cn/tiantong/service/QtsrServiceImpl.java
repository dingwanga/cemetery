package cn.tiantong.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import cn.tiantong.dao.QtsrDao;
import cn.tiantong.entity.Qtsr;
import cn.tiantong.util.PageBean;

@Service("qtsrService")
public class QtsrServiceImpl implements QtsrService {

	@Resource(name="qtsrDao")
	private QtsrDao qtsrDao;
	public PageBean<Qtsr> findByPage(Integer pageNo, Integer pageSize) {
		PageBean<Qtsr> pageBean = new PageBean<Qtsr>();
		pageBean.setPageSize(pageSize);
		int totalCount = qtsrDao.getTotal();
		pageBean.setTotalCount(totalCount );
		pageBean.setCurPageNo(pageNo);
		Integer start=(pageBean.getCurPageNo()-1)*pageSize;
		List<Qtsr> pageList=qtsrDao.findByPage(start, pageSize);
		pageBean.setPageList(pageList);
		return pageBean;
	}
	
	public List<Qtsr> findAll() {
		
		return qtsrDao.findAll();
	}
	
	public Integer addQtsr(Qtsr qtsr) {
		
		return qtsrDao.addQtsr(qtsr);
	}
	
	public Integer updateQtsr(Qtsr qtsr) {
		
		return qtsrDao.updateQtsr(qtsr);
	}
	
	public Integer delQtsr(Integer id) {
		
		return qtsrDao.delQtsr(id);
	}

	public Qtsr findById(Integer id) {
		// TODO Auto-generated method stub
		return qtsrDao.findById(id);
	}
	

}
