package com.liancheng.lcweb.service;

import com.liancheng.lcweb.VO.ResultVO;
import com.liancheng.lcweb.domain.Manager;
import com.liancheng.lcweb.domain.Order;
import com.liancheng.lcweb.dto.DriverDTO;
import com.liancheng.lcweb.dto.TotalInfoDTO;
import com.liancheng.lcweb.form.DriverInfoForm;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface ManagerService {

    List<Manager> findAll();

    Manager findOne(Integer id);

    Manager getManager(Integer lineId, String password);

    Manager addManager(Manager manager);

    ResultVO deleteOne(Integer lineId);

    List<DriverDTO> getDriversByStatus(Integer lineId,Integer status);

    //先只是多种实现，之后考虑删一个
    Page<DriverDTO> getDriversByStatus(Integer lineId,Integer status,Pageable pageable);

    TotalInfoDTO getTotal(Integer lineId);

    Page<DriverDTO> getAllDrivers(Integer lineId, Pageable pageable);

    List<Order> getOrdersByStatus(Integer lineId,Integer status);

    List<Order> getAllOrders(Integer lineId);

    Page<Order> getAllOrders(Integer lineId,Pageable pageable);

    void AddOneDriver(DriverInfoForm driverInfoForm,Integer lineId);

    void DeleteOneDriver(String dnum, Integer lineId);

    void confirmOneOrder(Order order,String dnum);

    void confirmOneDriver(String dnum,Integer lineId);


}
