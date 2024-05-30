package com.example.dbcardealership.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.example.dbcardealership.entity.Car;
import com.example.dbcardealership.model.CarDTO;
import com.example.dbcardealership.model.CarSmallDTO;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Integer> {

    @Query(value = """
select
C.model,
C.year,
C.price,
BT.name as bodyType,
FT.name as fuelType,
TT.name as transmissionType,
D.name as driveType,
C.number_of_doors as doorsNumber,
C.capacity,
C.dimensions,
C.wheelbase,
C.engine_volume as engineVolume,
C.power,
C.weight,
C.clearance,
C.load_capacity as loadCapacity,
C.trunk_volume as trunkVolume,
C.color,
C.image
from cars C
left join drive_types D ON D.drive_type_id = C.drive_type_id
left join car_fuel_types CFT on CFT.car_id = C.car_id
left join fuel_types FT on FT.fuel_type_id = CFT.fuel_type_id
left join transmission_types TT on TT.transmission_type_id = C.transmission_type_id
left join body_types BT on BT.body_type_id = C.body_type_id
where C.car_id = ?1
""", nativeQuery = true)
    List<CarDTO> getCarInformationByCarId(int carId);

    @Query(value = """
select
    C.car_id as id,
	C.model,
	C.price,
	C.image,
	C.year,
	C.power,
	C.color,
	BT.name as bodyType
from cars C
left join body_types BT on BT.body_type_id = C.body_type_id;
""", nativeQuery = true)
    List<CarSmallDTO> getAllCars();
}