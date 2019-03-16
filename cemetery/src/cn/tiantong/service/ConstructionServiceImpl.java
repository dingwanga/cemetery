package cn.tiantong.service;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.ConstructionDao;
import cn.tiantong.entity.Construction;
import cn.tiantong.util.PageBean;



@Service("constructionService")
public class ConstructionServiceImpl implements ConstructionService {

	@Resource(name="constructionDao")
	private ConstructionDao constructionDao;

	public PageBean<Construction> findByPage(String sgdbh, Integer pageNo,
			Integer pageSize) {
		PageBean<Construction> pageBean=new PageBean<Construction>();
		pageBean.setPageSize(pageSize);
		int totalCount=constructionDao.getCount(sgdbh);
		pageBean.setTotalCount(totalCount);
		pageBean.setCurPageNo(pageNo);
		Integer start=(pageBean.getCurPageNo()-1)*pageSize;
		List<Construction> pageList=constructionDao.findByPage(sgdbh, start, pageSize);
		pageBean.setPageList(pageList);
		return pageBean;
	}
	
	

	//查询库中最大的施工单编号
	public String querySGDnO() {
		return constructionDao.querySGDnO();
	}
	
	//施工单新增
	public Integer addConstruction(Construction construction) {
		// TODO Auto-generated method stub
		return constructionDao.addConstruction(construction);
	}
	//施工单修改
	public void updateConstruction(Construction construction){
		constructionDao.updateConstruction(construction);
	}
	
	//根据施工单编号查询信息
	public Construction findBySgdbh(String sgdbh) {
		Construction con = constructionDao.findBySgdbh(sgdbh);
		if(con!=null){
			if(con.getMdf1()==null){
				con.setMdf1(new BigDecimal("0.00"));
			}
			if(con.getMdf2()==null){
				con.setMdf2(new BigDecimal("0.00"));
			}
			if(con.getMdf3()==null){
				con.setMdf3(new BigDecimal("0.00"));
			}
			if(con.getMdf4()==null){
				con.setMdf4(new BigDecimal("0.00"));
			}
			if(con.getMdf()==null){
				con.setMdf(new BigDecimal("0.00"));
			}
			if(con.getClf1()==null){
				con.setClf1(new BigDecimal("0.00"));
			}
			if(con.getClf2()==null){
				con.setClf2(new BigDecimal("0.00"));
			}
			if(con.getClf3()==null){
				con.setClf3(new BigDecimal("0.00"));
			}
			if(con.getClf4()==null){
				con.setClf4(new BigDecimal("0.00"));
			}
			if(con.getClf()==null){
				con.setClf(new BigDecimal("0.00"));
			}
			if(con.getLzf1()==null){
				con.setLzf1(new BigDecimal("0.00"));
			}
			if(con.getLzf2()==null){
				con.setLzf2(new BigDecimal("0.00"));
			}
			if(con.getLzf3()==null){
				con.setLzf3(new BigDecimal("0.00"));
			}
			if(con.getLzf4()==null){
				con.setLzf4(new BigDecimal("0.00"));
			}
			if(con.getLhf()==null){
				con.setLhf(new BigDecimal("0.00"));
			}
			if(con.getLhf1()==null){
				con.setLhf1(new BigDecimal("0.00"));
			}
			if(con.getLhf2()==null){
				con.setLhf2(new BigDecimal("0.00"));
			}
			if(con.getLhf3()==null){
				con.setLhf3(new BigDecimal("0.00"));
			}
			if(con.getLhf4()==null){
				con.setLhf4(new BigDecimal("0.00"));
			}
		}
		return con;
	}

	//根据施工单编号删除一条施工单数据
	public void delConstruction(String sgdbh) {
		constructionDao.delConstruction(sgdbh);
	}


	//更改施工单维护信息为最终数据 
	public void updateConstructionWfInfo(Construction construction) {
		constructionDao.updateConstructionWfInfo(construction);
		
	}
   //根据施工单编号查询维护信息是否为空
	public Construction queryWFKSRQIsNull(String sgdbh) {
		Construction con = constructionDao.queryWFKSRQIsNull(sgdbh);
		return con;
	}

}
