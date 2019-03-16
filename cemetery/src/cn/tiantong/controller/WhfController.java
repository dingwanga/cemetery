package cn.tiantong.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cn.tiantong.entity.Construction;
import cn.tiantong.entity.Muqu;
import cn.tiantong.entity.Muxue;
import cn.tiantong.entity.WfInfomation;

import cn.tiantong.entity.Users;
import cn.tiantong.entity.Whf;
import cn.tiantong.service.ConstructionService;
import cn.tiantong.service.MuquService;
import cn.tiantong.service.MuxueService;
import cn.tiantong.service.UsersService;
import cn.tiantong.service.WfInfomationService;
import cn.tiantong.service.WhfService;
import cn.tiantong.util.PageBean;


@Controller("whfController")
public class WhfController {
	
	@Resource(name="muquService")
	 private MuquService muquService;
	
	@Resource(name="muxueService")
	 private MuxueService muxueService;
	
	 @Resource(name="usersService")
	 private UsersService usersService;
	 
	 @Resource(name="whfService")
	 private WhfService whfService;
	 
	 @Resource(name="wfInfomationService")
	 private WfInfomationService wfInfomationService;
	 @Resource(name="constructionService")
	 private ConstructionService constructionService;
	//维护费页面显示
	@RequestMapping("/weihufei-list.html")
	public String showWhfList(Model model,HttpServletRequest request,
			@RequestParam(value="sgdbh",required=false)
             String sgdbh,
			@RequestParam(value="mqmc",required=false)
		    String mqmc,
		    @RequestParam(value="mxmc",required=false)
		    String mxmc,
		    @RequestParam(value="lxrxm",required=false)
		    String lxrxm,
		    @RequestParam(value="qfrq",required=false)
		    String qfrq,
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
			 
			 HashMap queryParams = new HashMap();
			 String whskrqStart = request.getParameter("whskrqStart");
			 String whskrqEnd = request.getParameter("whskrqEnd");
		
			 if(whskrqStart!=null && !"".equals(whskrqStart)){
				 queryParams.put("whskrqStart", whskrqStart);
			 }
			 if(whskrqEnd!=null && !"".equals(whskrqEnd)){
				 queryParams.put("whskrqEnd", whskrqEnd);
			 }
			 
			 
			//保留查询条件
			 model.addAttribute("sgdbh", sgdbh);
			 model.addAttribute("lxrxm", lxrxm);
			 model.addAttribute("mqmc", mqmc);
			 model.addAttribute("mxmc", mxmc);
			 model.addAttribute("whskrqStart", whskrqStart);
			 model.addAttribute("whskrqEnd", whskrqEnd);
			 model.addAttribute("qfrq", qfrq);
			
			 
			PageBean<Whf> pageBean=whfService.findByPage(sgdbh, lxrxm, mqmc, mxmc, whskrqStart, whskrqEnd, qfrq, pageNo, pageSize);
					
			model.addAttribute("pageBean", pageBean);
			
		return "weihufei/weihufei-list";
	}

