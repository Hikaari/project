#!/bin/sh

# Примените миграции
python manage.py migrate

# Создайте суперпользователя (администратора) Django
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@example.com', 'password')" | python manage.py shell

# Запустите Gunicorn для Django
gunicorn project.wsgi:application --bind 0.0.0.0:8000
