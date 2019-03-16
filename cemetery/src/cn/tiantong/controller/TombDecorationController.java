package cn.tiantong.controller;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.tiantong.entity.CiXiang;
import cn.tiantong.entity.Construction;
import cn.tiantong.entity.InscriptionEditor;
import cn.tiantong.entity.TombDecoration;
import cn.tiantong.entity.Users;
import cn.tiantong.service.CiXiangService;
import cn.tiantong.service.ConstructionService;
import cn.tiantong.service.InscriptionEditorService;
import cn.tiantong.service.TombDecorationService;
import cn.tiantong.service.UsersService;
import cn.tiantong.util.PageBean;

@Controller("tombDecorationController")
public class TombDecorationController {
	
		@Resource(name="tombDecorationService")
		private TombDecorationService tombDecorationService;
		
		@Resource(name="constructionService")
		private ConstructionService constructionService;
	
	    @Resource(name="usersService")
	    private UsersService usersService;
	 
	    @Resource(name="ciXiangService")
	    private CiXiangService ciXiangService;
	    @Resource(name="inscriptionEditorService")
		private InscriptionEditorService inscriptionEditorService;
	@RequestMapping("/tombDecoration-list.html")
	public String showTombDecoration(Model model,
			@RequestParam(value="sgdbh",required=false)
		    String sgdbh,
		    @RequestParam(value="pageNo",required=false)
		    Integer pageNo,HttpServletRequest request){

			int pageSize=10;
			if(pageNo==null)
				pageNo=1;
			
			//保留查询条件			
			model.addAttribute("sgdbh", sgdbh);
			
			PageBean<TombDecoration> pageBean = tombDecorationService.findByPage(sgdbh, pageNo, pageSize);
			model.addAttribute("pageBean", pageBean);
					
				
				return "yingxiao/tombDecoration/tombDecoration-list"; 
			}
	
	 
		     
	  		//显示墓穴装修新建页面
			@RequestMapping("/tombDecorationShowAdd.html")
			public String tombDecorationShowAdd(Model model){
				
				//显示结账员信息
				List<Users> jzyList=usersService.findAllJzy();
				model.addAttribute("jzyList", jzyList);
				
				//显示所有瓷像
				List<CiXiang> ciXiangList=ciXiangService.findAll();
				model.addAttribute("ciXiangList", ciXiangList);
				
				return "yingxiao/tombDecoration/tombDecoration-add";
			}
	
			
	        //查询信息
			@RequestMapping("/searchMuxueZhuangxiu.html")
			@ResponseBody
			public TombDecoration searchMuxueZhuangxiu(String sgdbhId){
				//查询所有施工单信息
				TombDecoration tombDecoration = tombDecorationService.findBySgdbhMuxueZhuangxiu(sgdbhId);
				return tombDecoration;
			}
			
			
			//墓穴装修新建
			@RequestMapping("/tombDecorationAdd.html")
			public String tombDecorationAdd(HttpServletRequest request,TombDecoration tombDecoration){
					//根据业务员查询id
					String jzy = request.getParameter("jzyName");
					Users user = usersService.findIdByJzy(jzy);
					String cxmc = request.getParameter("cxmc");
					//根据瓷像名称查询瓷像id
					//CiXiang ciXiang = ciXiangService.findCxIdByCxmc(cxmc);
					 
					 //装修新增
					tombDecoration.setUserId(user.getId());
					tombDecoration.setCxId(Integer.valueOf(cxmc));
					tombDecorationService.updateMuxueZhuangxiu(tombDecoration);
					
				   return "redirect:tombDecoration-list.html";
				
			}
			
			//显示墓穴装修修改页面
			@RequestMapping("/showUpdateTombDecoration.html")
			public String showUpdateTombDecoration(Model model,@RequestParam(value="sgdbh",required=false)
	        String sgdbh){
				
				//显示所有瓷像
				List<CiXiang> ciXiangList=ciXiangService.findAll();
				model.addAttribute("ciXiangList", ciXiangList);
				
				//显示结账员
				List<Users> jzyList=usersService.findAllJzy();
				model.addAttribute("jzyList", jzyList);
			    TombDecoration tombDecoration = tombDecorationService.findMXZXModify(sgdbh);
			    model.addAttribute("tombDecoration", tombDecoration);
				return "yingxiao/tombDecoration/tombDecoration-modify";
			}
			
			//显示墓穴装修詳情
			@RequestMapping("/showTombDecorationDetail.html")
			public String showTombDecorationDetail(Model model,@RequestParam(value="sgdbh",required=false)
	        String sgdbh){
			    TombDecoration tombDecoration = tombDecorationService.findMXZXModify(sgdbh);
			    model.addAttribute("tombDecoration", tombDecoration);
				return "yingxiao/tombDecoration/tombDecoration-detail";
			}
			//墓穴装修删除
			@RequestMapping("/deleteTombDecoration.html")
			public String deleteTombDecoration(Model model,@RequestParam(value="sgdbh",required=false)
	        String sgdbh){
			   tombDecorationService.deleteMuxueZhuangxiu(sgdbh);
			   return "redirect:tombDecoration-list.html";
			}
			
		}
