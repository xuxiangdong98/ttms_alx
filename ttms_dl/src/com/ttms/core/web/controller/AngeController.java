package com.ttms.core.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.common.utils.Ange;

@Controller
public class AngeController {


	@RequestMapping("/toAnge.action")
	public String toAnge() {
		return "../ailvxing/ange";
	}
	
	@RequestMapping("/Randomone.action")
	@ResponseBody
	public List<String> Randomone(){
		Ange anGe = new Ange();
		List<String> danchou = anGe.Danchou();
		return danchou;
	}
	@RequestMapping("/Randomten.action")
	@ResponseBody
	public List<String> Randomten(){
		Ange anGe = new Ange();
		List<String> shichou = anGe.Shichou();
		return shichou;
	}

}
