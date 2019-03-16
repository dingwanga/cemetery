package cn.tiantong.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.tiantong.entity.Address;
import cn.tiantong.entity.BasicData;
import cn.tiantong.entity.CiXiang;
import cn.tiantong.entity.Muqu;
import cn.tiantong.entity.Muxue;
import cn.tiantong.entity.Unit;
import cn.tiantong.entity.Users;
import cn.tiantong.service.AddressService;
import cn.tiantong.service.BasicDataService;
import cn.tiantong.service.CiXiangService;
import cn.tiantong.service.MuquService;
import cn.tiantong.service.MuxueService;
import cn.tiantong.service.UnitService;
import cn.tiantong.service.UsersService;
import cn.tiantong.util.Json;
import cn.tiantong.util.PageBean;



@Controller("xitongController")
@RequestMapping("/statics/xitong")
public class XitongController {

	@Resource(name="usersService")
	 private UsersService usersService;
	
	
	@Resource(name="unitService")
	private UnitService unitService;
	
	@Resource(name="ciXiangService")
	private CiXiangService ciXiangService;
	
	@Resource(name="addressService")
	private AddressService addressService;
	
	@Resource(name="basicDataService")
	private BasicDataService basicDataService;
	
	@Resource(name="muquService")
	 private MuquService muquService;
	
	@Resource(name="muxueService")
	 private MuxueService muxueService;
	
     //显示所有用户
	@RequestMapping("/addUser/addUser.html")
	public String findUer(Model model){
		 List<Users> userList=usersService.findAll();
		 model.addAttribute("userList", userList);
		return "xitong/addUser/addUser-list";
		
	}
	
	//删除用户
	@RequestMapping("/addUser/delUser.html")
	public String delU(
			@RequestParam("id")
	        Integer id
			){
		int ret=usersService.delUser(id);
		
		if(ret>0){
			return "redirect:../addUser/addUser.html";
		}else{
			return "error";
		}
		
	}
	
	//显示用户新增页面
	@RequestMapping("/addUser/add-user.html")
	public String showU(Model model){
		List<Users> userslist=usersService.findAllRight();
		model.addAttribute("userslist", userslist);
		return "xitong/addUser/addUser-add";
		
	}
	
	//用户新增页面
	@RequestMapping("/addUser/users.html")
	public String addU(Model model,Users users){
		int ret=usersService.addUser(users);
		
		if(ret>0){
		return "redirect:../addUser/addUser.html";
		}else{
			return "error";
		}
		
	}
	
	// 显示单位名称
	
	@RequestMapping("/user/user.html")
	public String findUnit(HttpSession session){
		 List<Unit> unitList=unitService.findAll();
		 session.setAttribute("unitList", unitList);
		return "xitong/user/user";
		
	}
	
	//修改单位信息
	@RequestMapping("/user/updateUse.html")
	public String upUse(Unit unit){
		int ret=unitService.modifyUnit(unit);
		if(ret>0){
			return "redirect:../user/updateUse.html";
		}else{
			return "error";
		}
		
	}
	
	//分页显示瓷像信息
	@RequestMapping("/cixiang/cixiang-list.html")
	public String showCiXiang(
			Model model,
			@RequestParam(value="pageNo",required=false )
			Integer pageNo
			){
		
		int pageSize=10;
		if(pageNo==null)
			pageNo=1;
		//查询所有瓷像
		List<CiXiang> ciXiangList=ciXiangService.findAll();
		model.addAttribute("ciXiangList", ciXiangList);
		//分页
		PageBean<CiXiang> pageBean=ciXiangService.findByPage(pageNo, pageSize);
		model.addAttribute("pageBean", pageBean);
		
		return "xitong/cixiang/cixiang-list";
	}
	
	
	//显示瓷像新建页面
	@RequestMapping("/cixiang/cixiang-add.html")
	public String showAddCiXiang(){
		
		return "xitong/cixiang/cixiang-add";
	}
	
	//新建瓷像
	@RequestMapping("/cixiang/getCiXiang.html")
	public String AddCiXiang(CiXiang ciXiang,Model model){
		int ret=ciXiangService.addCiXiang(ciXiang);
		if(ret>0){
		return "redirect:../cixiang/cixiang-list.html";
		}else{
			return "error";
		}
	}
	
	//显示瓷像修改页面
	@RequestMapping("/cixiang/cixiang-update.html")
	public String showUpdateCiXiang(
			@RequestParam("id")
	        Integer id,Model model
			){
		CiXiang cx=ciXiangService.findCiXiangById(id);
		model.addAttribute("cx", cx);
		return "xitong/cixiang/cixiang-modify";
	}
	
	//瓷像修改
	@RequestMapping("/cixiang/getUpdateCiXiang.html")
	public String upCiXiang(CiXiang ciXiang){
		int ret=ciXiangService.updateCiXiang(ciXiang);
		if(ret>0){
		 return "redirect:../cixiang/cixiang-list.html";
		}else{
			return "error";
		}
	}
	
