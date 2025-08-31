/* filepath: /Users/cvm/springBoot projects/Network Provider/Network frontEnd/script.js */
const stateSelect = document.getElementById('state');
const citySelect = document.getElementById('city');
const simcardSelect = document.getElementById('simcard');
const formContainer = document.querySelector('.form-container');

// Define the backend API base URL - change this to match your Spring Boot server
const API_BASE_URL = 'http://localhost:8080';

// Load states from API
fetch(`${API_BASE_URL}/states`)
    .then(response => response.json())
    .then(states => {
        states.forEach(state => {
            const option = document.createElement('option');
            option.value = state.state_id; // backend id
            option.textContent = state.state_name;
            stateSelect.appendChild(option);
        });
    })
    .catch(error => {
        console.error('Error loading states:', error);
    });

// Load SimCard names from Data_plan
fetch(`${API_BASE_URL}/data-plans`)
    .then(response => response.json())
    .then(dataPlans => {
        dataPlans.forEach(plan => {
            const option = document.createElement('option');
            option.value = plan.plan_id; // backend plan id
            option.textContent = plan.name;
            simcardSelect.appendChild(option);
        });
    })
    .catch(error => {
        console.error('Error loading sim providers:', error);
    });

// When state changes, load cities
stateSelect.addEventListener('change', () => {
    const stateId = stateSelect.value;

    fetch(`${API_BASE_URL}/states/${stateId}/cities`)
        .then(response => response.json())
        .then(cities => {
            citySelect.innerHTML = '<option value="" disabled selected>Select your city</option>';

            cities.forEach(city => {
                const option = document.createElement('option');
                option.value = city.city_id;
                option.textContent = `${city.city_name} ${city.is_arm ? '(ARM)' : ''} ${city.is_wfm ? '(WFM)' : ''}`;
                citySelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error('Error loading cities:', error);
        });
});

// Handle form submission
formContainer.addEventListener('submit', (event) => {
    event.preventDefault(); // Prevent default form submission

    // Collect form data
    const formData = {
        email: document.getElementById('email').value,
        name: document.getElementById('name').value,
        mobile: document.getElementById('mobile').value,
        state: stateSelect.options[stateSelect.selectedIndex]?.textContent,
        city: citySelect.options[citySelect.selectedIndex]?.textContent,
        simcard: simcardSelect.options[simcardSelect.selectedIndex]?.textContent,
        simcard_id: simcardSelect.value,
        address: document.getElementById('address').value
    };

    // Store form data in localStorage for plans page
    localStorage.setItem('userFormData', JSON.stringify(formData));

    // Send form data to the backend
    fetch(`${API_BASE_URL}/submit-form`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error('Failed to submit the form');
        }
    })
    .then(data => {
        // Add the user_id from the response to our formData and update localStorage
        formData.user_id = data.user_id;
        localStorage.setItem('userFormData', JSON.stringify(formData));

        alert('Form submitted successfully!');
        // Redirect to plans page
        window.location.href = 'plans.html';
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while submitting the form.');
    });
});