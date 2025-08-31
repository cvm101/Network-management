package org.example.network_backend.entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "sim_providers")
public class SimProvider {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private String description;

    @OneToMany(mappedBy = "provider")
    private List<SimPlan> plans;

    // Getters and setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<SimPlan> getPlans() {
        return plans;
    }

    public void setPlans(List<SimPlan> plans) {
        this.plans = plans;
    }
}
