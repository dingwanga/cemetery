package cn.tiantong.service;
import java.util.List;

import cn.tiantong.entity.Customer;
import cn.tiantong.util.PageBean;

public interface CustomerService {
	
	
	     //分页查询所有
		PageBean<Customer> findByPage(
		             String sgdbh,
		             String lxrxm,
		             String mqmcId,
		             String mxmc,
		             
		             String syxm,
		             String lxrdh,
		             String lxrdz,
					Integer pageNo,
					Integer pageSize
				);
	
	
		//查询所有
	    List<Customer> findAllCustomer();

}
