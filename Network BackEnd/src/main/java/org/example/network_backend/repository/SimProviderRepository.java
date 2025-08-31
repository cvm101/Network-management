package org.example.network_backend.repository;

import org.example.network_backend.entity.SimProvider;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SimProviderRepository extends JpaRepository<SimProvider, Integer> {
}
