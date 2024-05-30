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
@Table(name = "drive_types")
public class DriveType {
    @Id
    @ColumnDefault("nextval('drive_types_drive_type_id_seq'")
    @Column(name = "drive_type_id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

}