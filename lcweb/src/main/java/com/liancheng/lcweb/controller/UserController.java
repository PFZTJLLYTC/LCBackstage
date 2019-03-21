package com.liancheng.lcweb.controller;

import com.liancheng.lcweb.domain.Result;
import com.liancheng.lcweb.domain.User;
import com.liancheng.lcweb.repository.ManagerRepository;
import com.liancheng.lcweb.repository.UserRepository;
import com.liancheng.lcweb.service.ManagerService;
import com.liancheng.lcweb.service.UserService;
import com.liancheng.lcweb.utils.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.Date;

@RestController
public class UserController {

    private final static Logger logger = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private ManagerRepository managerRepository;

    @Autowired
    private ManagerService managerService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;



    //展现all
    @GetMapping(value = "/user")
    @Transactional
    public Result userList(){
        logger.info("userList");
        return ResultUtil.success(userRepository.findAll());
    }

    //查询by unum
    @GetMapping(value = "/user/{unum}")
    @Transactional
    public Result FindOneByUnum(@PathVariable("unum") String unum){
        logger.info("find user by unum");
        return ResultUtil.success(userRepository.findByUnum(unum));
    }

    //查询by mobile
    @GetMapping(value = "/user/{mobile}")
    @Transactional
    public Result FindOneByMobile(@PathVariable("mobile") String mobile){
        logger.info("find user by mobile");
        return ResultUtil.success(userRepository.findByMobile(mobile));
    }

    //查询by username
    @GetMapping(value = "/user/{username}")
    @Transactional
    public Result FindOneByUserName(@PathVariable("username") String username){
        logger.info("find user by username");
        return ResultUtil.success(userRepository.findByUsername(username));
    }

    //查询by email
    @GetMapping(value = "/user/{email}")
    @Transactional
    public Result FindOneByStatus(@PathVariable("email") String email){
        logger.info("find user by email");
        return ResultUtil.success(userRepository.findByEmail(email));
    }


    //删除用户信息
    @DeleteMapping(value = "/user/delete/{unum}")
    @Transactional
    public Result userDelete(@PathVariable("unum") String unum){
        logger.info("delete a particular user");
        userRepository.deleteById(unum);
        return ResultUtil.success();
    }


    //增加信息
    @PostMapping(value = "/user/add")//加表单验证
    public Result userAdd(@Valid User user, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            return null;
        }
        user.setUnum(user.getUnum());
        user.setUsername(user.getUsername());
        user.setPassword(user.getPassword());
        user.setMobile(user.getMoblie());
        user.setEmail(user.getEmail());
        user.setEmailVerifiled(user.getEmailVerifiled());
        user.setCreatedAt(user.getCreatedAt());
        user.setUpdateAt(user.getUpdateAt());

        logger.info("add a new user");
        return ResultUtil.success(userRepository.save(user));

    }



    //根据unum更新user信息
    //也可以提出来改成单独修改一项
    @PutMapping(value = "/user/update/{unum}")
    public Result userUpdate(@PathVariable("unum") String unum,
                               @RequestParam("username") String username,
                               @RequestParam("password") String password,
                               @RequestParam("mobile") String mobile,
                               @RequestParam("email") String email,
                               @RequestParam("emailVerified") Boolean emailVerified,
                               @RequestParam("updateAt") Date updateAt){
        User user = new User();
        user.setUnum(unum);
        user.setUsername(username);
        user.setPassword(password);
        user.setMobile(mobile);
        user.setEmail(email);
        user.setEmailVerifiled(emailVerified);
        user.setUpdateAt(updateAt);
        logger.info("update one user's info");
        return ResultUtil.success(userRepository.save(user));
    }

}
