package com.guanglumedia.cms.setmeal.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.setmeal.entity.Vip;
import com.guanglumedia.cms.setmeal.service.VipService;

@Controller
@RequestMapping(value="/cms/vip")
public class VipAction extends BaseAction {
	
	@Autowired
	public VipService vipService;

	@RequestMapping(value="findviplist")
	public String findVipList(Vip vip,HttpServletRequest request,Model model){
		PagedModelList<Vip> pml = vipService.findVipList(vip,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pml);
		model.addAttribute("vip", vip);
		return "setmeal/ListVip";
	}
}
