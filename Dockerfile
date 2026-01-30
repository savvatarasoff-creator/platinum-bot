# Dockerfile
FROM python:3.11-slim

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    gcc \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Создаем рабочую директорию
WORKDIR /app

# Копируем файлы
COPY . .

# Устанавливаем Python зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Создаем папку для данных
RUN mkdir -p bot_data

# Запускаем бота
CMD ["python", "bot.py"]