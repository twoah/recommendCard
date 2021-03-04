package com.example.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("User")
@Setter
@Getter
@ToString
public class UserVO {
	private String user_id;
	private String name;
	private String pw;
	private String gender;
	private String email;
	private String bank;
	private String account;
	private String phone_num;
	private int benefit1;
	private int benefit2;
	private int benefit3;
	private String join_date;
	private String final_edit;
	private char withdrawal;

	public UserVO() {
	}

	public UserVO(String user_id, String name, String pw, String email) {
		this.user_id = user_id;
		this.name = name;
		this.pw = pw;
		this.email = email;
	}

	public UserVO(String user_id, String name, String pw, String gender, String email, String bank, String account,
			String phone_num, int benefit1, int benefit2, int benefit3, String join_date, String final_edit,
			char withdrawal) {
		this.user_id = user_id;
		this.name = name;
		this.pw = pw;
		this.gender = gender;
		this.email = email;
		this.bank = bank;
		this.account = account;
		this.phone_num = phone_num;
		this.benefit1 = benefit1;
		this.benefit2 = benefit2;
		this.benefit3 = benefit3;
		this.join_date = join_date;
		this.final_edit = final_edit;
		this.withdrawal = withdrawal;
	}

}
