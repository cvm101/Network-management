package org.example.network_backend.repository;

import org.example.network_backend.entity.City;
import org.example.network_backend.entity.State;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface CityRepository extends JpaRepository<City, Integer> {
    List<City> findByState(State state);

    // Try to find by both possible city name columns
    @Query("SELECT c FROM City c WHERE c.cityName = :cityName OR c.name = :cityName")
    Optional<City> findByCityName(@Param("cityName") String cityName);

    Optional<City> findByName(String name);
}
