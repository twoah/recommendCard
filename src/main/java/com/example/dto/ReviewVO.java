package com.example.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("Review")
@Getter
@Setter
@ToString
public class ReviewVO {
	private String review_id;
	private String user_id;
	private String card_id;
	private String title;
	private String body;
	private String date;
	private int status_good;
	private int status_bad;
	
	public ReviewVO() {
	}
	
	public ReviewVO(String review_id, String user_id, String card_id, String title, String body, String date,
			int status_good, int status_bad) {
		this.review_id = review_id;
		this.user_id = user_id;
		this.card_id = card_id;
		this.title = title;
		this.body = body;
		this.date = date;
		this.status_good = status_good;
		this.status_bad = status_bad;
	}
	
	public ReviewVO(String user_id, String card_id, String body) {
		super();
		this.user_id = user_id;
		this.card_id = card_id;
		this.body = body;
	}
	
}
