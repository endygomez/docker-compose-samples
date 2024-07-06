# syntax=docker/dockerfile:1

# Stage 1: Install application dependencies
FROM composer:lts AS deps

WORKDIR /app

# Download dependencies as a separate step
RUN --mount=type=bind,source=composer.json,target=composer.json \
    --mount=type=bind,source=composer.lock,target=composer.lock \
    --mount=type=cache,target=/tmp/cache \
    composer install --no-dev --no-interaction

# Stage 2: Set up the PHP application server
FROM php:8.2-cli-alpine AS final

# Install necessary PHP extensions
RUN apk update && apk add --no-cache \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    freetype \
    freetype-dev \
    curl \
    curl-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install curl \
    && apk del libpng-dev libjpeg-turbo-dev freetype-dev

# Copy the application dependencies and source code
COPY --from=deps /app/vendor /var/www/html/vendor
COPY ./src /var/www/html

# Set the working directory to the app directory
WORKDIR /var/www/html

# Command to start the PHP built-in server
CMD ["php", "-S", "0.0.0.0:9000", "-t", "/var/www/html"]
