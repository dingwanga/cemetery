package cn.tiantong.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import cn.tiantong.entity.Address;
import cn.tiantong.entity.CiXiang;
import cn.tiantong.entity.Construction;
import cn.tiantong.entity.Dingmu;
import cn.tiantong.entity.InscriptionEditor;
import cn.tiantong.entity.Muqu;
import cn.tiantong.entity.Muxue;
import cn.tiantong.entity.WfInfomation;

import cn.tiantong.entity.Users;
import cn.tiantong.service.AddressService;
import cn.tiantong.service.CiXiangService;
import cn.tiantong.service.ConstructionScheduleService;
import cn.tiantong.service.ConstructionService;
import cn.tiantong.service.DingmuService;
import cn.tiantong.service.InscriptionEditorService;
import cn.tiantong.service.MuquService;
import cn.tiantong.service.MuxueService;
import cn.tiantong.service.UsersService;
import cn.tiantong.service.WfInfomationService;
import cn.tiantong.util.Json;
import cn.tiantong.util.ObjectUtils;
import cn.tiantong.util.PageBean;


@Controller("constructionController")
public class ConstructionController{
	
	@Resource(name="muquService")
	 private MuquService muquService;
	
	@Resource(name="muxueService")
	 private MuxueService muxueService;
	
	 @Resource(name="usersService")
	 private UsersService usersService;
	 
	 @Resource(name="dingmuService")
	 private DingmuService dingmuService;
	 
	@Resource(name="constructionService")
	private ConstructionService constructionService;
	
	@Resource(name="ciXiangService")
	private CiXiangService ciXiangService;
	
	@Resource(name="addressService")
	private AddressService addressService;
	@Resource(name="inscriptionEditorService")
	private InscriptionEditorService inscriptionEditorService;
	@Resource(name="constructionScheduleService")
	private ConstructionScheduleService constructionScheduleService;
	@Resource(name="wfInfomationService")
	private WfInfomationService wfInfomationService;
	
	private static final int ZERO = 0;
	private static final int EIGHT = 8;
	//分頁显示施工单
	@RequestMapping("/construction-list.html")
	public String showConstruction(Model model,
			@RequestParam(value="sgdbh",required=false)
                          String sgdbh,
                          @RequestParam(value="pageNo",required=false)
                          Integer pageNo,HttpServletRequest request){
		
							int pageSize=10;
							if(pageNo==null)
								pageNo=1;
							
				//保留查询条件			
			model.addAttribute("sgdbh", sgdbh);
			
			PageBean<Construction> pageBean=constructionService.findByPage(sgdbh, pageNo, pageSize);
			model.addAttribute("pageBean", pageBean);
		    return "yingxiao/construction/construction-list";
	}



