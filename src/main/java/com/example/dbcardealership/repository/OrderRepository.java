package com.example.dbcardealership.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import com.example.dbcardealership.entity.Order;
import com.example.dbcardealership.model.*;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    @Query(value = """
select
	O.order_id as orderId,
	M.full_name as fullName,
	M.email,
	OS.status,
	C.car_id as carId,
	C.model,
	C.price,
	C.image,
	C.year,
	C.power,
	C.color,
	BT.name as bodyType
from  "orders" O
left join "order_car" OC on OC.order_id = O.order_id
join "cars" C on C.car_id = OC.car_id
join "body_types" BT on BT.body_type_id = C.body_type_id
left join "managers" M on M.manager_id = O.manager_id
left join "order_status" OS on OS.order_status_id = O.order_status_id
where O.client_id = ?1
""", nativeQuery = true)
    List<OrderDTO> getAllClientOrders(int clientId);

    @Modifying
    @Query(value = """
insert into orders (client_id, manager_id, order_status_id, price) values (?1, ?2, 9, ?3)
""", nativeQuery = true)
    Integer addOrder(Integer clientId, Integer managerId, Double price);

    @Query(value = """
select SUM(AO.option_price)
from additional_options AO where AO.additional_option_id in (?1);
""", nativeQuery = true)
    Double calculateOptionsPrice(List<Integer> optionIds);


    @Modifying
    @Query(value = """
insert into additional_options_order (order_id, additional_option_id) values (?1, ?2)
""", nativeQuery = true)
    void addOrderOption(Integer orderId, Integer optionId);

    @Modifying
    @Query(value = """
insert into order_car (order_id, car_id) VALUES (?1, ?2)
""", nativeQuery = true)
    void addOrderCar(Integer orderId, Integer carId);

    @Query(value = """
select
sum(O.price) as sum
from orders O where O.date >= now() - interval '365 days'
""", nativeQuery = true)
    Sum getEarnedForLastYear();

    @Query(value = """
select
SUM(O.price) as sum,
M.full_name as fullName
from orders O, managers M
group by M.full_name, M.manager_id, O.manager_id having  M.manager_id = O.manager_id
limit 3
""", nativeQuery = true)
    List<ManagerSalesDTO> getManagersTop3Rating();

    @Query(value = """
            select
            count(C.car_id) as ordersCount,
            C.model
            from orders O
            left join order_car OC on OC.order_id = O.order_id
            join cars C on C.car_id = OC.car_id
            where O.date >= now() - interval '365 days'
            group by C.model
            order by ordersCount DESC
            limit 3
            """, nativeQuery = true)
List<CarDashboardDTO> getCarsTop3Rating();
}
