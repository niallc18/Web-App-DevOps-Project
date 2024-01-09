# Web-App-DevOps-Project 

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones. The application makes use of the software delivery pipeline, enabling CI/CD for development and deployment. 

## Table of Contents

- [Features](#features)
- [Prerequisites](#Prerequisites)
- [Usage](#usage)
- [Security](#security)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **DevOps Architecture:** View the architecture of the application.

![DevOps Image](https://github.com/niallc18/Web-App-DevOps-Project/blob/main/devops_image.png) 

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.


## Prerequisites

For the application to succesfully run, you need to install the following packages, as seen in the requirements.txt:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)
- azure-identity (version 1.6.0)
- azure-keyvault-secrets (version 4.1.0)

## Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

For Kubernetes, run the following commands:

```
kubectl apply -f application-manifest.yaml
kubectl get pods
kubectl get services
kubectl port-forward <pod-name> <port:port> e.g. kubectl port-forward flask-app-deployment-xxxxxx-xxxxx 5000:5000
```

## Security

- **Azure:** This project makes use of Azure Key Vault to ensure credentials / sensitive data is not hard-coded into the source code.  
- **Git:** gitignore to prevent exposure to any files containing sensitive data.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

- **DevOps Technologies** Azure, Kubernetes, Terraform, Docker.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
