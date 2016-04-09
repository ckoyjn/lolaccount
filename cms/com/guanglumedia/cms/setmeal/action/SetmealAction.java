package com.guanglumedia.cms.setmeal.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.annotation.AuthEnum;
import com.guanglumedia.cms.annotation.AuthPassport;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.setmeal.entity.Setmeal;
import com.guanglumedia.cms.setmeal.service.SetmealService;

@Controller
@RequestMapping(value="/cms/setmeal")
public class SetmealAction extends BaseAction {
	
	@Autowired
	public SetmealService setmealService;
	
	public Logger logger = Logger.getLogger(SetmealAction.class);
	
	@RequestMapping(value="findsetmeallist")
	@AuthPassport(AuthEnum.AdminAuth)
	public String findSetmealList(Setmeal setmeal,HttpServletRequest request,Model model){
		PagedModelList<Setmeal> pml = setmealService.findSetmealList(setmeal,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pml);
		model.addAttribute("setmeal", setmeal);
		return "setmeal/ListSetmeal";
	}
	
	@RequestMapping(value="tomodifysetmeal")
	@AuthPassport(AuthEnum.AdminAuth)
	public String tomodifySetmeal(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		if(id>0){
			Setmeal setmeal = setmealService.findSetmealById(id);
			model.addAttribute("SetmealInfo", setmeal);
		}
		model.addAttribute("Edit", edit);
		model.addAttribute("SetmealID",id);
		return "setmeal/ModifySetmeal";
	}
	
	
	@RequestMapping(value="addsetmeal")
	@AuthPassport(AuthEnum.AdminAuth)
	@ResponseBody
	public Feedback addSetmeal(Setmeal setmeal,HttpServletRequest request){
		int result=-1;
		String message="添加失败";
		try {
			if(setmealService.findRank(setmeal.getSort(),setmeal.getId())<=0){
				result = setmealService.addSetmeal(setmeal);
			}else{
				message = "排序号不能相同";
			}
		} catch (Exception e) {
			logger.error("添加套餐失败："+e);
			message=e.getMessage();
		}
		if(result>0){
			return Feedback.success("添加成功");
		}else{
			return Feedback.fail(message);
		}
	}
	
	@RequestMapping(value="modifysetmeal")
	@AuthPassport(AuthEnum.AdminAuth)
	@ResponseBody
	public Feedback modifySetmeal(Setmeal setmeal,HttpServletRequest request){
		int result=-1;
		String message="更新失败";
		try {
			if(setmealService.findRank(setmeal.getSort(),setmeal.getId())<=0){
				result = setmealService.updateSetmeal(setmeal);
			}else{
				message = "排序号不能相同";
			}
		} catch (Exception e) {
			logger.error("更新套餐失败："+e.getMessage());
			message=e.getMessage();
		}
		if(result>0){
			return Feedback.success("更新成功");
		}else{
			return Feedback.fail(message);
		}
	}
	
	
	@RequestMapping(value="delsetmeal")
	@AuthPassport(AuthEnum.AdminAuth)
	@ResponseBody
	public Feedback delSetmeal(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try {
			result = setmealService.delSetmeal(id);
		} catch (Exception e) {
			logger.error("删除套餐失败："+e.getMessage());
			message=e.getMessage();
		}
		if(result>0){
			return Feedback.success("删除成功");
		}else{
			return Feedback.fail(message);
		}
	}
}