	//维护费新建页面显示
	@RequestMapping("/weihufei-add.html")
	public String showWhfAdd(Model model,@RequestParam(value="sgdbh",required=false)
                             String sgdbh){
		//显示结账员
		List<Users> jzyList=usersService.findAllJzy();
		model.addAttribute("jzyList", jzyList);
		
		Whf whf = whfService.findWhfDetailBySgdbh(sgdbh);
		model.addAttribute("whf", whf);
		List<WfInfomation> wfInfos = wfInfomationService.findWfInfomation(sgdbh);
		model.addAttribute("wfInfos", wfInfos);
		if(!StringUtils.isEmpty(sgdbh)){
			Integer xjcs = wfInfomationService.queryXJCS(sgdbh);
			if(xjcs==null || "".equals(xjcs)){
				xjcs=1;
			}
			model.addAttribute("xjcs", xjcs);
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("currentDate", df.format(new Date()));
		return "weihufei/weihufei-add";
	}
	
	//维护费新建
	@RequestMapping("/whfGetAdd.html")
	public String whfGetAdd(HttpServletRequest request,Construction construction,WfInfomation wfInfomation){
		//获取页面输入的维护信息
		String wfksrq = request.getParameter("wfksrq");
		String wfns = request.getParameter("wfns");
		String wfjsrq = request.getParameter("wfjsrq");
		String glf = request.getParameter("glf");
		String wfhj = request.getParameter("wfhj");
		String whskrq = request.getParameter("whskrq");
		String jzy = request.getParameter("jzy");
		String xjcs = request.getParameter("xjcs");
		//将request得到的信息set到Construction和WfInfomation
		if(!StringUtils.isEmpty(wfksrq)){
			construction.setWfksrq(StrToDate(wfksrq));
			wfInfomation.setWfksrq(StrToDate(wfksrq));
		}
		if(!StringUtils.isEmpty(wfns)){
			construction.setWfns(Integer.valueOf(wfns));
			wfInfomation.setWfns(Integer.valueOf(wfns));
		}
		if(!StringUtils.isEmpty(wfjsrq)){
			construction.setWfjsrq(StrToDate(wfjsrq));
			wfInfomation.setWfjsrq(StrToDate(wfjsrq));
			
		}
		Integer mxlb = Integer.valueOf(request.getParameter("mxlb"));
		if(!StringUtils.isEmpty(glf)){//glf
			/*if(mxlb==1){
				construction.setGlf1(new BigDecimal(glf));
			}
			if(mxlb==2){
				construction.setGlf2(new BigDecimal(glf));
			}
			if(mxlb==3){
				construction.setGlf3(new BigDecimal(glf));
			}
			if(mxlb==4){
				construction.setGlf4(new BigDecimal(glf));
			}*/
			wfInfomation.setGlf(new BigDecimal(glf));
		}
		if(!StringUtils.isEmpty(wfhj)){
			construction.setWfhj(new BigDecimal(wfhj));
			wfInfomation.setWfhj(new BigDecimal(wfhj));
		}
		if(!StringUtils.isEmpty(whskrq)){
			construction.setWhskrq(StrToDate(whskrq));
			wfInfomation.setWhskrq(StrToDate(whskrq));
		}
		
		Users user = usersService.findIdByJzy(jzy);
		if(!StringUtils.isEmpty(jzy)){
			construction.setUserId(user.getId());
		}
		if(!StringUtils.isEmpty(xjcs)){
			wfInfomation.setWfinfonum(Integer.valueOf(xjcs));
		}
		//更改施工单维护信息为最终数据 
		constructionService.updateConstructionWfInfo(construction);
		//新增维护费续交信息
		wfInfomationService.addWfInfomation(wfInfomation);
		return "redirect:weihufei-list.html";
	}
	private static Date StrToDate(String str) {  
		   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
		   Date date = null;  
		   try {  
		    date = format.parse(str);  
		   } catch (Exception e) {  
		    e.printStackTrace();  
		   }  
		   return date;  
		} 
	
	
	//维护费修改显示
	@RequestMapping("/showWhfUpdate.html")
	public String showWhfUpdate(Model model,@RequestParam(value="sgdbh",required=false) String sgdbh){
		//根据施工单编号查询维护费信息
		Whf whfUpdate =whfService.updateFindBySgdbh(sgdbh);
		model.addAttribute("whfUpdate", whfUpdate);
		return "weihufei/weihufei-modify";
	}
	
	
	//维护费修改
	@RequestMapping("/whfGetUpdate.html")
	public String whfGetUpdate(Whf whf,WfInfomation wfInfomation,HttpServletRequest request){
		//施工单维护费修改
		whfService.updateWhf(whf);
		//修改最后一次续交的墓穴维护信息
		wfInfomationService.modifyWfInfoMaxXJCS(wfInfomation);
		return "redirect:weihufei-list.html";
	}
	
	
	
	
	//维护费删除
	@RequestMapping("/whfDel.html")
	public String whfDel(@RequestParam(value="sgdbh",required=false) String sgdbh){
		//删除施工单的维护信息
		whfService.updateAndDelWhf(sgdbh);
		//删除维护信息表中的维护信息
		wfInfomationService.delWfinfomation(sgdbh);
		return "redirect:weihufei-list.html";
	}
}
