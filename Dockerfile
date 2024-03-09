# Sử dụng một hình ảnh PHP cụ thể với PHP và Nginx
FROM php:7.4-fpm

# Cài đặt các extension PHP cần thiết
RUN docker-php-ext-install pdo pdo_mysql

# Sao chép mã nguồn ứng dụng vào hệ thống tệp của container
COPY . /var/www/html

# Đặt thư mục làm việc
WORKDIR /var/www/html

# Chạy lệnh composer install nếu dự án của bạn sử dụng Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-scripts

# Mở cổng 9000 để PHP-FPM có thể lắng nghe
EXPOSE 9000
