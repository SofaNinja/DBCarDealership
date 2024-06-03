package com.example.dbcardealership.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "applications")
public class Application {
    @Id
    @ColumnDefault("nextval('applications_application_id_seq'")
    @Column(name = "application_id", nullable = false)
    private Integer id;

    @Column(name = "creation_date", nullable = false)
    private LocalDate creationDate;

    @Column(name = "completion_date", nullable = false)
    private LocalDate completionDate;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_status_id")
    private OrderStatus orderStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "car_id")
    private Car car;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "manager_id")
    private Manager manager;

}