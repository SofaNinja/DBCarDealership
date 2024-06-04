package com.example.dbcardealership.model;

import java.math.BigDecimal;

//    AO.additional_option_id as id,
//    AO.name,
//    AO.option_price as price
public interface OptionDTO {
    Integer getId();
    String getName();
    BigDecimal getPrice();
}