	//瓷像删除
	@RequestMapping("/cixiang/cixiang-del.html")
	public String delCX(@RequestParam("id")
                                Integer id){
		int ret=ciXiangService.delCiXiang(id);
		if(ret>0){
		 return "redirect:../cixiang/cixiang-list.html";
		}else{
			return "error";
		}
  }
	
	
	//分页显示地区信息
		@RequestMapping("/address/address-list.html")
		public String showAddress(
				Model model,
				@RequestParam(value="pageNo",required=false)
				Integer pageNo
				){
			
			int pageSize=10;
			if(pageNo==null)
				pageNo=1;
			//查询所有地区
			List<Address> addressList=addressService.findAllAddress();
			model.addAttribute("addressList", addressList);
			//分页
			PageBean<Address> pageBean=addressService.findByPage(pageNo, pageSize);
			model.addAttribute("pageBean", pageBean);
			
			return "xitong/address/address-list";
		}
		
		
		//显示地区新增页面
			@RequestMapping("/address/address-add.html")
			public String showAddAddress(){
				
				return "xitong/address/address-add";
			}
			
			//新建地区
			@RequestMapping("/address/getAddress.html")
			public String AddAddress(Address address,Model model){
				int ret=addressService.addAddress(address);
				if(ret>0){
				return "redirect:../address/address-list.html";
				}else{
					return "error";
				}
			}
		
		   //显示地区修改页面
			@RequestMapping("/address/address-update.html")
			public String showUpdateAddress(
					@RequestParam("id")
			        Integer id,Model model
					){
				Address adList=addressService.findAddressById(id);
				model.addAttribute("adList", adList);
				return "xitong/address/address-modify";
			}
			
			//地区修改
			@RequestMapping("/address/getUpdateAddress.html")
			public String upAddress(Address address){
				int ret=addressService.updateAddress(address);
				
				if(ret>0){
				 return "redirect:../address/address-list.html";
				}else{
					return "error";
				}
			}
			
			//删除地区
			@RequestMapping("/address/address-del.html")
			public String delDQ(@RequestParam("id")
		                                Integer id){
				int ret=addressService.delAddress(id);
				if(ret>0){
				 return "redirect:../address/address-list.html";
				}else{
					return "error";
				}
			}
			
		//基础资料设置
			@RequestMapping("/basicData/basicData-list.html")
			public String basicData(
					Model model,
					@RequestParam(value="pageNo",required=false)
					Integer pageNo
					){
				int pageSize=10;
				if(pageNo==null)
					pageNo=1;
				
				//显示所有基础资料设置
				List<BasicData> basicDatas = basicDataService.findAll();
				model.addAttribute("basicDatas", basicDatas);
				
				//分页
				PageBean<BasicData> pageBean=basicDataService.findByPage(pageNo, pageSize);
				model.addAttribute("pageBean", pageBean);
				return "xitong/basicData/basicData-list";
				
			}
			
			
			
			
			//基础资料设置新建显示
			@RequestMapping("/basicData/basicData-add.html")
			public String showAddbasicData(Model model,@RequestParam(value="mqmc",required=false)
		    String mqmc){
				//查询所有墓区
				 List<Muqu> muquList = muquService.findAllMuqu();
				 model.addAttribute("muquList", muquList);
				
				
				
				 
				 //设置当前时间
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				model.addAttribute("currentDate", df.format(new Date()));
				
				return "xitong/basicData/basicData-add";
			}
			
			
			//显示优惠编号为空的墓区的所有墓穴
			@RequestMapping(value = "/findByMqmcIdAndConcessionList/{mqmcId}")
		    @ResponseBody
			public Json findByMqmcIdAndConcessionList(@PathVariable("mqmcId") String mqmcId) throws UnsupportedEncodingException{
				 mqmcId=URLDecoder.decode(mqmcId,"UTF-8");
				 List<Muxue> muxueList=muxueService.findByMqmcIdAndConcessionList(mqmcId);
				 if (muxueList!=null){
			            return new Json(true,"success",muxueList);
			        } else {
			            return new Json(false,"fail",null);
			        }
			}
			
			
			//基础资料设置新建
			@RequestMapping("/basicData/getBasicData.html")
			public String getBasicData(Model model,HttpServletRequest request,BasicData basicData,Muxue muxue){
				 String mqmcId = request.getParameter("mqmcId");
				 basicData.setMqmcId(mqmcId);
				 String mxmc = request.getParameter("mxmc");
				 basicData.setMxmc(mxmc);
				 
				basicDataService.addBasicData(basicData);
				
				return "redirect:../basicData/basicData-list.html";
			}
			
			
			//基础资料修改页面显示
			@RequestMapping("/basicData/basicData-update.html")
			public String showUpdatebasicData(Model model,@RequestParam(value="mqmcId",required=false)
		    String mqmcId,@RequestParam(value="mxmc",required=false)
		    String mxmc){
				BasicData basicData = basicDataService.findBasicDataByMqmcIdAndMxmc(mqmcId, mxmc);
				model.addAttribute("basicData", basicData);
				
			    return "xitong/basicData/basicData-modify";
			}
			
			//基础资料设置修改
			@RequestMapping("/basicData/updateBasicData.html")
			public String updateBasicData(Model model,HttpServletRequest request,BasicData basicData,Muxue muxue){
				/* String mqmcId = request.getParameter("mqmcId");
				 basicData.setMqmcId(mqmcId);
				 String mxmc = request.getParameter("mxmc");
				 basicData.setMxmc(mxmc);*/
				 
				basicDataService.addBasicData(basicData);
				
				return "redirect:../basicData/basicData-list.html";
			}
			
			
			//基础资料信息删除
			@RequestMapping("/basicData/basicData-del.html")
			public String delBasicData(Model model,@RequestParam(value="mqmcId",required=false)
		    String mqmcId,@RequestParam(value="mxmc",required=false)
		    String mxmc){
				
				basicDataService.DelBasicData(mqmcId, mxmc);
				
				return "redirect:../basicData/basicData-list.html";
			}
			
		
}
