# Используйте базовый образ с Linux
FROM ubuntu:latest

# Отключите запросы на интерактивные действия
ENV DEBIAN_FRONTEND=noninteractiveТЫ

# Обновите пакеты внутри образа
RUN apt-get update && apt-get upgrade -y

# Установите необходимые пакеты (Python, PostgreSQL, nginx и т.д.)
RUN apt-get install -y python3 python3-pip postgresql postgresql-contrib nginx libpq-dev

# Создайте директорию для проекта
RUN mkdir /app

# Скопируйте файлы проекта внутрь контейнера
COPY . /app

# Установите зависимости Python
RUN pip3 install -r /app/requirements.txt

# Запустите PostgreSQL и настройте базу данных
RUN service postgresql start && su - postgres -c "psql -c 'CREATE DATABASE mydatabase;'"

# Пропишите настройки nginx
RUN ln -s /app/nginx.conf /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

# Откройте порты
EXPOSE 8000
EXPOSE 80
EXPOSE 5432

# Запустите Gunicorn и nginx при старте контейнера
CMD service postgresql start && gunicorn docker-compose-main.wsgi:application --bind 0.0.0.0:8000 && nginx -g "daemon off;"

