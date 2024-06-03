package com.example.dbcardealership.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

@Getter
@Setter
@Entity
@Table(name = "order_status")
public class OrderStatus {
    @Id
    @ColumnDefault("nextval('order_status_order_status_id_seq'")
    @Column(name = "order_status_id", nullable = false)
    private Integer id;

    @Column(name = "status", nullable = false, length = 20)
    private String status;

}