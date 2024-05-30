package com.example.dbcardealership.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @ColumnDefault("nextval('orders_order_id_seq'")
    @Column(name = "order_id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "car_id", nullable = false)
    private Car car;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "client_id", nullable = false)
    private Client client;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "manager_id", nullable = false)
    private Manager manager;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "additional_option_id", nullable = false)
    private AdditionalOption additionalOption;

    @Column(name = "price", precision = 10, scale = 2)
    private BigDecimal price;

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "complete_date")
    private Date completeDate;

    @Column(name = "order_status")
    private Boolean orderStatus;
}