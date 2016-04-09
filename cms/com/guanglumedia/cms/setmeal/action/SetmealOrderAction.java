package com.guanglumedia.cms.setmeal.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guanglumedia.cms.annotation.AuthEnum;
import com.guanglumedia.cms.annotation.AuthPassport;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.setmeal.entity.SetmealOrder;
import com.guanglumedia.cms.setmeal.service.SetmealOrderService;

@Controller
@RequestMapping(value="/cms/setmealorder")
public class SetmealOrderAction extends BaseAction {
	
	@Autowired
	public SetmealOrderService setmealOrderService;
	
	public Logger logger = Logger.getLogger(SetmealOrderAction.class);
	
	@RequestMapping(value="findsetmealorderlist")
	@AuthPassport(AuthEnum.AdminAuth)
	public String findSetmealOrderList(SetmealOrder setMealOrder,HttpServletRequest request,Model model){
		PagedModelList<SetmealOrder> pml = setmealOrderService.findSetmealOrderList(setMealOrder,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pml);
		model.addAttribute("setmealOrder", setMealOrder);
		return "setmeal/ListSetmealOrder";
	}
	

}
