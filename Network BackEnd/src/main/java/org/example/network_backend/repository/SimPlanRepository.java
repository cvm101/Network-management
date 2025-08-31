package org.example.network_backend.repository;

import org.example.network_backend.entity.SimPlan;
import org.example.network_backend.entity.SimProvider;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface SimPlanRepository extends JpaRepository<SimPlan, Integer> {
    List<SimPlan> findByProvider(SimProvider provider);
}
