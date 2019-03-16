package cn.tiantong.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tiantong.entity.BusinessCount;
import cn.tiantong.entity.Kzcx;
import cn.tiantong.entity.Symx;
import cn.tiantong.service.BusinessCountService;
import cn.tiantong.service.KzcxService;
import cn.tiantong.service.MuquService;
import cn.tiantong.service.MuxueService;
import cn.tiantong.service.SymxService;
import cn.tiantong.service.TombsCountService;
import cn.tiantong.util.PageBean;


@Controller("kzcxController")
public class MarketingManagementController {
	
	@Resource(name="kzcxService")
	private KzcxService kzcxService;
	@Resource(name="tombsCountService")
	private TombsCountService tombsCountService;
	@Resource(name="businessCountService")
    private BusinessCountService businessCountService;
	@Resource(name="symxService")
	private SymxService symxService;
	//刻字瓷像统计显示
	@RequestMapping("showKzcx.html")
	public String showKzcx(Model model,HttpServletRequest request){
		 HashMap queryParams = new HashMap();
		 String jzskrqStart = request.getParameter("jzskrqStart");
		 String zxblrqEnd = request.getParameter("zxblrqEnd");
		 if(jzskrqStart!=null && !"".equals(jzskrqStart)){
			 queryParams.put("jzskrqStart", jzskrqStart);
		 }
		 if(zxblrqEnd!=null && !"".equals(zxblrqEnd)){
			 queryParams.put("zxblrqEnd", zxblrqEnd);
		 }
		 
		 model.addAttribute("jzskrqStart", jzskrqStart);
		 model.addAttribute("zxblrqEnd", zxblrqEnd);
         Kzcx kzcx = kzcxService.getCount(queryParams);
		 model.addAttribute("kzcx", kzcx);
		return "sale/KZCX";
	}
	//墓穴统计
	@SuppressWarnings("unchecked")
	@RequestMapping("muxueCalculate.html")
	public String muxueCalculate(Model model,HttpServletRequest request){
		HashMap queryParams = new HashMap();
		 String syrqStart = request.getParameter("syrqStart");
		 String syrqEnd = request.getParameter("syrqEnd");
		 if(!StringUtils.isEmpty(syrqStart)){
			 queryParams.put("syrqStart", syrqStart);
		 }
		 if(!StringUtils.isEmpty(syrqStart)){
			 queryParams.put("syrqEnd", syrqEnd);
		 }
		//查询墓穴使用数
		Integer ryqkCount = tombsCountService.findRyqkCount(queryParams);
		//查询已定墓数
		Integer dmpbCount = tombsCountService.findDmpbCount(queryParams);
		//查询墓穴个数
		Integer mxgsNum = tombsCountService.findMxgs();
		//空墓数
		Integer emptyMuxueCount = mxgsNum - ryqkCount;
		model.addAttribute("ryqkCount", ryqkCount);
		model.addAttribute("dmpbCount", dmpbCount);
		model.addAttribute("emptyMuxueCount", emptyMuxueCount);
		model.addAttribute("mxgsNum", mxgsNum);
		return "sale/tombsCount";
	}
	
	//显示业务统计界面
	@RequestMapping("showBusinessCount.html")
	public String showBusinessCount(Model model,HttpServletRequest request){
		HashMap queryParams = new HashMap();
		 String syrqStart = request.getParameter("syrqStart");
		 String syrqEnd = request.getParameter("syrqEnd");
		 if(!StringUtils.isEmpty(syrqStart)){
			 queryParams.put("syrqStart", syrqStart);
		 }
		 if(!StringUtils.isEmpty(syrqStart)){
			 queryParams.put("syrqEnd", syrqEnd);
		 }
		 List<BusinessCount>  businessCounts = businessCountService.getBusinessInfo(queryParams);
		 int mdfTotal = 0;
		 for(BusinessCount businessCount : businessCounts){
			 BigDecimal mdf = businessCount.getMdf();
             if(mdf==null){
            	 mdf = new BigDecimal(0);
             }
			 int mdfInt = mdf.intValue();
			 BigDecimal mdf1 = businessCount.getMdf1();
			 if(mdf1==null){
				 mdf1 = new BigDecimal(0);
             }
			 int mdfInt1 = mdf1.intValue();
			 BigDecimal mdf2 = businessCount.getMdf2();
			 if(mdf2==null){
				 mdf2 = new BigDecimal(0);
             }
			 int mdfInt2 = mdf2.intValue();
			 BigDecimal mdf3 = businessCount.getMdf3();
			 if(mdf3==null){
				 mdf3 = new BigDecimal(0);
             }
			 int mdfInt3 = mdf3.intValue();
			 BigDecimal mdf4 = businessCount.getMdf4();
			 if(mdf4==null){
				 mdf4 = new BigDecimal(0);
             }
			 int mdfInt4 = mdf4.intValue();
			 mdfTotal = mdfInt + mdfInt1 + mdfInt2 + mdfInt3 + mdfInt4;
			 businessCount.setMdfTotal(mdfTotal);
		 }
		 model.addAttribute("businessCounts", businessCounts);
		return "sale/businessCount";
	}
	
	 //使用明细显示
	@RequestMapping("showSymx.html")
	public String showSymx(Model model,HttpServletRequest request){
		HashMap queryParams = new HashMap();
		 String syrqStart = request.getParameter("syrqStart");
		 String syrqEnd = request.getParameter("syrqEnd");
		 if(!StringUtils.isEmpty(syrqStart)){
			 queryParams.put("syrqStart", syrqStart);
		 }
		 if(!StringUtils.isEmpty(syrqStart)){
			 queryParams.put("syrqEnd", syrqEnd);
		 }
		List<Symx> symxs = symxService.getSymxCount(queryParams);
		int syqkTotalsh = 0;
		int syqkTotalg = 0;
	    for(Symx symx : symxs){
	    	int syqkSum = symx.getSyqkSum();
	    	int sy1qksh = Integer.valueOf(symx.getSy1qk());
	    	int sy1qkg = syqkSum - sy1qksh;
	    	int sy2qksh = Integer.valueOf(symx.getSy2qk());
	    	int sy2qkg = syqkSum - sy2qksh;
	    	int sy3qksh = Integer.valueOf(symx.getSy3qk());
	    	int sy3qkg = syqkSum - sy3qksh;
	    	int sy4qksh = Integer.valueOf(symx.getSy4qk());
	    	int sy4qkg = syqkSum - sy4qksh;
	    	syqkTotalsh = sy1qksh + sy2qksh + sy3qksh + sy4qksh;
	    	syqkTotalg = sy1qkg + sy2qkg + sy3qkg + sy4qkg;
	    	symx.setSyqkTotalsh(syqkTotalsh);
	    	symx.setSyqkTotalg(syqkTotalg);
	    }
	    model.addAttribute("symxList", symxs);
		return "sale/SYMX";
	}
	
}
