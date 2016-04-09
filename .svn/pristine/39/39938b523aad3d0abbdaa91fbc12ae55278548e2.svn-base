package com.guanglumedia.cms.order.action;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.guanglumedia.cms.order.entity.Order;
import com.guanglumedia.cms.order.service.OrderService;
import com.guanglumedia.util.ExportExcelUtils;

@Controller
@RequestMapping(value = "/cms/order")
public class OrderAction extends BaseAction {
    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "findorderlist")
    @AuthPassport(AuthEnum.AdminAuth)
    public String FindOrderList(Order order, HttpServletRequest request, Model model) throws UnsupportedEncodingException {
        PagedModelList<Map<String, Object>> pagedModelList = orderService.findOrderList(order, getPageNo(request),
                getPageRow(request));
        model.addAttribute("pml", pagedModelList);
        model.addAttribute("order", order);

        return "order/ListOrder";
    }

    @RequestMapping(value = "tomodifyorder")
    @AuthPassport(AuthEnum.AdminAuth)
    public String ToModifyOrder(@RequestParam("id") int id, @RequestParam("Edit") String edit, HttpServletRequest request,
            Model model) {
        if (id > 0) {
            // Movie movie=movieservice.getMovieById(id);
            // model.addAttribute("MovieInfo",movie);
        }
        // List<Product>products=productservice.findAllProductList();
        // model.addAttribute("products", products);
        List<Map<String, Object>> productIDs = orderService.findAllProductId();
        List<Map<String, Object>> MediaIDs = orderService.findAllMediaId();
        model.addAttribute("productIDs", productIDs);
        model.addAttribute("MediaIDs", MediaIDs);
        model.addAttribute("Edit", edit);
        model.addAttribute("MovieID", id);
        return "order/ModifyOrder";
    }

    @RequestMapping(value = "addorder")
    @AuthPassport(AuthEnum.AdminAuth)
    @ResponseBody
    public Feedback AddOrder(Order order, HttpServletRequest request, Model model) {
        int result = -1;
        String message = "添加失败";
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String recordtime = sdf.format(date);
            order.setRecordtime(recordtime);
            result = this.orderService.addOrder(order);
        } catch (Exception e) {
            e.printStackTrace();
            message = e.getMessage();
        }
        if (result > 0) {
            return Feedback.success("添加成功");
        } else {
            return Feedback.fail(message);
        }
    }

    @RequestMapping(value = "exportorder")
    @AuthPassport(AuthEnum.AdminAuth)
    @ResponseBody
    public String Exportorder(Order order, HttpServletResponse respond, Model model) {
        try {
            List<Map<String, Object>> list = this.orderService.exportOrder(order);
            if (list != null && list.size() > 0) {
                respond.setContentType("octets/stream");
                OutputStream out = respond.getOutputStream();
                respond.addHeader("Content-Disposition", "attachment;filename=order.xls");
                ExportExcelUtils.exportOrderList(out, list);
                out.close();
            } else {
                respond.setCharacterEncoding("utf-8");
                respond.setContentType("text/plain");
                PrintWriter writer = respond.getWriter();
                 writer.print("没有可导出的数据");
                writer.close();
            }

        } catch (Exception e) {

            e.printStackTrace();
        } finally {
            return "";
        }
    }

}
