package com.example.dbcardealership.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.example.dbcardealership.entity.Client;
import com.example.dbcardealership.model.FullUserDTO;
import com.example.dbcardealership.model.UserDashboardDTO;

import java.util.List;

public interface UserRepository extends JpaRepository<Client, Long> {
    @Query(value = """

select
    C.client_id as id,
    C.full_name as fullName ,
    C.email,
    C.password,
    C.authority
from "clients" C
where C.email = ?1
union
select
    M.manager_id as id,
    M.full_name as fullName,
    M.email,
    M.password,
    M.authority
from "managers" M
where M.email = ?1
""", nativeQuery = true)
    FullUserDTO getClientByEmail(String id);

    @Query(value = """
            select
            C.client_id as id,
            C.full_name as fullName,
            C.email as email,
            COUNT(O.client_id) as ordersCount,
            SUM(O.price) as ordersTotal
            from clients C, orders O
            group by C.client_id, C.full_name, C.email, O.client_id having O.client_id = C.client_id
            order by ordersTotal DESC
            limit 5 offset 5 * (?1 - 1)
            """, nativeQuery = true)
    List<UserDashboardDTO> getClientsList(Integer page);

    @Query(value = """
            select
           C.manager_id as id,
           C.full_name as fullName,
           C.email as email,
           COUNT(O.client_id) as ordersCount,
           SUM(O.price) as ordersTotal
           from managers C, orders O
           group by C.manager_id, C.full_name, C.email, O.manager_id having O.manager_id = C.manager_id
           order by ordersTotal DESC
           limit 5 offset 5 * (?1 - 1)
           """, nativeQuery = true)
    List<UserDashboardDTO> getManagersList(Integer page);
}
