package org.example.network_backend.controller;

import org.example.network_backend.entity.SimPlan;
import org.example.network_backend.entity.SimProvider;
import org.example.network_backend.repository.SimPlanRepository;
import org.example.network_backend.repository.SimProviderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
public class SimController {

    @Autowired
    private SimProviderRepository simProviderRepository;

    @Autowired
    private SimPlanRepository simPlanRepository;

    @GetMapping("/data-plans")
    public ResponseEntity<?> getAllSimProviders() {
        List<SimProvider> providers = simProviderRepository.findAll();
        List<ProviderDTO> providerDTOs = providers.stream()
                .map(provider -> new ProviderDTO(provider.getId(), provider.getName()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(providerDTOs);
    }

    @GetMapping("/data-plans/{providerId}/plans")
    public ResponseEntity<?> getPlansByProvider(@PathVariable Integer providerId) {
        Optional<SimProvider> providerOpt = simProviderRepository.findById(providerId);

        if(providerOpt.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        List<SimPlan> plans = simPlanRepository.findByProvider(providerOpt.get());
        List<PlanDTO> planDTOs = plans.stream()
                .map(plan -> new PlanDTO(
                    plan.getId(),
                    plan.getPlanName(),
                    plan.getPrice(),
                    plan.getValidity(),
                    plan.getDataPerDay(),
                    plan.getVoiceCall(),
                    plan.getSmsPerDay(),
                    plan.getDataLimit(),
                    plan.getDescription()
                ))
                .collect(Collectors.toList());

        return ResponseEntity.ok(planDTOs);
    }

    // DTOs for API responses
    static class ProviderDTO {
        private Integer plan_id;  // This represents provider ID, but named plan_id to match frontend expectations
        private String name;

        public ProviderDTO(Integer plan_id, String name) {
            this.plan_id = plan_id;
            this.name = name;
        }

        public Integer getPlan_id() {
            return plan_id;
        }

        public String getName() {
            return name;
        }
    }

    static class PlanDTO {
        private Integer id;  // Changed from plan_id to id to match frontend expectations
        private String plan_name;
        private BigDecimal price;
        private String validity;
        private String data_per_day;
        private String voice_call;
        private String sms_per_day;
        private String data_limit;
        private String description;

        public PlanDTO(Integer id, String plan_name, BigDecimal price, String validity,
                      String data_per_day, String voice_call, String sms_per_day,
                      String data_limit, String description) {
            this.id = id;
            this.plan_name = plan_name;
            this.price = price;
            this.validity = validity;
            this.data_per_day = data_per_day;
            this.voice_call = voice_call;
            this.sms_per_day = sms_per_day;
            this.data_limit = data_limit;
            this.description = description;
        }

        public Integer getId() {
            return id;
        }

        public String getPlan_name() {
            return plan_name;
        }

        public BigDecimal getPrice() {
            return price;
        }

        public String getValidity() {
            return validity;
        }

        public String getData_per_day() {
            return data_per_day;
        }

        public String getVoice_call() {
            return voice_call;
        }

        public String getSms_per_day() {
            return sms_per_day;
        }

        public String getData_limit() {
            return data_limit;
        }

        public String getDescription() {
            return description;
        }
    }
}
