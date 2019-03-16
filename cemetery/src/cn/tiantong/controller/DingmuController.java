package cn.tiantong.controller;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.tiantong.entity.Dingmu;
import cn.tiantong.entity.Muqu;
import cn.tiantong.entity.Muxue;
import cn.tiantong.entity.Users;
import cn.tiantong.service.DingmuService;
import cn.tiantong.service.MuquService;
import cn.tiantong.service.MuxueService;
import cn.tiantong.service.UsersService;
import cn.tiantong.util.Json;
import cn.tiantong.util.PageBean;



@Controller("dingmuController")
public class DingmuController {
	
	@Resource(name="muquService")
	 private MuquService muquService;
	
	@Resource(name="muxueService")
	 private MuxueService muxueService;
	
	 @Resource(name="usersService")
	 private UsersService usersService;
	 
	 @Resource(name="dingmuService")
	 private DingmuService dingmuService;
	
	//分页显示定墓
	@RequestMapping("/dingmu-list.html")
	public String showDingmu(Model model,HttpServletRequest request,
			@RequestParam(value="mqmc",required=false)
		    String mqmc,
		    @RequestParam(value="mxmc",required=false)
		    String mxmc,
		    @RequestParam(value="sqrxm",required=false)
		    String sqrxm,
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
		 String dmrqStart = request.getParameter("dmrqStart");
		 String dmrqEnd = request.getParameter("dmrqEnd");
	
		 if(dmrqStart!=null && !"".equals(dmrqStart)){
			 queryParams.put("dmrqStart", dmrqStart);
		 }
		 if(dmrqEnd!=null && !"".equals(dmrqEnd)){
			 queryParams.put("dmrqEnd", dmrqEnd);
		 }
		 
		 
		//保留查询条件
		 model.addAttribute("sqrxm", sqrxm);
		 model.addAttribute("dmrqStart", dmrqStart);
		 model.addAttribute("dmrqEnd", dmrqEnd);
		
		 
		PageBean<Dingmu> pageBean=dingmuService.findByPage(sqrxm, mqmc, mxmc, dmrqStart,dmrqEnd, pageNo, pageSize);
		model.addAttribute("pageBean", pageBean);
		
		return "dingmu/dingmu-list";
		
	}
	
	
	
	//显示定墓新建
	@RequestMapping("/dingmuAdd.html")
	public String showDingmuAdd(Model model,HttpServletRequest request
			){
		
		//查询所有墓区
		 List<Muqu> muquList = muquService.findAllMuqu();
		 model.addAttribute("muquList", muquList);
		 
		List<Users> userList=usersService.findAllUser();
		model.addAttribute("userList", userList);
		
		
		 
		return "dingmu/dingmu-add";
		
	}
	
	@RequestMapping("/searchDingmu.html")
	@ResponseBody
	public Muxue searchDingmu(String mqmcId,String mxmcId){
		//通过id查询墓穴信息
		Muxue muxue = muxueService.findByMqAndMx(mqmcId, mxmcId);
		return muxue;
		
	}
	

	
	//定墓新建
	@RequestMapping("/dingmuGetAdd.html")
	public String dingmuAdd(Model model,Dingmu dingmu,HttpServletRequest request){
		
		String jzyId = request.getParameter("jzyId");
		dingmu.setJzyId(Integer.valueOf(jzyId));
		dingmuService.modifyDingmu(dingmu);
		return "redirect:dingmu-list.html";
	}
	
	
	
	
	//显示定墓修改
	@RequestMapping("/showDingmuUpdate.html")
	public String showDingmuUpdate(Model model,HttpServletRequest request,@RequestParam("mxid")
    Integer mxid){
		
		List<Users> userList=usersService.findAllUser();
		model.addAttribute("userList", userList);
		
		 Dingmu dm = dingmuService.fingByDingmuId(mxid);
		 model.addAttribute("dm", dm); 
		 
		return "dingmu/dingmu-modify";
		
	}
	
	
	//定墓修改
		@RequestMapping("/DingmuUpdate.html")
		public String DingmuUpdate(HttpServletRequest request,Dingmu dingmu){
			
			String jzyId = request.getParameter("jzyId");
			dingmu.setJzyId(Integer.valueOf(jzyId));
			
			dingmuService.UpdateDingmu(dingmu);
			return "redirect:dingmu-list.html";
		}
	
	
	
	//删除定墓
		@RequestMapping("/DingmuDel.html")
		public String DingmuDel(Dingmu dingmu){
			dingmuService.delDingmu(dingmu);
			return "redirect:dingmu-list.html";
		}
		
		
	
	@RequestMapping(value = "/findByMqmcIdAndZeroOfDMPB/{mqmcId}")
    @ResponseBody
	public Json findByMqmcIdAndZeroOfDMPB(@PathVariable("mqmcId") String mqmcId) throws UnsupportedEncodingException{
		 mqmcId=URLDecoder.decode(mqmcId,"UTF-8");
		 List<Muxue> muxueList=muxueService.findByMqmcIdAndZeroOfDMPB(mqmcId);
		 if (muxueList!=null){
	            return new Json(true,"success",muxueList);
	        } else {
	            return new Json(false,"fail",null);
	        }
	}
	
	
	
}
