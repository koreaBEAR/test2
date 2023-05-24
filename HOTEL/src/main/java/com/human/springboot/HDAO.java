package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HDAO {
	ArrayList<HDTO> typeList();
	ArrayList<InfoDTO> infoList();
	ArrayList<BookDTO> bookList();
	InfoDTO viewInfo(int x1);
	void typeinsert(int x1, String x2);
	void updateType(String x1, int x2, int x3);
	void deleteType(int x1);
	void infoinsert(int x1, int x2, String x3, int x5, int x6);
	void updateInfo(int x1, String x2,int x3, int x4, int x5, int x6);
	void deleteInfo(int x1);
	void bookInsert(String x1, String x2, int x3, String x4, String x5, int x6, int x7);
	void bookUpdate(String x1, String x2, int x3, String x4, String x5, int x6, int x7, int x8);
	void bookDelete(int x1);
	
}
