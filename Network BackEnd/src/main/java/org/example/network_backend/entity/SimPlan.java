package org.example.network_backend.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "sim_plans")
public class SimPlan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "plan_name")
    private String planName;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "validity")
    private String validity;

    @Column(name = "data_per_day")
    private String dataPerDay;

    @Column(name = "voice_call")
    private String voiceCall;

    @Column(name = "sms_per_day")
    private String smsPerDay;

    @Column(name = "data_limit")
    private String dataLimit;

    @Column(name = "description")
    private String description;

    @ManyToOne
    @JoinColumn(name = "provider_id")
    private SimProvider provider;

    // Getters and setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getValidity() {
        return validity;
    }

    public void setValidity(String validity) {
        this.validity = validity;
    }

    public String getDataPerDay() {
        return dataPerDay;
    }

    public void setDataPerDay(String dataPerDay) {
        this.dataPerDay = dataPerDay;
    }

    public String getVoiceCall() {
        return voiceCall;
    }

    public void setVoiceCall(String voiceCall) {
        this.voiceCall = voiceCall;
    }

    public String getSmsPerDay() {
        return smsPerDay;
    }

    public void setSmsPerDay(String smsPerDay) {
        this.smsPerDay = smsPerDay;
    }

    public String getDataLimit() {
        return dataLimit;
    }

    public void setDataLimit(String dataLimit) {
        this.dataLimit = dataLimit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public SimProvider getProvider() {
        return provider;
    }

    public void setProvider(SimProvider provider) {
        this.provider = provider;
    }
}
