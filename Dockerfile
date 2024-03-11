# Sử dụng một hình ảnh PHP cụ thể với PHP và Nginx
FROM php:7.4-fpm

# Cài đặt các extension PHP cần thiết từ các gói đã được cài đặt sẵn trong hình ảnh
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli zip

# Sao chép mã nguồn ứng dụng vào hệ thống tệp của container
COPY . /var/www/html

# Đặt thư mục làm việc
WORKDIR /var/www/html

# Cài đặt Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Chạy composer install để cài đặt các dependencies (nếu có)
# RUN composer install --no-scripts --no-autoloader

# Sao lưu autoloader
# RUN composer dump-autoload --optimize

# Mở cổng 9000 để PHP-FPM có thể lắng nghe
EXPOSE 9000
