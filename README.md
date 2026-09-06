# OpsMate Docker Project

## Containerizing and Deploying OpsMate Service Using Docker and AWS

This project demonstrates how to containerize a Node.js application using Docker, run a multi-container application using Docker Compose, and prepare the application for deployment on AWS ECR and ECS Fargate.

---

## Project Objectives

- Understand Docker fundamentals
- Create a Dockerfile
- Build and manage Docker images
- Run Docker containers
- Use Docker networking
- Use Docker volumes
- Deploy multiple services using Docker Compose
- Connect a Node.js application to PostgreSQL
- Push Docker images to Amazon ECR
- Deploy the application using Amazon ECS Fargate
- Automate common Docker tasks using shell scripts

---

## Project Architecture

### Local Docker Architecture

```text
                  User
                    |
                    v
          +-------------------+
          |   OpsMate App     |
          |  Node.js Container |
          +---------+---------+
                    |
             Docker Network
                    |
                    v
          +-------------------+
          |    PostgreSQL     |
          |    Container      |
          +---------+---------+
                    |
                    v
             postgres-data
                Volume

 AWS Architecture

       Docker Image
            |
            v
      Amazon ECR
            |
            v
      ECS Fargate
            |
            v
    OpsMate Application

```
---

### Technologies Used
```
Technology              	Purpose
Linux / Ubuntu      	Server environment
Docker              	Containerization
Docker Compose      	Multi-container deployment
Node.js             	Application runtime
Express.js           	Web application framework
PostgreSQL             	Database
Git                  	Version control
GitHub              	Source code repository
AWS ECR             	Docker image registry
AWS ECS             	Container orchestration
AWS Fargate           	Serverless container runtime
```
---

### Project Structure
```
OpsMate-Docker-Project/
│
├── README.md
├── Dockerfile
├── compose.yaml
├── docker-deployment-report.txt
├── .dockerignore
│
├── app/
│   ├── package.json
│   └── src/
│       └── server.js
│
├── config/
│   └── environment.example
│
├── scripts/
│   ├── install-docker.sh
│   ├── build-image.sh
│   ├── run-container.sh
│   └── cleanup.sh
│
├── screenshots/
│
└── documentation/
    ├── Docker-Architecture.png
    └── Project_Report.pdf
```
---

### Dockerfile

The Dockerfile creates the OpsMate application image.

Main instructions used:

FROM
WORKDIR
COPY
RUN
EXPOSE
CMD

---
### Build the image:

docker build -t opsmate:1.0 .

Check the image: docker images

---
### Run OpsMate Container

Run the application:
docker run -d \
  --name opsmate-container \
  -p 8080:8080 \
  opsmate:1.0

Check the running container:
docker ps

Check application logs:
docker logs opsmate-container

---
### Application Endpoints
Home
http://localhost:8080/

Health Check
http://localhost:8080/health

---
Expected response:

{
  "status": "healthy",
  "service": "OpsMate"
}

---

### Docker Compose
```
Docker Compose runs two services:

OpsMate Application
        |
        | Docker Network
        |
        v
PostgreSQL Database
```
---
Start the application:
docker compose up -d

Check services:
docker compose ps

View logs:
docker compose logs

Test the application:
curl http://localhost:8080/health

Test database connectivity:
curl http://localhost:8080/db-test

Stop the Compose stack:
docker compose down
Database

---
### Shell Scripts

install-docker.sh

Installs Docker and starts the Docker service.
./scripts/install-docker.sh
build-image.sh

Builds the OpsMate Docker image.
./scripts/build-image.sh
run-container.sh

Creates and starts the OpsMate container and performs a health check.
./scripts/run-container.sh
cleanup.sh

Stops and removes the application container.
./scripts/cleanup.sh

---
### AWS ECR

AWS region:
ap-south-1

ECR repository:
opsmate

ECR is used to store the Docker image before deploying it to ECS.

Image:
opsmate:1.0

---
### AWS ECS / Fargate

ECS cluster:

opsmate-fargate-cluster

The application is prepared for deployment using:
```
Amazon ECS
        |
        v
AWS Fargate
        |
        v
OpsMate Docker Container
```
---
### Verification

Important Docker commands used during the project:

docker --version
docker info
docker ps
docker images
docker logs opsmate-container
docker inspect opsmate-container

Docker Compose:

docker compose up -d
docker compose ps
docker compose logs
docker compose down

Application testing:

curl http://localhost:8080/health
curl http://localhost:8080/db-test

---
### Learning Outcomes

After completing this project, the following concepts were practiced:
Docker architecture
Images and containers
Dockerfiles
Docker image layers
Port mapping
Container networking
Docker volumes
Docker Compose
Multi-container applications
PostgreSQL containerization
Git and GitHub
Amazon ECR
Amazon ECS
AWS Fargate
Basic DevOps deployment workflow
