package org.example.network_backend.controller;

import org.example.network_backend.entity.City;
import org.example.network_backend.entity.State;
import org.example.network_backend.repository.CityRepository;
import org.example.network_backend.repository.StateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
public class LocationController {

    @Autowired
    private StateRepository stateRepository;

    @Autowired
    private CityRepository cityRepository;

    @GetMapping("/states")
    public ResponseEntity<?> getAllStates() {
        List<State> states = stateRepository.findAll();
        List<StateDTO> stateDTOs = states.stream()
                .map(state -> new StateDTO(state.getId(), state.getStateName()))
                .collect(Collectors.toList());
        return ResponseEntity.ok(stateDTOs);
    }

    @GetMapping("/states/{stateId}/cities")
    public ResponseEntity<?> getCitiesByState(@PathVariable Integer stateId) {
        Optional<State> stateOpt = stateRepository.findById(stateId);

        if(stateOpt.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        List<City> cities = cityRepository.findByState(stateOpt.get());
        List<CityDTO> cityDTOs = cities.stream()
                .map(city -> {
                    // Use cityName if available, otherwise fall back to name
                    String cityName = city.getCityName() != null ? city.getCityName() : city.getName();
                    Boolean isArm = city.getIsArm();
                    Boolean isWfm = city.getIsWfm();
                    return new CityDTO(
                        city.getId(),
                        cityName,
                        isArm != null && isArm,
                        isWfm != null && isWfm
                    );
                })
                .collect(Collectors.toList());

        return ResponseEntity.ok(cityDTOs);
    }

    // DTOs for API responses
    static class StateDTO {
        private Integer state_id;
        private String state_name;

        public StateDTO(Integer state_id, String state_name) {
            this.state_id = state_id;
            this.state_name = state_name;
        }

        public Integer getState_id() {
            return state_id;
        }

        public String getState_name() {
            return state_name;
        }
    }

    static class CityDTO {
        private Integer city_id;
        private String city_name;
        private boolean is_arm;
        private boolean is_wfm;

        public CityDTO(Integer city_id, String city_name, boolean is_arm, boolean is_wfm) {
            this.city_id = city_id;
            this.city_name = city_name;
            this.is_arm = is_arm;
            this.is_wfm = is_wfm;
        }

        public Integer getCity_id() {
            return city_id;
        }

        public String getCity_name() {
            return city_name;
        }

        public boolean isIs_arm() {
            return is_arm;
        }

        public boolean isIs_wfm() {
            return is_wfm;
        }
    }
}
