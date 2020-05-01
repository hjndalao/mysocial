package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.SpecialAuditMaterials;
import com.social.service.RegistraionOfCasesService;
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
    //注入service层对象
    @Autowired
    private SpecialAuditMaterialsService specialAuditMaterialsService;
    @Autowired
    private RegistraionOfCasesService registraionOfCases;

    @RequestMapping("upload")
    @ResponseBody
    //日常审计上传文件
    public String upload(HttpSession session, Integer id, MultipartFile file, Integer typeStatus) throws Exception {
        if (typeStatus == null) typeStatus = 3;
        System.out.println(typeStatus);
        //当id不为null时执行
        if (id != null) session.setAttribute("id", id);
        //获取文件上传路径
        File files = new File(session.getServletContext().getRealPath("/files/"));
        //判断文件夹是否存在
        if (!files.exists()) {
            //不存在文件夹的时候新建
            files.mkdirs();
        }
        //数据操作过后的状态
        int status = 0;
        //当文件不等于null的时候执行
        if (file != null) {
            //随机数
            double v = Math.random() * 100;
            //时间戳
            String yyyyMMddHH = new SimpleDateFormat("yyyyMMddHH").format(new Date());
            //设置文件上传路径并将文件名设置进去
            file.transferTo(new File(files, (int) v + yyyyMMddHH + file.getOriginalFilename()));
            //获取id
            Integer ids = (Integer) session.getAttribute("id");
            session.setAttribute("state", 1);
            //根据id查询数据
            SpecialAuditMaterials specialAuditMaterialss = specialAuditMaterialsService.selectByRegistrationOfCasesId(ids);
            //当查询出来的数据等于null的时候插入数据
            if (specialAuditMaterialss == null) {
                SpecialAuditMaterials specialAuditMaterials = getSpecialAuditMaterials(ids, v, yyyyMMddHH, file);
                //添加文件名
                status = specialAuditMaterialsService.insert(specialAuditMaterials);
                //上传材料成功修改状态
                registraionOfCases.updateStatus(0, typeStatus, ids);
            } else {
                SpecialAuditMaterials specialAuditMaterials = getSpecialAuditMaterials(ids, v, yyyyMMddHH, file);
                //当查询出来的数据不等于null的时候修改数据
                status = specialAuditMaterialsService.updateByregiStrationOfCasesId(specialAuditMaterials);
                //上传材料成功修改状态
                registraionOfCases.updateStatus(0, typeStatus, ids);
            }
        }
        return JSON.toJSONString(status);
    }

    public SpecialAuditMaterials getSpecialAuditMaterials(Integer id, double v, String yyyyMMddHH, MultipartFile file) {
        //实体类对象
        SpecialAuditMaterials specialAuditMaterials = new SpecialAuditMaterials();
        //设置文件id
        specialAuditMaterials.setRegistrationOfCasesId(id);
        //设置文件路径
        specialAuditMaterials.setAuditReportUrl("/files/" + (int) v + yyyyMMddHH + file.getOriginalFilename());
        //上传时间
        specialAuditMaterials.setTime(yyyyMMddHH);
        //已上传状态
        specialAuditMaterials.setState(1);
        return specialAuditMaterials;
    }
}
