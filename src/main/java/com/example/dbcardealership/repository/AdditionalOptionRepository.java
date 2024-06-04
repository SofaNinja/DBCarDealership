package com.example.dbcardealership.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.example.dbcardealership.entity.AdditionalOption;
import com.example.dbcardealership.model.Element;
import com.example.dbcardealership.model.OptionDTO;

import java.util.List;

public interface AdditionalOptionRepository extends JpaRepository<AdditionalOption, Integer> {
    @Query(value = """
            select
                AO.additional_option_id as id,
                AO.name,
                AO.option_price as price
            from additional_options AO
            """, nativeQuery = true)
    List<OptionDTO> getOptionList();

    @Query(value = """
            select 
                FT.fuel_type_id as id,
                FT.name as title
            from fuel_types FT
            """, nativeQuery = true)
    List<Element> getFuelTypeList();

    @Query(value = """
            select 
                FT.body_type_id as id,
                FT.name as title
            from body_types FT
            """, nativeQuery = true)
    List<Element> getBodyTypeList();

    @Query(value = """
            select 
                FT.drive_type_id as id,
                FT.name as title
            from drive_types FT
            """, nativeQuery = true)
    List<Element> getDriveTypeList();

    @Query(value = """
            select 
                FT.transmission_type_id as id,
                FT.name as title
            from transmission_types FT
            """, nativeQuery = true)
    List<Element> getTransmissionTypeList();

}