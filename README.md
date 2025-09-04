# Network Provider Management System

[![Java](https://img.shields.io/badge/Java-21-orange.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.5-green.svg)](https://spring.io/projects/spring-boot)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue.svg)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A comprehensive network provider management system that allows users to sign up for network services, select data plans, and manage billing. The system features a modern web interface with a robust Spring Boot backend.

## 🚀 Features

### Core Functionality
- **User Registration**: Complete user registration with location-based services
- **Dynamic Location Selection**: State and city selection fetched from database
- **SIM Plan Management**: Multiple network providers with various data plans
- **Smart Billing System**: Automatic billing calculation with installation charges
- **Network Coverage Management**: Dynamic installation charges based on network availability

### Technical Features
- **RESTful API**: Clean and well-structured REST endpoints
- **Database Integration**: MySQL database with JPA/Hibernate
- **CORS Support**: Cross-origin resource sharing for frontend-backend communication
- **Responsive Design**: Modern, professional UI with mobile-first approach
- **Dynamic Data Loading**: Real-time data fetching from database

## 🏗️ Architecture

```
Network Provider/
├── Network BackEnd/          # Spring Boot REST API
│   ├── src/main/java/
│   │   └── org/example/network_backend/
│   │       ├── controller/   # REST Controllers
│   │       ├── entity/       # JPA Entities
│   │       ├── repository/   # Data Access Layer
│   │       ├── service/      # Business Logic
│   │       └── config/       # Configuration Classes
│   └── src/main/resources/
│       └── application.properties
├── Network frontEnd/         # Frontend Web Application
│   ├── index.html           # User Registration
│   ├── plans.html           # Plan Selection
│   ├── billing.html         # Billing & Checkout
│   └── *.css, *.js         # Styling & JavaScript
└── network_mang.sql         # Database Schema
```

## 🛠️ Technologies Used

### Backend
- **Java 21**: Latest LTS version of Java
- **Spring Boot 3.5.5**: Modern Spring framework
- **Spring Data JPA**: Database abstraction layer
- **MySQL Connector**: Database connectivity
- **Maven**: Dependency management

### Frontend
- **HTML5**: Modern markup language
- **CSS3**: Advanced styling with Flexbox/Grid
- **Vanilla JavaScript**: ES6+ features
- **Font Awesome**: Professional icons
- **Google Fonts**: Typography (Inter font family)

### Database
- **MySQL 8.0**: Relational database management
- **JPA/Hibernate**: Object-relational mapping

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

- **Java 21** or higher
- **Maven 3.6+**
- **MySQL 8.0+**
- **Git** (for cloning the repository)

## ⚡ Quick Start

### 1. Clone the Repository
```bash
git clone <repository-url>
cd "Network Provider"
```

### 2. Database Setup
```bash
# Create MySQL database
mysql -u root -p
CREATE DATABASE network_mang;

# Import the schema
mysql -u root -p network_mang < network_mang.sql
```

### 3. Configure Database Connection
Edit `Network BackEnd/src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/network_mang
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### 4. Run the Backend
```bash
cd "Network BackEnd"
./mvnw spring-boot:run
```
The backend will start on `http://localhost:8080`

### 5. Launch the Frontend
```bash
cd "Network frontEnd"
# Use any local server (e.g., Live Server in VS Code)
# Or use Python's built-in server:
python3 -m http.server 3000
```
The frontend will be available on `http://localhost:3000`

## 📊 Database Schema

### Core Tables
- **states**: Indian states with network coverage
- **cities**: Cities with ARM (network availability) status
- **sim_providers**: Network service providers
- **sim_plans**: Available data plans with pricing
- **users**: Customer information and selected plans
- **billing**: Billing records and transactions

### Key Relationships
- States → Cities (One-to-Many)
- SimProviders → SimPlans (One-to-Many)
- Users → Billing (One-to-Many)

## 🔧 API Endpoints

### Location Services
```
GET /api/states              # Get all states
GET /api/states/{id}/cities  # Get cities by state
```

### SIM Services
```
GET /api/providers           # Get all SIM providers
GET /api/plans/{providerId}  # Get plans by provider
```

### User Management
```
POST /api/users              # Create new user
POST /api/users/{id}/billing # Create billing record
```

## 💡 Key Features Explained

### Installation Charge System
- New cities (where `is_arm = false`) incur a one-time installation charge of ₹890
- After first billing, the city is marked as covered (`is_arm = true`)
- Subsequent customers in the same city don't pay installation charges

### Dynamic Plan Loading
- Plans are filtered based on the selected SIM provider
- Real-time pricing and feature display
- Comprehensive plan comparison

### Professional UI/UX
- Modern card-based design
- Smooth animations and transitions
- Mobile-responsive layout
- Accessible form controls

## 🔒 Security Features

- CORS configuration for secure cross-origin requests
- Input validation on both frontend and backend
- SQL injection prevention through JPA
- Secure database connection handling

## 🧪 Testing

### Backend Testing
```bash
cd "Network BackEnd"
./mvnw test
```

### Manual Testing
1. **Registration Flow**: Test user registration with different states/cities
2. **Plan Selection**: Verify plan filtering by provider
3. **Billing Logic**: Test installation charges for new cities
4. **Data Persistence**: Confirm data is saved correctly

## 📝 Development Workflow

### Adding New Features
1. **Backend**: Create entity → Repository → Service → Controller
2. **Frontend**: Add UI components → JavaScript logic → API integration
3. **Database**: Update schema if needed

### Code Style
- Follow Spring Boot best practices
- Use meaningful variable names
- Implement proper error handling
- Write comprehensive comments

## 🚀 Deployment

### Production Considerations
- Configure production database settings
- Set up proper logging
- Implement security measures
- Use environment variables for sensitive data

### Docker Deployment (Optional)
```dockerfile
# Example Dockerfile for backend
FROM openjdk:21-jdk-slim
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## 🙏 Acknowledgments

- Spring Boot community for excellent documentation
- Font Awesome for professional icons
- Google Fonts for typography
- MySQL team for robust database solution

---

**Built with ❤️ using Spring Boot and modern web technologies**
