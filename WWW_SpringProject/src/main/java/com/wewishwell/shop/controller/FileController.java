package com.wewishwell.shop.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wewishwell.shop.service.AdminService;

@Controller
public class FileController {
	
	@Autowired
	AdminService as;
	
	//사진파일 최초 업로드용
	@PostMapping("fileUpload")
	public String uploadImg(@RequestParam("file") MultipartFile multi, Model model, HttpServletRequest request) {
        try {
            String uploadpath = request.getSession().getServletContext().getRealPath("resources/images");
            
            if(!multi.isEmpty())
            {
                //File file = new File(uploadpath, multi.getOriginalFilename());
                File file = new File(uploadpath, "pro_"+as.prodMaxNum()+".png");
                multi.transferTo(file);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "index";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:test";
    }
	
	//사진파일 수정용
	@PostMapping("fileModify")
	public String modifyImg(@RequestParam("file") MultipartFile multi, Model model, HttpServletRequest request) {
        try {
            String uploadpath = request.getSession().getServletContext().getRealPath("resources/images");
            if(!multi.isEmpty())
            {
                //File file = new File(uploadpath, multi.getOriginalFilename());
                File file = new File(uploadpath, "pro_"+request.getParameter("id")+".png");
                multi.transferTo(file);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "index";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:test";
    }
}