package cn.tiantong.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tiantong.entity.ConstructionSchedule;
import cn.tiantong.service.ConstructionScheduleService;



@Controller("constructionScheduleController")
public class ConstructionScheduleController {
	
	@Resource(name="constructionScheduleService")
	 private ConstructionScheduleService constructionScheduleService;
	//显示施工进度
	@RequestMapping("/constructionSchedule-list.html")
	public String showConstructionSchedule(){
		return "yingxiao/constructionSchedule/constructionSchedule-list";
	}
	
	//显示施工进度
	@RequestMapping("/queryConstructionSchedule.html")
	@ResponseBody
	public ConstructionSchedule showConstructionSchedule(String sgdbhId){
		ConstructionSchedule constructionSchedule = constructionScheduleService.getSgdjdBySgdbh(sgdbhId);
		return constructionSchedule;
	}
	
	@RequestMapping("/updateSgjd.html")
	@ResponseBody
	public void updateSgjd(ConstructionSchedule constructionSchedule,String sgdbhId,String sfwg,String sfszp,String szrqId,String sfghzp,String zpghrqId,String sftcx,
			String sfzxwg,String qtdj1Id,String qtdj2Id,String qtdj3Id,String qtdj4Id,String remark){
		constructionSchedule.setSgdbh(sgdbhId);
		constructionSchedule.setSfwg(sfwg);
		constructionSchedule.setSfszp(sfszp);
		SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd"); 
		Date szrqDate = null;
		Date zpghrqDate = null;
		try {
			szrqDate = sdf.parse(szrqId);
			zpghrqDate = sdf.parse(zpghrqId);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		constructionSchedule.setSzrq(szrqDate);
		constructionSchedule.setSfghzp(sfghzp);
		constructionSchedule.setZpghrq(zpghrqDate);
		constructionSchedule.setSftcx(sftcx);
		constructionSchedule.setSfzxwg(sfzxwg);
		constructionSchedule.setQtdj1(qtdj1Id);
		constructionSchedule.setQtdj2(qtdj2Id);
		constructionSchedule.setQtdj3(qtdj3Id);
		constructionSchedule.setQtdj4(qtdj4Id);
		constructionSchedule.setBz(remark);
		constructionScheduleService.updateSgjdBySgdbh(constructionSchedule);
		
	}
	/*//修改显示施工进度
	@RequestMapping("/updateSgjd.html")
	public String updateSgjd(ConstructionSchedule constructionSchedule){
		constructionScheduleService.updateSgjdBySgdbh(constructionSchedule);
		return "redirect: constructionSchedule-list.html";
	}*/
    
}
