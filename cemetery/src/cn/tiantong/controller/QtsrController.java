package cn.tiantong.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tiantong.entity.CiXiang;
import cn.tiantong.entity.Qtsr;
import cn.tiantong.service.QtsrService;
import cn.tiantong.util.PageBean;



@Controller("qtsrController")
public class QtsrController {
	
	@Resource(name="qtsrService")
	 private QtsrService qtsrService;
	
	@RequestMapping("/qtsr-list.html")
	public String showQtsr(
			Model model,
			@RequestParam(value="pageNo",required=false )
			Integer pageNo
			){
		
		int pageSize=10;
		if(pageNo==null)
			pageNo=1;
		
		
		//查询所有其他收入
		List<Qtsr> qtsrList=qtsrService.findAll();
		model.addAttribute("qtsrList", qtsrList);
		//分页
		PageBean<Qtsr> pageBean=qtsrService.findByPage(pageNo, pageSize);
		model.addAttribute("pageBean", pageBean);
		
		return "yingxiao/otherRevenue/qtsr-list";
	}
	
	
	//显示其他收入新增页面
	@RequestMapping("/qtsrGetAdd.html")
	public String showQtsrAdd(){
		
		return "yingxiao/otherRevenue/qtsr-add";
	}
	
	
	//其他收入新增页面
	@RequestMapping("/qtsrAdd.html")
	public String qtsrAdd(Qtsr qtsr){
		qtsrService.addQtsr(qtsr);
		return "redirect:qtsr-list.html";
	}
	
	//显示其他收入修改页面
		@RequestMapping("/qtsrGetUpdate.html")
		public String qtsrGetUpdate(@RequestParam("id") Integer id,Model model){
			Qtsr findQtsrList = qtsrService.findById(id);
			model.addAttribute("findQtsrList", findQtsrList);
			return "yingxiao/otherRevenue/qtsr-modify";
		}
		
		//其他收入修改页面
		@RequestMapping("/qtsrUpdate.html")
		public String qtsrUpdate(Qtsr qtsr){
			qtsrService.updateQtsr(qtsr);
			return "redirect:qtsr-list.html";
		}

		
		//删除其他收入
		@RequestMapping("/qtsrDel.html")
		public String qtsrDel(@RequestParam("id") Integer id){
			qtsrService.delQtsr(id);
			return "redirect:qtsr-list.html";
		}
		
}
