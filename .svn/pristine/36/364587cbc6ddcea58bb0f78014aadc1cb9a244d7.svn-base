package com.guanglumedia.cms.order.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.order.dao.OrderDao;
import com.guanglumedia.cms.order.entity.Order;

@Service
public class OrderService {
    @Autowired
    private OrderDao orderDao;
    @Transactional
    public PagedModelList<Map<String, Object>> findOrderList(Order order, int pageNo, int pageRow) throws UnsupportedEncodingException {
        if(order.getUserId()!=null)
        {
            order.setUserId(order.getUserId().trim());
        }
        List<Map<String, Object>> list = this.orderDao.findOrderList(order, new RowBounds((pageNo - 1) * pageRow, pageRow));
        int count = this.orderDao.findCount();
        PagedModelList<Map<String, Object>> pml = new PagedModelList<Map<String, Object>>(pageNo, pageRow, count);
        pml.addModels(list);
        return pml;
    }

    public List<Map<String, Object>> findAllProductId() {
        return orderDao.findAllProductId();
    }

    public List<Map<String, Object>> findAllMediaId() {
        return orderDao.findAllMediaId();
    }
    
    public int addOrder(Order order)
    {
        return orderDao.addOrder(order);
    }
    
    public List<Map<String,Object>> exportOrder(Order order)
    {
        return orderDao.exportOrder( order);
    }
}
