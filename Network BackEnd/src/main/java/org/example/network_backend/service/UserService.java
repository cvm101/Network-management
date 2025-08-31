package org.example.network_backend.service;

import org.example.network_backend.entity.*;
import org.example.network_backend.repository.BillingRepository;
import org.example.network_backend.repository.CityRepository;
import org.example.network_backend.repository.SimPlanRepository;
import org.example.network_backend.repository.SimProviderRepository;
import org.example.network_backend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Map;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SimProviderRepository simProviderRepository;

    @Autowired
    private SimPlanRepository simPlanRepository;

    @Autowired
    private BillingRepository billingRepository;

    @Autowired
    private CityRepository cityRepository;

    @Transactional
    public User registerUser(Map<String, Object> formData) {
        User user = new User();
        user.setName((String) formData.get("name"));
        user.setEmail((String) formData.get("email"));
        user.setMobile((String) formData.get("mobile"));
        user.setState((String) formData.get("state"));
        user.setCity((String) formData.get("city"));
        user.setAddress((String) formData.get("address"));

        // Set the SIM provider
        Integer simcardId = Integer.parseInt(formData.get("simcard_id").toString());
        Optional<SimProvider> provider = simProviderRepository.findById(simcardId);
        provider.ifPresent(user::setProvider);

        // Save user
        return userRepository.save(user);
    }

    @Transactional
    public Billing createBilling(Integer userId, Integer planId) {
        Optional<User> userOpt = userRepository.findById(userId);
        Optional<SimPlan> planOpt = simPlanRepository.findById(planId);

        if (userOpt.isEmpty() || planOpt.isEmpty()) {
            throw new RuntimeException("User or Plan not found");
        }

        User user = userOpt.get();
        SimPlan plan = planOpt.get();

        // Update user with selected plan
        user.setPlan(plan);
        userRepository.save(user);

        // Check if installation charge is needed
        Optional<City> cityOpt = cityRepository.findByCityName(user.getCity());
        BigDecimal installationCharge = BigDecimal.ZERO;

        if (cityOpt.isPresent()) {
            City city = cityOpt.get();
            if (city.getIsArm() != null && !city.getIsArm()) {
                installationCharge = new BigDecimal("890.00");
                city.setIsArm(true);
                cityRepository.save(city);
            }
        }

        // Create billing record
        BigDecimal planAmount = plan.getPrice();
        BigDecimal gstAmount = planAmount.multiply(new BigDecimal("0.18")).setScale(2, RoundingMode.HALF_UP);
        BigDecimal totalAmount = planAmount.add(gstAmount).add(installationCharge).setScale(2, RoundingMode.HALF_UP);

        Billing billing = new Billing();
        billing.setUser(user);
        billing.setPlanAmount(planAmount);
        billing.setGstAmount(gstAmount);
        billing.setInstallationCharge(installationCharge);
        billing.setTotalAmount(totalAmount);
        billing.setPaymentStatus("PENDING");

        return billingRepository.save(billing);
    }

    @Transactional
    public Billing processPayment(Integer billingId, String paymentStatus) {
        Optional<Billing> billingOpt = billingRepository.findById(billingId);

        if (billingOpt.isEmpty()) {
            throw new RuntimeException("Billing record not found");
        }

        Billing billing = billingOpt.get();
        billing.setPaymentStatus(paymentStatus);

        return billingRepository.save(billing);
    }

    public Billing getBillingById(Integer billingId) {
        Optional<Billing> billingOpt = billingRepository.findById(billingId);
        if (billingOpt.isEmpty()) {
            throw new RuntimeException("Billing record not found");
        }
        return billingOpt.get();
    }
}
