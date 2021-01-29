package com.ttms.core.web.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/ttms")
public class FileUploadController {

	/**
	 * 文件上传
	 * @param name
	 * @param uploadfile
	 * @param request
	 * @return
	 */
	@RequestMapping("/fileUpload.action")
	public String handlerFormUpload(@RequestParam("name")String name,
			@RequestParam("uploadfile")MultipartFile uploadfile,
			HttpServletRequest request) {
		
		//判断上传文件是否存在
		if(!uploadfile.isEmpty()) {
				//获取上传文件的原始名称
				String originalFilename = uploadfile.getOriginalFilename();
				//设置上传文件的保存地址目录
				String dirPath = "D:/data/file/";
				File filePath = new File(dirPath);
				//如果保存文件的地址不存在，先创建目录
				if(!filePath.exists()) {
					filePath.mkdirs();
				}
				//使用UUID重新命名上传的文件名称(上传人_uuid_原始文件名称)
				String newFilename=name+"_"+UUID.randomUUID()+"_"+originalFilename;
				//使用MultipartFile接口的方法完成文件上传到指定位置
				try {
					uploadfile.transferTo(new File(dirPath+newFilename));
					System.out.println(dirPath+newFilename);
				} catch (Exception e) {
					e.printStackTrace();
					return "error";
				}
			return "success";
		}else {
			return "error";
		}
	}
}
