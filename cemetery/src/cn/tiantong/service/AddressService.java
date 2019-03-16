package cn.tiantong.service;

import java.util.List;



import cn.tiantong.entity.Address;
import cn.tiantong.util.PageBean;

public interface AddressService {
	   //查询所有
		List<Address> findAllAddress();
		
		
		//分页查询
		PageBean<Address> findByPage(Integer pageNo,Integer pageSize);
		
		

        //新增地址
		int addAddress(Address address);

        //通过id查询地址
		
		Address findAddressById(Integer id);

         //修改地址
		int updateAddress(Address address);


		//删除地区
		int delAddress(Integer id);
		
		
		 //查询所有省市json
		List<Address> findAllQxmc(String ssmc);
		//根据省市名称查询对应的ID
		Address findIdBySSMC(String ssmc,String qxmc);
		//查询所有省市名称
		List<Address> findAllSsmc();
		
		
}
