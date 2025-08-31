// Load user data from localStorage
const userData = JSON.parse(localStorage.getItem('userFormData'));
let selectedPlan = null;

if (userData) {
    document.getElementById('user-name').textContent = userData.name;
    document.getElementById('user-mobile').textContent = userData.mobile;
    document.getElementById('user-address').textContent = userData.address;
    document.getElementById('user-simcard').textContent = userData.simcard;
} else {
    // Redirect back if no data found
    window.location.href = 'index.html';
}

// Load plans from backend based on selected SimCard
if (userData && userData.simcard_id) {
    fetch(`/data-plans/${userData.simcard_id}/plans`)
        .then(response => response.json())
        .then(plans => {
            const plansContainer = document.getElementById('plans-container');
            
            plans.forEach(plan => {
                const planCard = document.createElement('div');
                planCard.className = 'plan-card';
                planCard.innerHTML = `
                    <h3>${plan.plan_name}</h3>
                    <p class="price">₹${plan.price}</p>
                    <p class="validity">Validity: ${plan.validity} days</p>
                    <p class="data">Data: ${plan.data_limit}</p>
                    <p class="description">${plan.description}</p>
                    <button class="select-plan-btn" onclick="selectPlan(${plan.plan_id}, '${plan.plan_name}', ${plan.price}, '${plan.validity}', '${plan.data_limit}', '${plan.description}')">Select Plan</button>
                `;
                plansContainer.appendChild(planCard);
            });
        })
        .catch(error => {
            console.error('Error loading plans:', error);
            document.getElementById('plans-container').innerHTML = '<p>Error loading plans. Please try again.</p>';
        });
}

function selectPlan(planId, planName, price, validity, dataLimit, description) {
    selectedPlan = {
        plan_id: planId,
        plan_name: planName,
        price: price,
        validity: validity,
        data_limit: dataLimit,
        description: description
    };

    // Display selected plan
    const selectedPlanSection = document.getElementById('selected-plan-section');
    const selectedPlanDetails = document.getElementById('selected-plan-details');
    
    selectedPlanDetails.innerHTML = `
        <h3>${planName}</h3>
        <p class="price">₹${price}</p>
        <p class="validity">Validity: ${validity} days</p>
        <p class="data">Data: ${dataLimit}</p>
        <p class="description">${description}</p>
    `;
    
    selectedPlanSection.style.display = 'block';
    
    // Remove selection from other cards and highlight selected
    document.querySelectorAll('.plan-card').forEach(card => {
        card.classList.remove('selected');
    });
    event.target.closest('.plan-card').classList.add('selected');
}

function submitPlanSelection() {
    if (!selectedPlan) {
        alert('Please select a plan first!');
        return;
    }

    const billingData = {
        user_data: userData,
        selected_plan: selectedPlan,
        total_amount: selectedPlan.price
    };

    // Store billing data in localStorage
    localStorage.setItem('billingData', JSON.stringify(billingData));

    // Send data to backend
    fetch('/submit-billing', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(billingData)
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error('Failed to submit billing data');
        }
    })
    .then(result => {
        // Store billing ID from backend response
        localStorage.setItem('billingId', result.billing_id);
        alert('Plan selection submitted successfully!');
        // Redirect to billing page
        window.location.href = 'billing.html';
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while submitting plan selection.');
    });
}

function goBack() {
    window.location.href = 'index.html';
}