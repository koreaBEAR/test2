package com.human.springboot;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HotelController {
	@Autowired
	private HDAO hdao;

	@GetMapping("/")
	public String showHome() {
		return "hotelMain";
	}
	@GetMapping("/book")
	public String showBook() {
		return "book";
	}
	@PostMapping("/loadInfo")
	@ResponseBody
	public String doLoadInfo(HttpServletRequest req) {
		ArrayList<InfoDTO> alDTO = hdao.infoList();
		JSONArray ja = new JSONArray();
		for(int i=0; i<alDTO.size(); i++) {
			JSONObject jo = new JSONObject();
			InfoDTO list = new InfoDTO();
			list = alDTO.get(i);
			jo.put("i_num",list.getInfo_num());
			jo.put("i_name",list.getInfo_name());
			jo.put("t_name",list.getType_name());
			jo.put("person",list.getStay_num());
			jo.put("price",list.getStay_price());
			jo.put("seq", list.getSeq_room());
			
			ja.put(jo);
		}
		return ja.toString();
	}
	@PostMapping("/forBook")
	@ResponseBody
	public String forBook(HttpServletRequest req) {
		ArrayList<InfoDTO> alDTO = hdao.infoList();
		JSONArray ja = new JSONArray();
		for(int i=0; i<alDTO.size(); i++) {
			JSONObject jo = new JSONObject();
			InfoDTO list = new InfoDTO();
			list = alDTO.get(i);
			jo.put("i_num",list.getInfo_num());
			jo.put("i_name",list.getInfo_name());
			jo.put("t_name",list.getType_name());
			jo.put("person",list.getStay_num());
			jo.put("price",list.getStay_price());
			jo.put("seq", list.getSeq_room());
			
			ja.put(jo);
		}
		return ja.toString();
	}
	@PostMapping("/viewInfo")
	@ResponseBody
	public String viewInfo(HttpServletRequest req) {
		int num=Integer.parseInt(req.getParameter("i_num"));
		InfoDTO alDTO = hdao.viewInfo(num);
		JSONArray ja = new JSONArray();
			ja.put(alDTO.getInfo_num());
			ja.put(alDTO.getInfo_name());
			ja.put(alDTO.getType_name());
			ja.put(alDTO.getStay_num());
			ja.put(alDTO.getStay_price());
			ja.put(alDTO.getSeq_room());
			
		return ja.toString();
	}
	@PostMapping("/loadData")
	@ResponseBody
	public String doLoad(HttpServletRequest req) {
		ArrayList<HDTO> alDTO = hdao.typeList();
		JSONArray ja = new JSONArray();
			for(int i=0; i<alDTO.size(); i++) {
				JSONObject jo = new JSONObject();
				HDTO list = new HDTO();
				list = alDTO.get(i);
				jo.put("num",list.getType_num());
				jo.put("name",list.getType_name());
				jo.put("seq",list.getTypeseq());
				
				ja.put(jo);
			}
		return ja.toString();
	}
	@PostMapping("/viewType")
	@ResponseBody
	public String view(HttpServletRequest req) {
		ArrayList<HDTO> alDTO = hdao.typeList();
		JSONArray ja = new JSONArray();
			for(int i=0; i<alDTO.size(); i++) {
				JSONObject jo = new JSONObject();
				HDTO list = new HDTO();
				list = alDTO.get(i);
				jo.put("num",list.getType_num());
				jo.put("name",list.getType_name());
				jo.put("seq",list.getTypeseq());
				
				ja.put(jo);
			}
		return ja.toString();
	}
	@PostMapping("/insertData")
	@ResponseBody
	public String doInsert(HttpServletRequest req) {
		String retval="ok";
		try {
			int r_num=Integer.parseInt(req.getParameter("num"));
			String r_name=req.getParameter("name");
			hdao.typeinsert(r_num,r_name);
		}catch(Exception e) {
			retval="fail";
		}
		return retval;
	}
	@PostMapping("/updateType")
	@ResponseBody
	public String typeUpdate(HttpServletRequest req) {
		String retval="ok";
		try {
			int t_num=Integer.parseInt(req.getParameter("t_num"));
			int t_seq=Integer.parseInt(req.getParameter("t_seq"));
			String t_name=req.getParameter("t_name");
			hdao.updateType(t_name, t_num, t_seq);
		}catch(Exception e){
			retval="fail";
		}
		return retval;
	}	
	@PostMapping("/deleteType")
	@ResponseBody
	public String typeDelete(HttpServletRequest req) {
		String retval="ok";
		try {
			int t_seq=Integer.parseInt(req.getParameter("t_seq"));
			hdao.deleteType(t_seq);
		}catch(Exception e){
			retval="fail";
		}
		return retval;
	}
	@PostMapping("/deleteInfo")
	@ResponseBody
	public String deleteInfo(HttpServletRequest req) {
		String retval="ok";
		try {
			int i_seq=Integer.parseInt(req.getParameter("i_seq"));
			hdao.deleteType(i_seq);
		}catch(Exception e){
			retval="fail";
		}
		return retval;
	}
	@PostMapping("/insertInfo")
	@ResponseBody
	public String doInsertInfo(HttpServletRequest req) {
		String retval="ok";
		try {
			int i_num=Integer.parseInt(req.getParameter("i_num"));
			int t_num=Integer.parseInt(req.getParameter("t_num"));
			int i_per=Integer.parseInt(req.getParameter("i_per"));
			int i_pri=Integer.parseInt(req.getParameter("i_pri"));
			String i_name=req.getParameter("i_name");
			hdao.infoinsert(i_num, t_num, i_name, i_per, i_pri);
		}catch(Exception e) {
			retval="fail";
		}
		return retval;
	}
	@PostMapping("/updateInfo")
	@ResponseBody
	public String infoUpdate(HttpServletRequest req) {
		String retval="ok";
		try {
			int i_num=Integer.parseInt(req.getParameter("i_num"));
			int i_seq=Integer.parseInt(req.getParameter("i_seq"));
			int t_num=Integer.parseInt(req.getParameter("t_num"));
			int i_per=Integer.parseInt(req.getParameter("i_per"));
			int i_pri=Integer.parseInt(req.getParameter("i_pri"));
			String i_name=req.getParameter("i_name");
			hdao.updateInfo(i_num, i_name, t_num, i_per, i_pri, i_seq);
		}catch(Exception e){
			retval="fail";
		}
		return retval;
	}
	@PostMapping("/bookList")
	@ResponseBody
	public String bookList(HttpServletRequest req) {
		ArrayList<BookDTO> alDTO = hdao.bookList();
		JSONArray ja = new JSONArray();
			for(int i=0; i<alDTO.size(); i++) {
				JSONObject jo = new JSONObject();
				BookDTO list = new BookDTO();
				list = alDTO.get(i);
				jo.put("in",list.getCheckin());
				jo.put("out",list.getCheckout());
				jo.put("booker",list.getBooker());
				jo.put("mobi", list.getMobile());
				jo.put("people",list.getStay_num());
				jo.put("fee",list.getStay_price());
				jo.put("i_name",list.getInfo_name());
				jo.put("t_name",list.getType_name());
				jo.put("seq",list.getSeq_book());
				jo.put("i_num",list.getInfo_num());
				
				ja.put(jo);
			}
		return ja.toString();
	}
	@PostMapping("/bookInsert")
	@ResponseBody
	public String bookInsert(HttpServletRequest req) {
		String retval = "ok";
		try {
			String in = req.getParameter("chin");
			String out = req.getParameter("chout");
			int r_num = Integer.parseInt(req.getParameter("r_num"));
			String booker = req.getParameter("guest");
			String mobile = req.getParameter("mobi");
			int personnel = Integer.parseInt(req.getParameter("stay"));
			int price = Integer.parseInt(req.getParameter("t_fee"));
			hdao.bookInsert(in, out, r_num, booker, mobile, personnel, price);
		}catch(Exception e) {
			retval = "fail";
		}
		return retval;
	}
	@PostMapping("/bookUpdate")
	@ResponseBody
	public String bookUpdate(HttpServletRequest req) {
		String retval = "ok";
		try {
			String in = req.getParameter("chin");
			String out = req.getParameter("chout");
			int r_num = Integer.parseInt(req.getParameter("r_num"));
			String booker = req.getParameter("guest");
			String mobile = req.getParameter("mobi");
			int personnel = Integer.parseInt(req.getParameter("stay"));
			int price = Integer.parseInt(req.getParameter("t_fee"));
			int seq = Integer.parseInt(req.getParameter("seq"));
			hdao.bookUpdate(in, out, r_num, booker, mobile, personnel, price,seq);
		}catch(Exception e) {
			retval = "fail";
		}
		return retval;
	}
	@PostMapping("/bookDelete")
	@ResponseBody
	public String bookDelete(HttpServletRequest req) {
		String retval = "ok";
		try {
			int seq = Integer.parseInt(req.getParameter("seq"));
			hdao.bookDelete(seq);
			
		}catch(Exception e) {
			retval = "fail";
		}
		return retval;
	}
}
