package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.SpecialAuditMaterials;
import com.social.service.SpecialAuditMaterialsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;

@RequestMapping("specialAuditMaterials")
public class SpecialAuditMaterialsController {
    @Autowired
    private SpecialAuditMaterialsService specialAuditMaterialsService;

    //日常审计上传文件
    @RequestMapping("upload")
    @ResponseBody
    //上传与修改img名称（id为空 files为空， files:代表的是前台都name）
    public String upload(HttpSession session, SpecialAuditMaterials specialAuditMaterials, MultipartFile file) throws Exception {
        if (specialAuditMaterials.getId() != null) session.setAttribute("id", specialAuditMaterials.getId());
        //获取文件上传路径
        File files = new File(session.getServletContext().getRealPath("/files/"));
        //判断文件夹是否存在
        if (!files.exists()) {
            files.mkdirs();//直接通脱filede 方法把选中的文件复制到相对应的目录下，实现简单的上传
        }
        if (file != null) {
            //设置文件上传路径并将文件名设置进去
            file.transferTo(new File(files, file.getOriginalFilename()));
            //获取id
            Integer ids = (Integer) session.getAttribute("id");
            System.out.println("收参:" + specialAuditMaterials);
            //根据id查询数据
            SpecialAuditMaterials specialAuditMaterialss = specialAuditMaterialsService.selectByPrimaryKey(specialAuditMaterials.getId());
            if (specialAuditMaterialss == null) {
                //添加文件名
                specialAuditMaterialsService.insert(specialAuditMaterials);
            } else {
                //修改文件名
                specialAuditMaterialsService.updateByPrimaryKey(specialAuditMaterials);
            }
            // 设置文件名
            System.out.println(file.getOriginalFilename());
            System.out.println("id:" + ids);
        }
        return JSON.toJSONString("1");
    }
}
