package com.example.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("PerfomSelect")
@Getter
@Setter
@ToString
public class PerformSelectVO {

    String card_name;
    int select_month;
    int select_year;

    public PerformSelectVO(){

    }

    public PerformSelectVO(String card_name, int select_month, int select_year){
        this.card_name = card_name;
        this.select_month = select_month;
        this.select_year = select_year;
    }
    
}
