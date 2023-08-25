# Используйте образ Nginx
FROM nginx:latest

# Копируйте файл конфигурации Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Копируйте статические файлы
COPY data /usr/share/nginx/html

# Откройте порт 80
EXPOSE 80
