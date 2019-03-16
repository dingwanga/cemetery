package cn.tiantong.controller;


import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import cn.tiantong.entity.Muqu;
import cn.tiantong.service.MuquService;
import cn.tiantong.util.PageBean;


@Controller("muquController")
@RequestMapping("/statics/muqu")
public class MuquController {
      
	@Resource(name="muquService")
	 private MuquService muquService;
	
	
	
	//分页显示
	@RequestMapping("/muqu-list.html")
	public String showMuquAll(Model model,
			@RequestParam(value="mqmc",required=false)
	         String mqmc,
	         @RequestParam(value="pageNo",required=false)
              Integer pageNo
			){
		
			int pageSize=10;
			if(pageNo==null)
				pageNo=1;
			
			 List<Muqu> muquList = muquService.findAllMuqu();
			 model.addAttribute("muquList", muquList);
			
			//查询所有
			List<Muqu> muqusList=muquService.findAll();
			model.addAttribute("muqusList", muqusList);
			
			PageBean<Muqu> pageBean=muquService.findByPage(mqmc, pageNo, pageSize);
			 if(mqmc!=null )
				 model.addAttribute("mqmc", mqmc);
			model.addAttribute("pageBean", pageBean);
			
		   return "muqu/muqu-list";
	}
	

	//显示新增页面
	@RequestMapping("/muquAdd.html")
	public String showMuquAdd(Model model){
		
		return "muqu/muqu-add";
		
	}
	
	//墓区新增
	@RequestMapping(value="/muqu-add.html",method = RequestMethod.POST)
	public String addMuqu(Model model,Muqu muqu){

		int ret=muquService.addMuQu(muqu);
		
		if(ret>0){
			
		return "redirect:muqu-list.html";
		
		}else{
			return "error";
		}
	}
    
	
	
	/*//用AJAX验证墓区名是否存在
	@RequestMapping("/checkMuqu")
	@ResponseBody
	public Object checkMuquCode(
			@RequestParam(value="mqmc")
			String mqmc
			){
		HashMap<String, String> retMap=new HashMap<String, String>();
		Muqu muqus=muquService.checkMqmc(mqmc);
		if(muqus!=null)
			//存在
			retMap.put("muQuCode", "exist");
		else
			retMap.put("muQuCode", "notexist");
		
		return JSON.toJSONString(retMap);
	}*/
	
	
     //显示修改页面
	@RequestMapping("/muquUpdate.html")
	public String showMuquUpdate(@RequestParam("id")
    Integer id,Model model){
		//通过墓区名称查询墓区信息
		 Muqu MQ = muquService.findMuquById(id);
	     model.addAttribute("MQ", MQ);
		      
		return "muqu/muqu-modify";
		
	}
	
	//墓区修改
	@RequestMapping("/getMuquUpdate.html")
	public String doMuquUpdate(Model model,Muqu muqu){
		      
		   int ret=muquService.updateMuQu(muqu); 
		   
		   if(ret>0){
			   
		return "redirect:muqu-list.html";
		   }else{
			   return "error";
		   }
		
	}
	
	
	//显示历史记录
	@RequestMapping("/orderList.html")
	public String doMuquOrder(@RequestParam("id")
    Integer id){
		System.out.println( "88888");
		return "muqu/muqu-history";
	}
	
	
	//墓区删除
	@RequestMapping("/muquDel.html")
	public String doMuquDel(@RequestParam("id")
    Integer id){
		
		int ret=muquService.delMuqu(id);
		 if(ret>0){
			return "redirect:muqu-list.html";
		 }else{
			return "error";
	     }
		
	}
	
}
