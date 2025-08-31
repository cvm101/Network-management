package org.example.network_backend.controller;

import org.example.network_backend.entity.Billing;
import org.example.network_backend.entity.User;
import org.example.network_backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/submit-form")
    public ResponseEntity<?> registerUser(@RequestBody Map<String, Object> formData) {
        try {
            User user = userService.registerUser(formData);
            Map<String, Object> response = new HashMap<>();
            response.put("user_id", user.getId());
            response.put("success", true);
            response.put("message", "User registered successfully");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "Failed to register user: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

    @PostMapping("/submit-billing")
    public ResponseEntity<?> createBilling(@RequestBody Map<String, Object> billingData) {
        try {
            Map<String, Object> userData = (Map<String, Object>) billingData.get("user_data");
            Map<String, Object> planData = (Map<String, Object>) billingData.get("selected_plan");

            Integer userId = Integer.parseInt(userData.get("user_id").toString());
            Integer planId = Integer.parseInt(planData.get("plan_id").toString());

            Billing billing = userService.createBilling(userId, planId);

            Map<String, Object> response = new HashMap<>();
            response.put("billing_id", billing.getId());
            response.put("success", true);
            response.put("message", "Billing created successfully");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "Failed to create billing: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

    @PostMapping("/process-payment")
    public ResponseEntity<?> processPayment(@RequestBody Map<String, Object> paymentData) {
        try {
            Integer billingId = Integer.parseInt(paymentData.get("billing_id").toString());
            String paymentStatus = (String) paymentData.get("payment_status");

            Billing billing = userService.processPayment(billingId, paymentStatus);

            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("payment_status", billing.getPaymentStatus());

            // Check if installation charge was applied
            if (billing.getInstallationCharge() != null && billing.getInstallationCharge().compareTo(BigDecimal.ZERO) > 0) {
                response.put("message", "🎉 Welcome to our network family! Your payment has been processed successfully. Our technical team will install the network infrastructure in your city within 7-10 business days. Thank you for choosing us - your service will arrive soon!");
            } else {
                response.put("message", "🎉 Payment processed successfully! Your service is ready to use. Thank you for choosing our network!");
            }

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "Failed to process payment: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

    @GetMapping("/billing/{billingId}")
    public ResponseEntity<?> getBillingDetails(@PathVariable Integer billingId) {
        try {
            Billing billing = userService.getBillingById(billingId);

            Map<String, Object> response = new HashMap<>();
            response.put("id", billing.getId());
            response.put("planAmount", billing.getPlanAmount());
            response.put("gstAmount", billing.getGstAmount());
            response.put("installationCharge", billing.getInstallationCharge() != null ? billing.getInstallationCharge() : BigDecimal.ZERO);
            response.put("totalAmount", billing.getTotalAmount());
            response.put("paymentStatus", billing.getPaymentStatus());

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "Failed to fetch billing details: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
}
