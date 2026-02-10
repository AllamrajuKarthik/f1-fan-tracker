# 🏎️ F1 Fan Tracker – DevOps & CI/CD Project
F1 Fan Tracker is a containerized web application built to demonstrate 
DevOps practices, CI/CD automation, and multi-service orchestration.
The project showcases:
- Flask-based web application
- MySQL database integration
- Docker containerization
- Docker Compose orchestration
- Nginx reverse proxy
- Jenkins CI/CD pipeline
- Automated container rebuild & deployment
This project focuses on infrastructure, automation, and deployment practices
rather than complex application logic.

## 🏗️ Components
### Flask App
- Serves dynamic content
- Connects to MySQL database
### MySQL Database
- Persistent backend storage
- Managed as a Docker service
### Docker
- Application containerization
- Ensures reproducible environments
### Docker Compose
- Multi-container orchestration
- Network + service configuration
### Nginx
- Reverse proxy
- Port routing and exposure management
### Jenkins
- CI/CD automation
- Builds new Docker image
- Spins up updated container
- Exposes service automatically

## ⚙️ Tech Stack
- Python (Flask)
- MySQL
- Docker
- Docker Compose
- Jenkins
- Nginx
- Linux

## 🔄 Workflow
- Code pushed to the repository's main branch
- jenkins pipeline triggered
- Docker image rebuilt
- Old container stopped
- New container deployed
- Nginx routes traffic to updated service

## 🚀 How to Run Locally
- Clone the repository
```
git clone https://github.com/AllamrajuKarthik/f1-fan-tracker.git
cd f1-fan-tracker
```
- Start services using Docker Compose
```
docker-compose up --build
```
- Access the application
```
http://localhost:<nginx_port>
```

## 🎯 Project Goals
- Demonstrate containerization best practices
- Implement CI/CD using Jenkins
- Use reverse proxy for service exposure
- Manage multi-service architecture using Docker Compose
- Simulate production-style deployment setup

## 🔮 Future Improvements
- Add GitHub Actions alternative pipeline
- Add automated tests
- Deploy to cloud (Azure App Service / VM)
- Add monitoring (Prometheus + Grafana)
- Implement Blue-Green or Rolling deployment strategy

***

## 📄 License
This project is for educational and personal use.
