# Sử dụng ảnh chính thức của Nginx
FROM nginx:latest

# Xóa tệp cấu hình mặc định
RUN rm /etc/nginx/conf.d/default.conf

# Copy tệp cấu hình nginx của bạn vào bên trong container
COPY nginx.conf /etc/nginx/nginx.conf

# Tạo thư mục cho các site
RUN mkdir -p /etc/nginx/sites-enabled

# Expose cổng 80
EXPOSE 80

# Cài đặt các gói phụ thuộc cần thiết để cài đặt extension PHP và Composer
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Cài đặt các extension PHP
RUN docker-php-ext-install pdo pdo_mysql mysqli gd zip

# Khởi động nginx
CMD ["nginx", "-g", "daemon off;"]
