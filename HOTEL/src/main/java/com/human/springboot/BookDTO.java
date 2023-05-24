package com.human.springboot;

import lombok.Data;

@Data
public class BookDTO {
	String checkin;
	String checkout;
	String booker;
	String mobile;
	String info_name;
	String type_name;
	int seq_book;
	int seq_room;
	int stay_num;
	int stay_price;
	int info_num;
}
