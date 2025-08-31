package org.example.network_backend.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "cities")
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "city_name")
    private String cityName;

    @Column(name = "is_arm", columnDefinition = "TINYINT(1)")
    private Boolean isArm;

    @Column(name = "is_wfm", columnDefinition = "TINYINT(1)")
    private Boolean isWfm;

    @ManyToOne
    @JoinColumn(name = "state_id")
    private State state;

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

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Boolean getIsArm() {
        return isArm;
    }

    public void setIsArm(Boolean isArm) {
        this.isArm = isArm;
    }

    public Boolean getIsWfm() {
        return isWfm;
    }

    public void setIsWfm(Boolean isWfm) {
        this.isWfm = isWfm;
    }

    // Legacy getter/setter methods for backward compatibility
    public boolean isArm() {
        return isArm != null && isArm;
    }

    public void setArm(boolean arm) {
        this.isArm = arm;
    }

    public boolean isWfm() {
        return isWfm != null && isWfm;
    }

    public void setWfm(boolean wfm) {
        this.isWfm = wfm;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }
}
