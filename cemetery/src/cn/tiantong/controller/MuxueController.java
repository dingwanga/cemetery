package cn.tiantong.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tiantong.entity.Muqu;
import cn.tiantong.entity.Muxue;
import cn.tiantong.service.MuquService;
import cn.tiantong.service.MuxueService;
import cn.tiantong.util.Json;
import cn.tiantong.util.PageBean;




@Controller("muxueController")

public class MuxueController {
	
	@Resource(name="muquService")
	 private MuquService muquService;
	
	@Resource(name="muxueService")
	 private MuxueService muxueService;
	
	//分页显示
		@RequestMapping("/muxue-list.html")
		public String showMuxueAll(Model model,
				@RequestParam(value="mqmc",required=false)
		         String mqmc,
		         @RequestParam(value="mxmc",required=false)
		         String mxmc,
		         @RequestParam(value="ryqk",required=false)
		         Integer ryqk,
		         @RequestParam(value="dmpb",required=false)
		         Integer dmpb,
		         @RequestParam(value="pageNo",required=false)
	              Integer pageNo
				){
			
				int pageSize=10;
				if(pageNo==null)
					pageNo=1;
				
				//查询所有墓区
				 List<Muqu> muquList = muquService.findAllMuqu();
				 model.addAttribute("muquList", muquList);
				
				//根据墓区查询所有墓穴
				 List<Muxue> muxueList=muxueService.findByMqmcId(mqmc);
				 model.addAttribute("muxueList", muxueList);
				 
				 //查询所有使用情况
				 List<Muxue> syList=muxueService.findAllSy();
				 model.addAttribute("syList", syList);
				 
				 //查询所有定墓判别
				 List<Muxue> dmList=muxueService.findAllDm();
				 model.addAttribute("dmList", dmList);
				PageBean<Muxue> pageBean=muxueService.findByPage(mqmc,mxmc, ryqk, dmpb, pageNo, pageSize);
				List<Muxue> muxues = pageBean.getPageList();
				for(Muxue muxue:muxues){
					if(muxue.getDmpb()==1 || muxue.getSgdbhId()!=null){
						muxue.setRyqk(1);
					}else{
						muxue.setRyqk(0);
					}
				}
				model.addAttribute("pageBean", pageBean);
				
			   return "muxue/muxue-list";
		}
		
		
		@RequestMapping(value = "/getMxmcBymqmcId/{mqmcId}")
	    @ResponseBody
		public Json getMxmcBymqmcId(@PathVariable("mqmcId") String mqmcId) throws UnsupportedEncodingException{
			 mqmcId=URLDecoder.decode(mqmcId,"UTF-8");
			 List<Muxue> muxueList=muxueService.findByMqmcId(mqmcId);
			 if (muxueList!=null){
		            return new Json(true,"success",muxueList);
		        } else {
		            return new Json(false,"fail",null);
		        }
		}
		
		
		//显示新增页面
		@RequestMapping("/muxueAdd.html")
		public String showMuxueAdd(Model model){
			
			//查询所有墓区
			 List<Muqu> muquList = muquService.findAllMuqu();
			 model.addAttribute("muquList", muquList);
			
			return "muxue/muxue-add";
		}
		
		
		//查询信息
		@RequestMapping("/searchMuxue.html")
		public String searchMuxue(Model model,Muxue muxue,HttpServletRequest request){

			//查询所有类别
			List<Muxue> liBieList=muxueService.findAllLeiBie();
			model.addAttribute("liBieList", liBieList);
			 
			//查询所有墓区
			 List<Muqu> muquList = muquService.findAllMuqu();
			 model.addAttribute("muquList", muquList);
			 
			 String mqmc = request.getParameter("mqmc");
			 
			 
			//通过mqmc查询墓区信息
			 Muqu MQ = muquService.findMuquByMumc(mqmc);
		     model.addAttribute("MQ", MQ);
			return "muxue/muxue-add";
		}
		
		
		//墓穴新增
		@RequestMapping("/muxueGetAdd.html")
         public String MuxueAdd(Model model,Muxue muxue,HttpServletRequest request){
			 String mqmc = request.getParameter("mqmc");
		     muxue.setMqmcId(mqmc); 
		     muxueService.addMuxue(muxue);
		     return "redirect:muxue-list.html";
			
		}
		
		
		//显示修改页面
		@RequestMapping("/muxueModify.html")
		public String showMuxueModify(@RequestParam("mqmc")
        String mqmc,@RequestParam("mxid")
        Integer mxid,Model model) throws UnsupportedEncodingException{
			 mqmc = new String(mqmc.getBytes("iso8859-1"),"UTF-8");
			//根据id查询信息
			Muqu muqu=muquService.findMuquByMumc(mqmc);
			model.addAttribute("muqu", muqu);
			
			Muxue muxue = muxueService.fingByMuxueId(mxid);
			model.addAttribute("muxue", muxue);
			
			//查询所有类别
			List<Muxue> liBieList=muxueService.findAllLeiBie();
			 model.addAttribute("liBieList", liBieList);
			 
			return "muxue/muxue-modify";
		}
		
		
		
		//修改墓穴
		@RequestMapping("/muxueUpdate.html")
		public String muxueUpdate(Muxue muxue){
			muxueService.updateMuxue(muxue);
			return "redirect:muxue-list.html";
		}
		
		
		
		
		//删除墓穴
		@RequestMapping("/muxueDel.html")
		public String doMuxueDel(@RequestParam("mxid")
	    Integer mxid){
			
			int ret=muxueService.delMuxue(mxid);
			 if(ret>0){
				return "redirect:muxue-list.html";
			 }else{
				return "error";
		     }
			
		}

}
