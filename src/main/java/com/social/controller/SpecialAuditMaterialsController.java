package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.SpecialAuditMaterials;
import com.social.service.SpecialAuditMaterialsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("specialAuditMaterials")
public class SpecialAuditMaterialsController {
    @Autowired
    private SpecialAuditMaterialsService specialAuditMaterialsService;

    //日常审计上传文件
    @RequestMapping("upload")
    @ResponseBody
    //上传与修改img名称（id为空 files为空， files:代表的是前台都name）
    public String upload(HttpSession session, Integer id, MultipartFile file) throws Exception {
        if (id != null) session.setAttribute("id", id);
        //获取文件上传路径
        File files = new File(session.getServletContext().getRealPath("/files/"));
        //判断文件夹是否存在
        if (!files.exists()) {
            files.mkdirs();//直接通脱filede 方法把选中的文件复制到相对应的目录下，实现简单的上传
        }
        if (file != null) {
            //设置文件上传路径并将文件名设置进去
            //随机数
            double v = Math.random() * 100;
            //时间戳
            String yyyyMMddHH = new SimpleDateFormat("yyyyMMddHH").format(new Date());
            //拼接文件名
            file.transferTo(new File(files, (int) v + yyyyMMddHH + file.getOriginalFilename()));
            //获取id
            Integer ids = (Integer) session.getAttribute("id");
            //根据id查询数据
            SpecialAuditMaterials specialAuditMaterialss = specialAuditMaterialsService.selectByRegistrationOfCasesId(ids);
            //实体类对象
            SpecialAuditMaterials specialAuditMaterials = new SpecialAuditMaterials();
            if (specialAuditMaterialss == null) {
                //设置文件id
                specialAuditMaterials.setRegistrationOfCasesId(ids);
                //设置文件路径
                specialAuditMaterials.setAuditReportUrl("/files/" + (int) v + yyyyMMddHH + file.getOriginalFilename());
                //上传时间
                specialAuditMaterials.setTime(yyyyMMddHH);
                //已上传状态
                specialAuditMaterials.setState(1);
                //添加文件名
                specialAuditMaterialsService.insert(specialAuditMaterials);
            } else {
                //修改文件名
                specialAuditMaterials.setId(specialAuditMaterialss.getId());
                System.out.println(specialAuditMaterialss.getId());
                //设置文件id
                specialAuditMaterials.setRegistrationOfCasesId(ids);
                //设置文件路径
                specialAuditMaterials.setAuditReportUrl("/files/" + (int) v + yyyyMMddHH + file.getOriginalFilename());
                //上传时间
                specialAuditMaterials.setTime(yyyyMMddHH);
                //已上传状态
                specialAuditMaterials.setState(1);
                specialAuditMaterialsService.updateByPrimaryKey(specialAuditMaterials);
            }
        }
        return JSON.toJSONString("1");
    }
}
