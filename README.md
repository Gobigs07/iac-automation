Automate local setup of:

  Jenkins
  Redis
  Nginx
  Sample Node.js App

All services start together using Docker Compose.

infra-automation/
├── app/
│   ├── app.js
│   └── Dockerfile
├── nginx/
│   └── default.conf
├── docker-compose.yml
├── setup.sh
└── README.md

⚙️ Prerequisites

Docker Desktop installed

Docker Compose installed

🚀 Run Setup

    Linux / Git Bash:

      ./setup.sh

    Windows PowerShell:

      bash -c "./setup.sh"
            or
      .\setup.ps1
