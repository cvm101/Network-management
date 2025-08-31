/* filepath: /Users/cvm/springBoot projects/Network Provider/Network frontEnd/script.js */
const stateSelect = document.getElementById('state');
const citySelect = document.getElementById('city');
const simcardSelect = document.getElementById('simcard');
const formContainer = document.querySelector('.form-container');

// Load states from API
fetch('/states')
    .then(response => response.json())
    .then(states => {
        states.forEach(state => {
            const option = document.createElement('option');
            option.value = state.state_id; // backend id
            option.textContent = state.state_name;
            stateSelect.appendChild(option);
        });
    });

// Load SimCard names from Data_plan
fetch('/data-plans')
    .then(response => response.json())
    .then(dataPlans => {
        dataPlans.forEach(plan => {
            const option = document.createElement('option');
            option.value = plan.plan_id; // backend plan id
            option.textContent = plan.name;
            simcardSelect.appendChild(option);
        });
    });

// When state changes, load cities
stateSelect.addEventListener('change', () => {
    const stateId = stateSelect.value;

    fetch(`/states/${stateId}/cities`)
        .then(response => response.json())
        .then(cities => {
            citySelect.innerHTML = '<option value="" disabled selected>Select your city</option>';

            cities.forEach(city => {
                const option = document.createElement('option');
                option.value = city.city_id;
                option.textContent = `${city.city_name} ${city.is_arm ? '(ARM)' : ''} ${city.is_wfm ? '(WFM)' : ''}`;
                citySelect.appendChild(option);
            });
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
    fetch('/submit-form', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    })
    .then(response => {
        if (response.ok) {
            alert('Form submitted successfully!');
            // Redirect to plans page
            window.location.href = 'plans.html';
        } else {
            alert('Failed to submit the form. Please try again.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while submitting the form.');
    });
});