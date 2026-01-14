# Используем Ubuntu 22.04 как базовый образ для Linux x86-64
FROM --platform=linux/amd64 ubuntu:22.04

# Установка необходимых пакетов
RUN apt-get update && apt-get install -y \
    gcc \
    clang \
    make \
    apache2-utils \
    netcat \
    && rm -rf /var/lib/apt/lists/*

# Создание рабочей директории
WORKDIR /app

# Копирование исходников
COPY . .

# Сборка проекта
RUN make clean && make compile

# По умолчанию запускаем тесты
CMD ["./build/bin/app"]
