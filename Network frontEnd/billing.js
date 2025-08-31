// Define the backend API base URL - change this to match your Spring Boot server
const API_BASE_URL = 'http://localhost:8080';

// Load billing data from localStorage
const billingData = JSON.parse(localStorage.getItem('billingData'));
const billingId = localStorage.getItem('billingId');

if (!billingData || !billingId) {
    // Redirect back if no billing data found
    window.location.href = 'plans.html';
}

// Fetch actual billing details from backend
async function loadBillingDetails() {
    try {
        const response = await fetch(`${API_BASE_URL}/billing/${billingId}`);
        if (!response.ok) {
            throw new Error('Failed to fetch billing details');
        }
        const billing = await response.json();

        // Populate user details
        const userData = billingData.user_data;
        document.getElementById('billing-name').textContent = userData.name;
        document.getElementById('billing-mobile').textContent = userData.mobile;
        document.getElementById('billing-email').textContent = userData.email;
        document.getElementById('billing-address').textContent = userData.address;
        document.getElementById('billing-state').textContent = userData.state;
        document.getElementById('billing-city').textContent = userData.city;
        document.getElementById('billing-simcard').textContent = userData.simcard;

        // Populate plan details
        const selectedPlan = billingData.selected_plan;
        const planDetailsContainer = document.getElementById('billing-plan-details');
        planDetailsContainer.innerHTML = `
            <div class="plan-info">
                <h3>${selectedPlan.plan_name}</h3>
                <p><strong>Validity:</strong> ${selectedPlan.validity} days</p>
                <p><strong>Data:</strong> ${selectedPlan.data_limit}</p>
                <p><strong>Description:</strong> ${selectedPlan.description}</p>
            </div>
        `;

        // Display amounts from backend
        document.getElementById('plan-amount').textContent = `₹${billing.planAmount.toFixed(2)}`;
        document.getElementById('gst-amount').textContent = `₹${billing.gstAmount.toFixed(2)}`;

        // Show installation charge if applicable
        if (billing.installationCharge && billing.installationCharge > 0) {
            document.getElementById('installation-row').style.display = 'flex';
            document.getElementById('installation-amount').textContent = `₹${billing.installationCharge.toFixed(2)}`;
        }

        document.getElementById('total-amount').querySelector('strong').textContent = `₹${billing.totalAmount.toFixed(2)}`;

    } catch (error) {
        console.error('Error loading billing details:', error);
        // Fallback to local calculation if backend fails
        loadFallbackBilling();
    }
}

// Fallback function for local calculation (existing logic)
function loadFallbackBilling() {
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

        // Calculate amounts (fallback)
        const planAmount = parseFloat(selectedPlan.price);
        const gstAmount = planAmount * 0.18;
        const totalAmount = planAmount + gstAmount;

        document.getElementById('plan-amount').textContent = `₹${planAmount.toFixed(2)}`;
        document.getElementById('gst-amount').textContent = `₹${gstAmount.toFixed(2)}`;
        document.getElementById('total-amount').querySelector('strong').textContent = `₹${totalAmount.toFixed(2)}`;
    }
}

// Load billing details when page loads
document.addEventListener('DOMContentLoaded', loadBillingDetails);

function processPayment() {
    const paymentData = {
        billing_id: billingId,
        payment_status: 'PAID'
    };

    // Send payment status to backend
    fetch(`${API_BASE_URL}/process-payment`, {
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
        // Display the custom message from backend
        alert(result.message);
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