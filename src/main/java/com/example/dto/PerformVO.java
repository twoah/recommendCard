package com.example.dto;


import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("Perform")
@Getter
@Setter
@ToString
public class PerformVO 
{
	String user_id;
	String card_num;
	String card_name;
	Date paytime;//결제일
	int category_id;//카테고리
	String category_name;
	int category_sum;//카테고리별 실적
	int category_perform;//개별 실적
	int month_sum;//월 실적
	
	public PerformVO() {
		
	}


	public PerformVO(String user_id, Date paytime) {
		this.user_id = user_id;
		this.paytime = paytime;
	}	
	
	public PerformVO(String user_id, String card_name, Date paytime) {
		this(user_id, paytime);
		this.card_name = card_name;
	}
	
	
	public PerformVO(String card_num) {
		this.card_num = card_num;
	}
}
