# aws-elastic-beanstalk-django-deployment
Deploying a Python Django web application on AWS Elastic Beanstalk with PostgreSQL, environment configuration, application health monitoring and AWS-managed infrastructure.

# AWS Elastic Beanstalk Django Deployment

A hands-on AWS deployment project demonstrating how to deploy a Python Django web application using Amazon Elastic Beanstalk.

The project focuses on deploying and configuring a Django application using AWS-managed infrastructure, environment variables, PostgreSQL database connectivity, application health monitoring and production deployment practices.

## 🚀 Project Overview

This project demonstrates the deployment of a Django web application on AWS Elastic Beanstalk.

Unlike the EC2 deployment approach where the web server and application process are configured manually, Elastic Beanstalk manages much of the underlying application infrastructure and deployment lifecycle.

The application is deployed through an Elastic Beanstalk environment and configured to run Django with the required Python dependencies and database settings.

## 🏗️ Architecture

```text
                         Internet
                            |
                            v
                 AWS Elastic Beanstalk
                       Environment
                            |
                            v
                    Django Application
                            |
                            v
                    PostgreSQL / RDS
```

### Application Flow

```text
Client
   |
   v
Elastic Beanstalk Environment
   |
   v
Django Application
   |
   v
PostgreSQL Database
```

## 🛠️ Technologies Used

### Application

* Python
* Django
* PostgreSQL
* Gunicorn

### AWS

* AWS Elastic Beanstalk
* Amazon EC2
* Amazon RDS
* Amazon S3
* IAM
* CloudWatch
* Security Groups

### Development

* Git
* GitHub
* Python Virtual Environment
* Environment Variables

## ☁️ Elastic Beanstalk Deployment

The Django application was deployed using an AWS Elastic Beanstalk environment.

Elastic Beanstalk was used to manage the underlying application infrastructure and deployment process.

The deployment involved:

* Creating an Elastic Beanstalk application
* Creating an Elastic Beanstalk environment
* Selecting the Python platform
* Configuring application environment variables
* Deploying the Django application
* Configuring the application entry point
* Configuring database connectivity
* Monitoring application health
* Troubleshooting deployment and runtime issues

## 🔧 Django Configuration

The Django application was configured for deployment on AWS Elastic Beanstalk.

Important production settings include:

```python
ALLOWED_HOSTS = [
    ".elasticbeanstalk.com",
]
```

The actual allowed hosts should be configured according to the deployed environment.

Sensitive configuration values such as database credentials are supplied through environment variables rather than being hard-coded into the application.

## 🔐 Environment Variables

The application uses environment variables for configuration.

Example:

```text
DB_NAME
DB_USER
DB_PASSWORD
DB_HOST
DB_PORT
DJANGO_SECRET_KEY
DEBUG
```

Sensitive values should not be committed to GitHub.

A `.env.example` file can be used to document the required variables without exposing credentials.

Example:

```text
DB_NAME=
DB_USER=
DB_PASSWORD=
DB_HOST=
DB_PORT=5432
DJANGO_SECRET_KEY=
DEBUG=False
```

## 🗄️ PostgreSQL Database

The Django application was configured to use PostgreSQL.

Database configuration follows the environment-based approach:

```python
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": os.environ.get("DB_NAME"),
        "USER": os.environ.get("DB_USER"),
        "PASSWORD": os.environ.get("DB_PASSWORD"),
        "HOST": os.environ.get("DB_HOST"),
        "PORT": "5432",
    }
}
```

This allows the application to connect to an external PostgreSQL database such as Amazon RDS without storing credentials in the source code.

## 📦 Dependencies

Application dependencies are maintained in:

```text
requirements.txt
```

Example:

```text
Django
gunicorn
psycopg2-binary
```

The exact versions used by the project should be pinned in the final `requirements.txt`.

For example:

```text
Django==<version>
gunicorn==<version>
psycopg2-binary==<version>
```

## 📁 Project Structure

```text
aws-elastic-beanstalk-django-deployment/
│
├── manage.py
├── requirements.txt
├── .gitignore
├── .env.example
├── README.md
│
├── config/
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   ├── wsgi.py
│   └── ...
│
├── templates/
│   └── ...
│
├── static/
│   └── ...
│
└── ...
```

If you use Elastic Beanstalk-specific configuration files, they can be placed under:

```text
.ebextensions/
```

or:

```text
.platform/
```

depending on the deployment configuration used by the application.

## 🩺 Application Health Monitoring

Elastic Beanstalk environment health was used to monitor the application.

The deployment was validated by checking:

* Environment health
* Application URL
* Application logs
* HTTP response status
* Django application errors
* Database connectivity

AWS CloudWatch can also be used for application and infrastructure monitoring.

## 🐛 Troubleshooting Experience

During deployment, application and infrastructure issues were investigated.

### Database Migration Issue

The Django application initially encountered a database error:

```text
relation "auth_user" does not exist
```

This indicated that the Django database tables had not been created in the PostgreSQL database.

The issue was investigated by validating the database configuration and running Django migrations:

```bash
python manage.py migrate
```

This demonstrates an important deployment concept:

```text
Django Application
       |
       v
PostgreSQL
       |
       v
Django migrations
       |
       v
Application tables
```

### Database Connectivity

Troubleshooting included validating:

* Database hostname
* Database port
* Database credentials
* Security Group rules
* PostgreSQL availability
* Django database configuration

### Application Configuration

Deployment issues were investigated around:

* `ALLOWED_HOSTS`
* Environment variables
* Django settings
* Application startup
* Static files
* Database migrations
* Elastic Beanstalk environment configuration

## 🔒 Security Considerations

The application follows basic cloud security practices:

* Database credentials are not stored in source code.
* Sensitive configuration is supplied using environment variables.
* Database access should be restricted through Security Groups.
* `DEBUG` should be disabled in production.
* Django secret keys should not be committed to GitHub.
* Only required network access should be allowed.

## 🎯 What I Learned

Through this project I gained hands-on experience with:

* Deploying Django applications using AWS Elastic Beanstalk
* Understanding Elastic Beanstalk application and environment concepts
* Python application deployment on AWS
* Configuring Django for cloud deployment
* Environment variable management
* PostgreSQL/RDS integration
* Database migrations
* AWS Security Groups
* Application health monitoring
* CloudWatch logs
* Troubleshooting deployment failures
* Debugging Django production configuration

## 🔮 Future Improvements

Planned improvements include:

* Add HTTPS using AWS Certificate Manager
* Configure a custom domain using Route 53
* Move static files to Amazon S3
* Add CloudFront for static content delivery
* Implement CI/CD using GitHub Actions
* Automate infrastructure using Terraform
* Containerize the application using Docker
* Deploy the same application using Amazon ECS
* Deploy the same application using Amazon EKS

## 📌 Project Goal

The goal of this project is to demonstrate practical experience deploying and troubleshooting a Python Django application using AWS Elastic Beanstalk and integrating it with AWS database, networking, security and monitoring services.
