package cn.tiantong.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tiantong.entity.Customer;
import cn.tiantong.entity.Muqu;
import cn.tiantong.entity.Muxue;
import cn.tiantong.service.CustomerService;
import cn.tiantong.service.MuquService;
import cn.tiantong.service.MuxueService;
import cn.tiantong.util.PageBean;


@Controller("customerController")
public class CustomerController {
	
	
	@Resource(name="customerService")
	private CustomerService customerService;
	
	@Resource(name="muquService")
	 private MuquService muquService;
	
	@Resource(name="muxueService")
	 private MuxueService muxueService;
	
	@RequestMapping("/customer-list.html")
	public String showCustomer(Model model,HttpServletRequest request,
			@RequestParam(value="sgdbh",required=false)
            String sgdbh,
			@RequestParam(value="mqmc",required=false)
		    String mqmc,
		    @RequestParam(value="mxmc",required=false)
		    String mxmc,
		    @RequestParam(value="lxrxm",required=false)
		    String lxrxm,
		    @RequestParam(value="lxrdh",required=false)
		    String lxrdh,
		    @RequestParam(value="lxrdz",required=false)
		    String lxrdz,
		    @RequestParam(value="syxm",required=false)
		    String syxm,
		    
		   
		    @RequestParam(value="pageNo",required=false)
		     Integer pageNo){
		
				Integer pageSize=10;
				if(pageNo==null)
					pageNo=1;
			
				//查询所有墓区
				 List<Muqu> muquList = muquService.findAllMuqu();
				 model.addAttribute("muquList", muquList);
				
				//根据墓区查询所有墓穴
				 List<Muxue> muxueList=muxueService.findByMqmcId(mqmc);
				 model.addAttribute("muxueList", muxueList);
				 
				//保留查询条件
				 model.addAttribute("sgdbh", sgdbh);
				 model.addAttribute("lxrxm", lxrxm);
				 model.addAttribute("mqmc", mqmc);
				 model.addAttribute("mxmc", mxmc);
				 model.addAttribute("lxrdh", lxrdh);
				 model.addAttribute("lxrdz", lxrdz);
				 model.addAttribute("syxm", syxm);
		
				 
				 PageBean<Customer> pageBean = customerService.findByPage(sgdbh, lxrxm, mqmc, mxmc, syxm, lxrdh, lxrdz, pageNo, pageSize);
				 model.addAttribute("pageBean", pageBean);
				 
	             return "customer/customer-list";
	}
}
