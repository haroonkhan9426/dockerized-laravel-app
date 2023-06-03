FROM php:8.1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Got the working directory
WORKDIR /var/www/src_code

# Copy source code to container
COPY ./../src .

# Rename .env.example to .env for usage
RUN mv .env.example .env

# Install composer packages
RUN composer install

# Generate key
RUN php artisan key:generate

# clear the environment
RUN php artisan optimize:clear

# Give server user (www-data) permission to the src code
RUN chown -R www-data:www-data /var/www/src_code


# # Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u $uid -d /home/$user $user
# RUN mkdir -p /home/$user/.composer && \
#     chown -R $user:$user /home/$user





