package com.example.dbcardealership.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.example.dbcardealership.entity.AdditionalOption;
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
}