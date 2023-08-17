/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.controllers;

import com.ntt.service.BaiVietService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admins
 */
@RestController
public class ApiBaiVietController {
    @Autowired
    private BaiVietService baivietService;
    
    @DeleteMapping("/capnhat1")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public String deleteBViet(@RequestParam Map<String, String> params) {
        int id = Integer.parseInt(params.get("baivietId").toString());
        this.baivietService.deleteBaiViet(id);
        return "capnhat1";

    }
}
