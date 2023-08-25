# Используйте базовый образ Python для Django
FROM python:3.x

# Установите переменную окружения для отключения режима буферизации вывода
ENV PYTHONUNBUFFERED 1

# Установите рабочую директорию внутри контейнера
WORKDIR /app

# Копируйте файлы зависимостей и установите их
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Копируйте весь проект в рабочую директорию
COPY . /app/

# Сделайте скрипт entrypoint.sh исполняемым
RUN chmod +x /app/entrypoint.sh

# Запустите entrypoint.sh при запуске контейнера
ENTRYPOINT ["/app/entrypoint.sh"]
