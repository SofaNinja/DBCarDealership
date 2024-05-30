package com.example.dbcardealership.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "additional_options")
public class AdditionalOption {
    @Id
    @ColumnDefault("nextval('additional_options_additional_option_id_seq'")
    @Column(name = "additional_option_id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Column(name = "option_price", nullable = false, precision = 10, scale = 2)
    private BigDecimal optionPrice;

}