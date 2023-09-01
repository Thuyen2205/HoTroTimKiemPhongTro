/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntt.controllers;

import com.ntt.pojo.BinhLuan;
import com.ntt.service.BinhLuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ThanhThuyen
 */
@RestController
@RequestMapping("/api")
@CrossOrigin
public class ApiBinhLuanController {

    @Autowired
    private BinhLuanService binhLuanService;

    @DeleteMapping("/thtin_bvietBinhLuan/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteBinhLuanwpr(@PathVariable(value = "id") int id) {
        this.binhLuanService.deleteBinhLuan(id);

    }

}
