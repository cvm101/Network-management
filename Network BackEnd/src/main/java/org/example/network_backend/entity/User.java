package org.example.network_backend.entity;


import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private String email;
    private String mobile;
    private String address;
    private String state;
    private String city;

    @ManyToOne
    @JoinColumn(name = "provider_id")
    private SimProvider provider;   // Which SIM (Jio, Airtel, etc.)

    @ManyToOne
    @JoinColumn(name = "plan_id")
    private SimPlan plan;           // Which plan user selected

    // --- Getters & Setters ---
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public SimProvider getProvider() { return provider; }
    public void setProvider(SimProvider provider) { this.provider = provider; }

    public SimPlan getPlan() { return plan; }
    public void setPlan(SimPlan plan) { this.plan = plan; }
}

