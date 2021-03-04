package com.example.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("Card")
@Getter
@Setter
@ToString
public class CardVO {
	
	int card_id;
	String card_name;
	int annual_amount;
	int minimum_fee;
	int benefit1;
	int benefit1_grade;
	int benefit2;
	int benefit2_grade;
	int benefit3;
	int benefit3_grade;
	int benefit4;
	int benefit4_grade;
	int benefit5;
	int benefit5_grade;
	String note;
	
	public CardVO() {};
	
	public CardVO(int card_id, String card_name, int annual_amount, int minimum_fee, int benefit1, int benefit1_grade,
			int benefit2, int benefit2_grade, int benefit3, int benefit3_grade, int benefit4, int benefit4_grade,
			int benefit5, int benefit5_grade, String note) {
		super();
		this.card_id = card_id;
		this.card_name = card_name;
		this.annual_amount = annual_amount;
		this.minimum_fee = minimum_fee;
		this.benefit1 = benefit1;
		this.benefit1_grade = benefit1_grade;
		this.benefit2 = benefit2;
		this.benefit2_grade = benefit2_grade;
		this.benefit3 = benefit3;
		this.benefit3_grade = benefit3_grade;
		this.benefit4 = benefit4;
		this.benefit4_grade = benefit4_grade;
		this.benefit5 = benefit5;
		this.benefit5_grade = benefit5_grade;
		this.note = note;
	}

	public CardVO(int card_id, int benefit1, int benefit1_grade, int benefit2, int benefit2_grade, int benefit3, int benefit3_grade,
			int benefit4, int benefit4_grade, int benefit5, int benefit5_grade) {
		super();
		this.card_id = card_id;
		this.benefit1 = benefit1;
		this.benefit1_grade = benefit1_grade;
		this.benefit2 = benefit2;
		this.benefit2_grade = benefit2_grade;
		this.benefit3 = benefit3;
		this.benefit3_grade = benefit3_grade;
		this.benefit4 = benefit4;
		this.benefit4_grade = benefit4_grade;
		this.benefit5 = benefit5;
		this.benefit5_grade = benefit5_grade;
	}
	
	
	
	
	

}
