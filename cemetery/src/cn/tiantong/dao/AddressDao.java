package cn.tiantong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tiantong.entity.Address;

public interface AddressDao {
      
	   //查询所有
	List<Address> findAllAddress();
	
	//总记录数
	Integer  getTotal();
	
	//分页查询
	List<Address> findByPage(
			    @Param("start")
			    Integer start,
	   			@Param("pageSize")
	   			Integer pageSize
			);
     
	
	//新增地址
	int addAddress(Address address);
	
    //通过id查询地址
	Address findAddressById(
			@Param("id")
			Integer id);
	
    //修改地址
	int updateAddress(Address address);
	
     //删除地区
	int delAddress(@Param("id")
	                Integer id);
	
	
	  //查询所有省市json
		List<Address> findAllQxmc(String ssmc);
		//根据省市名称查询对应的ID
		Address findIdBySSMC(@Param("ssmc")String ssmc,@Param("qxmc")String qxmc);
		
		
		//查询所有省市
		List<Address> findAllSsmc();
}
