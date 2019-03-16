package cn.tiantong.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.AddressDao;
import cn.tiantong.entity.Address;
import cn.tiantong.util.PageBean;


@Service("addressService")
public class AddressServiceImpl implements AddressService{
       
	@Resource(name="addressDao")
	private AddressDao addressDao;

	public List<Address> findAllAddress() {
		
		return addressDao.findAllAddress();
	}

	public PageBean<Address> findByPage(Integer pageNo, Integer pageSize) {
		PageBean<Address> pageBean=new PageBean<Address>();
		pageBean.setPageSize(pageSize);
		int totalCount=addressDao.getTotal();
		pageBean.setTotalCount(totalCount);
		pageBean.setCurPageNo(pageNo);
		Integer start=(pageBean.getCurPageNo()-1)*pageSize;
		List<Address> pageList=addressDao.findByPage(start, pageSize);
		pageBean.setPageList(pageList);
		return pageBean;
	}

	
	 //新增地址
	public int addAddress(Address address) {
		// TODO Auto-generated method stub
		return addressDao.addAddress(address);
	}
    
	
	//通过id查询地址
	public Address findAddressById(Integer id) {
		// TODO Auto-generated method stub
		return addressDao.findAddressById(id);
	}
    
	
	//修改地址
	public int updateAddress(Address address) {
		// TODO Auto-generated method stub
		return addressDao.updateAddress(address);
	}

	
	//删除地区
	public int delAddress(Integer id) {
		// TODO Auto-generated method stub
		return addressDao.delAddress(id);
	}

	

	public List<Address> findAllSsmc() {
		// TODO Auto-generated method stub
		return addressDao.findAllSsmc();
	}

	public List<Address> findAllQxmc(String ssmc) {
		// TODO Auto-generated method stub
		return addressDao.findAllQxmc(ssmc);
	}

	public Address findIdBySSMC(String ssmc, String qxmc) {
		
		return addressDao.findIdBySSMC(ssmc, qxmc);
	}
	
}
