# Docker compose samples

## Architecture Diagram

![alt text](architecture-diagram.png)

## How to start this service

```
docker-compose up -d
```

## Access the Server

```
Open your browser and go to http://localhost:8081
```

## Test the app

```
Enter a new key and value through the input fields.
Next, you can search for the previously saved key in the app.
```

### Components Summary

- docker-dotnet-sample
  - Dotnet Core 8.0
  - Rest Api
- docker-php-sample
  - Php 8.2
  - Frontend App Example
  - Communicates with docker-dotnet-sample through Rest API
- docker-nginx-conf
  - Exposes the PHP component
  - Access at http://localhost:8081

### Example to generate SSL certificate

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -subj "/CN=localhost"

mkdir ./ssl

mv localhost.crt ./ssl/
mv localhost.crt ./ssl/
```
