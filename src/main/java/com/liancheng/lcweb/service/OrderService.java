package com.liancheng.lcweb.service;

import com.liancheng.lcweb.domain.Order;
import org.springframework.validation.BindingResult;

import javax.validation.Valid;
import java.util.List;

public interface OrderService {

    List<Order> findAll();

    Order createOrder(Order order);

    List<Order> findByUnum(String unum);

    List<Order> findByDnum(String dnum);

    List<Order> findAllWait();

    List<Order> findAllProcessing();

    List<Order> findAllDone();
}