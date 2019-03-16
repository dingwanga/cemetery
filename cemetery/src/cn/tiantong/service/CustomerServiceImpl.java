package cn.tiantong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.CustomerDao;
import cn.tiantong.entity.Customer;
import cn.tiantong.util.PageBean;


@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
	
	@Resource(name="customerDao")
	private CustomerDao customerDao;

	public PageBean<Customer> findByPage(String sgdbh, String lxrxm,
			String mqmcId, String mxmc, String syxm, 
			 String lxrdh, String lxrdz,
			Integer pageNo, Integer pageSize) {
			PageBean<Customer> pageBean = new PageBean<Customer>();
			pageBean.setPageSize(pageSize);
			int totalCount = customerDao.getCount(sgdbh, lxrxm, mqmcId, mxmc, syxm,  lxrdh, lxrdz);
			pageBean.setTotalCount(totalCount );
			pageBean.setCurPageNo(pageNo);
			Integer start=(pageBean.getCurPageNo()-1)*pageSize;
			List<Customer> pageList = customerDao.findByPage(sgdbh, lxrxm, mqmcId, mxmc, syxm, lxrdh, lxrdz, start , pageSize);
			pageBean.setPageList(pageList );
			return pageBean;
	}

	public List<Customer> findAllCustomer() {
		
		   return customerDao.findAllCustomer();
	}
	
	

}
