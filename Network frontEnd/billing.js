// Load billing data from localStorage
const billingData = JSON.parse(localStorage.getItem('billingData'));
const billingId = localStorage.getItem('billingId');

if (!billingData) {
    // Redirect back if no billing data found
    window.location.href = 'plans.html';
}

// Populate billing details
if (billingData) {
    const userData = billingData.user_data;
    const selectedPlan = billingData.selected_plan;
    
    // Populate user details
    document.getElementById('billing-name').textContent = userData.name;
    document.getElementById('billing-mobile').textContent = userData.mobile;
    document.getElementById('billing-email').textContent = userData.email;
    document.getElementById('billing-address').textContent = userData.address;
    document.getElementById('billing-state').textContent = userData.state;
    document.getElementById('billing-city').textContent = userData.city;
    document.getElementById('billing-simcard').textContent = userData.simcard;
    
    // Populate plan details
    const planDetailsContainer = document.getElementById('billing-plan-details');
    planDetailsContainer.innerHTML = `
        <div class="plan-info">
            <h3>${selectedPlan.plan_name}</h3>
            <p><strong>Validity:</strong> ${selectedPlan.validity} days</p>
            <p><strong>Data:</strong> ${selectedPlan.data_limit}</p>
            <p><strong>Description:</strong> ${selectedPlan.description}</p>
        </div>
    `;
    
    // Calculate amounts
    const planAmount = parseFloat(selectedPlan.price);
    const gstAmount = planAmount * 0.18;
    const totalAmount = planAmount + gstAmount;
    
    document.getElementById('plan-amount').textContent = `₹${planAmount.toFixed(2)}`;
    document.getElementById('gst-amount').textContent = `₹${gstAmount.toFixed(2)}`;
    document.getElementById('total-amount').querySelector('strong').textContent = `₹${totalAmount.toFixed(2)}`;
}

function processPayment() {
    const paymentData = {
        billing_id: billingId,
        total_amount: parseFloat(document.getElementById('total-amount').querySelector('strong').textContent.replace('₹', '')),
        payment_status: 'PAID'
    };

    // Send payment status to backend
    fetch('/process-payment', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(paymentData)
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error('Payment processing failed');
        }
    })
    .then(result => {
        alert('Payment successful! Your plan has been activated.');
        // Clear localStorage
        localStorage.removeItem('userFormData');
        localStorage.removeItem('billingData');
        localStorage.removeItem('billingId');
        // Redirect to success page or home
        window.location.href = 'index.html';
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Payment failed. Please try again.');
    });
}

function goBackToPlans() {
    window.location.href = 'plans.html';
}