	private String queryCurrentMaxDateStr() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");//设置日期格式
		String currentDateStr = df.format(new Date());
		return currentDateStr;
	}
	

	
	//显示新建页面
	@RequestMapping("/constructionAddShow.html")
	public String constructionAddShow(Model model,HttpServletRequest request){
		String sgdNum = request.getParameter("sgdNum");
		model.addAttribute("sgdNum", sgdNum);
		//显示结账员
		List<Users> jzyList=usersService.findAllJzy();
		model.addAttribute("jzyList", jzyList);
		
		//显示业务员
		List<Users> userList=usersService.findAllUser();
		model.addAttribute("userList", userList);
		
		
		//显示所有的墓区名称
		List<Muqu> muquList = muquService.findAllMuqu();
		 model.addAttribute("muquList", muquList);
		 
		//显示所有省市名称
		 List<Address> addressList=addressService.findAllSsmc();
		 model.addAttribute("addressList", addressList);
		 
		//显示所有瓷像
		List<CiXiang> ciXiangList=ciXiangService.findAll();
		model.addAttribute("ciXiangList", ciXiangList);
		
		
		//施工单编号解决
		String libraryMaxSGDNo = constructionService.querySGDnO();
		String maxDateStr = libraryMaxSGDNo.substring(ZERO,EIGHT);
		String currentDateStr = queryCurrentMaxDateStr();
		String newSGDNo = null;
		if(!currentDateStr.equals(maxDateStr)){
			newSGDNo = currentDateStr+"001";
		}else{
			long libraryMaxSGDNoLong = new BigDecimal(libraryMaxSGDNo).longValue()+1;
			newSGDNo = String.valueOf(libraryMaxSGDNoLong);
		}
		model.addAttribute("newSGDNo", newSGDNo);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("currentDate", df.format(new Date()));
		return "yingxiao/construction/construction-add";
	}
	
	
	//省市区县二级联动
	@RequestMapping(value = "/getQxmcBySsmc/{ssId}")
    @ResponseBody
	public Json getQxmcBySsmc(@PathVariable("ssId") String ssId) throws UnsupportedEncodingException{
		String ssmc=URLDecoder.decode(ssId,"UTF-8");
		List<Address> qxmcList=addressService.findAllQxmc(ssmc);
		 if (qxmcList!=null){
	            return new Json(true,"success",qxmcList);
	        } else {
	            return new Json(false,"fail",null);
	        }
	}
	
	
	
	@RequestMapping(value = "/queryMxmcByMqmcAndDmpb")
    @ResponseBody
	public Json queryMxmcByMqmcAndDmpb(Integer dmpbValue,String mqmcValue){
		List<Muxue> muxues = muxueService.queryMxmcByMqmcAndDmpb(mqmcValue,dmpbValue);
		if (muxues!=null){
            return new Json(true,"success",muxues);
        } else {
            return new Json(false,"fail",muxues);
        }
	}
	
	@RequestMapping(value = "/queryModifyMxmcByMqmcAndDmpb")
	@ResponseBody
	public Json queryModifyMxmcByMqmcAndDmpb(Integer dmpbValue,String mqmcValue,String sgdNumValue){
		List<Muxue> muxues = muxueService.queryModifyMxmcByMqmcAndDmpb(mqmcValue,dmpbValue, sgdNumValue);
		if (muxues!=null){
			return new Json(true,"success",muxues);
		} else {
			return new Json(false,"fail",muxues);
		}
	}
	
	//瓷像瓷像单价二级联动
		@RequestMapping(value = "/findCxdjByCxmc/{cxId}")
	    @ResponseBody
		public Json findCxdjByCxmc(@PathVariable("cxId") Integer cxId) throws UnsupportedEncodingException{
			 //cxId=URLDecoder.decode(cxId,"UTF-8");
			 CiXiang inputCxdj=ciXiangService.findCiXiangById(cxId);
			 if (inputCxdj!=null){
		            return new Json(true,"success",inputCxdj);
		        } else {
		            return new Json(false,"fail",null);
		        }
		}
		
		
		//根据墓区墓穴名称确定墓穴类别
		@RequestMapping(value = "/findMxlbByMqmcIdAndMxmc")
	    @ResponseBody
	    public Dingmu findMxlbByMqmcIdAndMxmc(String mqmcValue,String mxmcValue){
			Dingmu dingmuLb =dingmuService.findMxlbByMqmcIdAndMxmc(mqmcValue, mxmcValue);
			if(StringUtils.isEmpty(dingmuLb)){
				return null;
			}
			return dingmuLb;
		}
	
		
		//根据定墓判别，墓区名称，墓穴名称查询定墓金额和日期
		@RequestMapping(value = "/findDmjeAndDmrqByMqmcIdAndMxmcAndDmpb")
	    @ResponseBody
	    public Dingmu findDmjeAndDmrqByMqmcIdAndMxmcAndDmpb(String mqmcValue,String mxmcValue,Integer dmpbValue){
			Dingmu dingmuPb =dingmuService.findDmjeAndDmrqByMqmcIdAndMxmcAndDmpb(mqmcValue, mxmcValue,dmpbValue);
			if(StringUtils.isEmpty(dingmuPb)){
				return null;
			}
			return dingmuPb;
		}
		
		@RequestMapping(value = "/queryUserByJZY")
	    @ResponseBody
	    public Users queryUserByJZY(String jzyId){
			Users user =usersService.findUsersById(Integer.valueOf(jzyId));
			if(StringUtils.isEmpty(user)){
				return null;
			}
			return user;
		}
		
		//施工单新建
		@RequestMapping("/sgdGetAdd.html")
		public String sgdGetAdd(Model model,HttpServletRequest request,
				Construction construction,Address address,Muxue muxue,WfInfomation wfInfomation,String jzyId){
			String jzskrq = request.getParameter("jzskrq");
			//construction.setJzskrq(java.sql.Date.valueOf(jzskrq));
			if(!StringUtils.isEmpty(jzskrq)){
				construction.setJzskrq(StrToDate(jzskrq));
			}
			
			String fjfrq = request.getParameter("fjfrq");
			if(!StringUtils.isEmpty(fjfrq)){
				construction.setFjfrq(StrToDate(fjfrq));
			}
			
			String fjskrq = request.getParameter("fjskrq");
			if(!StringUtils.isEmpty(fjskrq)){
				construction.setFjskrq(StrToDate(fjskrq));
			}
			
			String yylzrq = request.getParameter("yylzrq");
			if(!StringUtils.isEmpty(yylzrq)){
				construction.setYylzrq(StrToDate(yylzrq));
			}
			
			String wfksrq = request.getParameter("wfksrq");
			if(!StringUtils.isEmpty(wfksrq)){
				construction.setWfksrq(StrToDate(wfksrq));
				wfInfomation.setWfksrq(StrToDate(wfksrq));
			}
			
			String wfjsrq = request.getParameter("wfjsrq");
			if(!StringUtils.isEmpty(wfjsrq)){
				construction.setWfjsrq(StrToDate(wfjsrq));
				wfInfomation.setWfjsrq(StrToDate(wfjsrq));
			}
			String wfns = request.getParameter("wfns");
			if(!StringUtils.isEmpty(wfns)){
				wfInfomation.setWfns(Integer.valueOf(wfns));
			}
			String glf = request.getParameter("glf");
			if(!StringUtils.isEmpty(glf)){
				wfInfomation.setGlf(new BigDecimal(glf));
			}
			String wfhj = request.getParameter("wfhj");
			if(!StringUtils.isEmpty(wfhj)){
				wfInfomation.setWfhj(new BigDecimal(wfhj));
			}
			String whskrq = request.getParameter("whskrq");
			if(!StringUtils.isEmpty(whskrq)){
				construction.setWhskrq(StrToDate(whskrq));
				wfInfomation.setWhskrq(StrToDate(whskrq));
			}
			String sgdbh = request.getParameter("sgdbh");
			wfInfomation.setSgdbh(sgdbh);
			if(jzyId!=null && !"".equals(jzyId)){
				construction.setUserId(Integer.valueOf(jzyId));
			}
			Address dz = null;
			String ssmc = request.getParameter("ssmc");
			String qxmc = request.getParameter("qxmc");
			if(ssmc!=null && !"".equals(ssmc)){
				if(qxmc!=null && !"".equals(qxmc)){
					dz = addressService.findIdBySSMC(ssmc, qxmc);
					construction.setLzqxId(dz.getId());
				}
			}
			String cxmc = request.getParameter("cxmc");
			if(cxmc!=null && !"".equals(cxmc)){
				construction.setCxId(Integer.valueOf(cxmc));
			}
			constructionService.addConstruction(construction);
			constructionScheduleService.addSGDBHForSGJD(sgdbh);
			muxue.setSgdbhId(sgdbh);
			muxueService.updateSGDBHForMuxue(muxue);
			if(!StringUtils.isEmpty(wfksrq) && !StringUtils.isEmpty(wfjsrq)){
				//添加墓穴维护信息
				wfInfomationService.addWfInfomationForsgd(wfInfomation);
			}
			return "redirect:construction-list.html";
		}
		//施工单新建
		@RequestMapping("/updateSGD.html")
		public String updateSGD(Model model,HttpServletRequest request,
				Construction construction,Address address,Muxue muxue,WfInfomation wfInfomation){
			String jzskrq = request.getParameter("jzskrq");
			//construction.setJzskrq(java.sql.Date.valueOf(jzskrq));
			if(!StringUtils.isEmpty(jzskrq)){
				construction.setJzskrq(StrToDate(jzskrq));
			}
			
			String fjfrq = request.getParameter("fjfrq");
			if(!StringUtils.isEmpty(fjfrq)){
				construction.setFjfrq(StrToDate(fjfrq));
			}
			
			String fjskrq = request.getParameter("fjskrq");
			if(!StringUtils.isEmpty(fjskrq)){
				construction.setFjskrq(StrToDate(fjskrq));
			}
			
			String yylzrq = request.getParameter("yylzrq");
			if(!StringUtils.isEmpty(yylzrq)){
				construction.setYylzrq(StrToDate(yylzrq));
			}
			
			String wfksrq = request.getParameter("wfksrq");
			if(!StringUtils.isEmpty(wfksrq)){
				construction.setWfksrq(StrToDate(wfksrq));
				wfInfomation.setWfksrq(StrToDate(wfksrq));
			}
			
			String wfjsrq = request.getParameter("wfjsrq");
			if(!StringUtils.isEmpty(wfjsrq)){
				construction.setWfjsrq(StrToDate(wfjsrq));
				wfInfomation.setWfjsrq(StrToDate(wfjsrq));
			}
			String wfns = request.getParameter("wfns");
			if(!StringUtils.isEmpty(wfns)){
				wfInfomation.setWfns(Integer.valueOf(wfns));
			}
			String glf = request.getParameter("glf");
			if(!StringUtils.isEmpty(glf)){
				wfInfomation.setGlf(new BigDecimal(glf));
			}
			String wfhj = request.getParameter("wfhj");
			if(!StringUtils.isEmpty(wfhj)){
				wfInfomation.setWfhj(new BigDecimal(wfhj));
			}
			String whskrq = request.getParameter("whskrq");
			if(!StringUtils.isEmpty(whskrq)){
				construction.setWhskrq(StrToDate(whskrq));
				wfInfomation.setWhskrq(StrToDate(whskrq));
			}
			String sgdbh = request.getParameter("sgdbh");
			String jzyId = request.getParameter("jzyId");
			if(jzyId!=null && !"".equals(jzyId)){
				construction.setUserId(Integer.valueOf(jzyId));
			}
			Address dz =  null;
			String ssmc = request.getParameter("ssmc");
			String qxmc = request.getParameter("qxmc");
			if(ssmc!=null && !"".equals(ssmc)){
				if(qxmc!=null && !"".equals(qxmc)){
					dz = addressService.findIdBySSMC(ssmc, qxmc);
					construction.setLzqxId(dz.getId());
				}
			}
			String cxmc = request.getParameter("cxmc");
			if(cxmc!=null && !"".equals(cxmc)){
				construction.setCxId(Integer.valueOf(cxmc));
			}
			String bjje = request.getParameter("bjje");
			if(!StringUtils.isEmpty(bjje)){
				construction.setBjje(new BigDecimal(bjje));
			}
			String bjrq = request.getParameter("bjrq");
			if(!StringUtils.isEmpty(bjrq)){
				construction.setBjrq(StrToDate(bjrq));
			}
			//constructionScheduleService.addSGDBHForSGJD(sgdbh);
			Construction con = constructionService.queryWFKSRQIsNull(sgdbh);
			if(StringUtils.isEmpty(con.getWfksrq()) && StringUtils.isEmpty(con.getWfjsrq())){
				//添加墓穴维护信息
				wfInfomationService.addWfInfomationForsgd(wfInfomation);
			}else{
				//修改墓穴维护信息
				wfInfomationService.modifyWfInfomation(wfInfomation);
			}
			constructionService.updateConstruction(construction);
			muxue.setSgdbhId(sgdbh);
			String mqmc = request.getParameter("mqmcId");
			String mxmc = request.getParameter("mxmc");
			//設置施工单编号不为null
//			if(mqmc!=null && !"".equals(mqmc)){
//				if(mxmc!=null && !"".equals(mxmc)){
//					muxueService.updateSGDBHForMuxue(muxue);
//				}
//			}
			
			return "redirect:construction-list.html";
		}
		@RequestMapping("/queryWordsCount.html")
		@ResponseBody
		public void queryWordsCount(String sgdbh,String editorText,String wordsNumber){
			InscriptionEditor inscriptionEditor = new InscriptionEditor();
			inscriptionEditor.setEditorText(editorText);
			inscriptionEditor.setWordsNumber(Integer.valueOf(wordsNumber));
			inscriptionEditor.setSgdbh(sgdbh);
			inscriptionEditorService.addInscriptEditor(inscriptionEditor);
		}
		public static Date StrToDate(String str) {  
		    
			   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
			   Date date = null;  
			   try {  
			    date = format.parse(str);  
			   } catch (Exception e) {  
			    e.printStackTrace();  
			   }  
			   return date;  
			} 
		
		
		//显示修改页面
		@RequestMapping("/showUpdateSgd.html")
		public String showUpdateSgd(Model model,@RequestParam(value="sgdbh",required=false) String sgdbh,
									@RequestParam(value="mqmcId",required=false) String mqmcId,
									@RequestParam(value="mxmc",required=false) String mxmc,
									Muxue muxue){
			
			//显示结账员
			List<Users> jzyList=usersService.findAllJzy();
			model.addAttribute("jzyList", jzyList);
			
			//显示所有的墓区名称
			List<Muqu> muquList = muquService.findAllMuqu();
			 model.addAttribute("muquList", muquList);
			 
			//显示所有省市名称
			 List<Address> addressList=addressService.findAllSsmc();
			 model.addAttribute("addressList", addressList);
			 
			//显示所有瓷像
			List<CiXiang> ciXiangList=ciXiangService.findAll();
			model.addAttribute("ciXiangList", ciXiangList);
			
			Construction con = constructionService.findBySgdbh(sgdbh);
			CiXiang cixiang = ciXiangService.findCiXiangById(con.getCxId());
			model.addAttribute("con", con);
			model.addAttribute("cixiang", cixiang);
			//將施工单编号设置为null
//			if(!StringUtils.isEmpty(mqmcId)){
//				muxue.setMqmcId(mqmcId);
//				muxue.setMxmc(mxmc);
//				muxueService.updateSGDBHIsNull(muxue);
//			}
			
			return "yingxiao/construction/construction-modify";
		}
		@RequestMapping("/constructionDetails.html")
		public String showMuxueDetails(Model model,@RequestParam(value="sgdbh",required=false)
        String sgdbh){
			
			//显示结账员
			List<Users> jzyList=usersService.findAllJzy();
			model.addAttribute("jzyList", jzyList);
			
			//显示所有的墓区名称
			List<Muqu> muquList = muquService.findAllMuqu();
			 model.addAttribute("muquList", muquList);
			 
			//显示所有省市名称
			 List<Address> addressList=addressService.findAllSsmc();
			 model.addAttribute("addressList", addressList);
			 
			//显示所有瓷像
			List<CiXiang> ciXiangList=ciXiangService.findAll();
			model.addAttribute("ciXiangList", ciXiangList);
			
			Construction con = constructionService.findBySgdbh(sgdbh);
			model.addAttribute("con", con);
			return "yingxiao/construction/construction-detail";
		}
		@RequestMapping("/constructionDelete.html")
		public String muxueDel(@RequestParam(value="sgdbh",required=false) String sgdbh,
				@RequestParam(value="mqmcId",required=false) String mqmcId,
				@RequestParam(value="mxmc",required=false) String mxmc, Muxue muxue){
			if(!StringUtils.isEmpty(mqmcId)){
				muxue.setMqmcId(mqmcId);
				muxue.setMxmc(mxmc);
				muxueService.updateSGDBHIsNull(muxue);
			}
			constructionService.delConstruction(sgdbh);
			return "redirect:construction-list.html";
		}
		@RequestMapping("/openInscriptionEditor.html")
		@ResponseBody
		public InscriptionEditor openInscriptionEditor(String sgdbh,Integer wordsNumber){
			InscriptionEditor inscriptionEditor = inscriptionEditorService.getEditorText(sgdbh,wordsNumber);
			if(StringUtils.isEmpty(inscriptionEditor)){
				return null;
			}
			return inscriptionEditor;
		}
}


