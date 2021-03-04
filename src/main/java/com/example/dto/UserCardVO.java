package com.example.dto;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("UserCard")
@Getter
@Setter
@ToString
public class UserCardVO {

	int idx;
	String user_id;
	int card_id;
	String card_num;
	String card_name;
	String card_url;
	String withdrawal;	
	int prev_sum;//이전달 총 실적
	String paytime;
	
	List<PerformVO> performList;//유저 카드별 실적
	
	public UserCardVO() {
		
	}
	
	public UserCardVO(String user_id, int card_id) {
		this.user_id = user_id;
		this.card_id = card_id;
	}

	public UserCardVO(String user_id, int card_id, String card_num, String card_name, String withdrawal) {
		super();
		this.user_id = user_id;
		this.card_id = card_id;
		this.card_num = card_num;
		this.card_name = card_name;
		this.withdrawal = withdrawal;
	}	
	

	
	
}
