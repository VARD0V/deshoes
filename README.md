<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

## О проекте
ДЕ2026

## Предварительные требования
- PHP 8.2 или выше
- Composer
- MySQL 8.0 или выше (или другая поддерживаемая СУБД)
- Git

## Установка
1. **Клонируйте репозиторий**
   ```bash
   git clone https://github.com/ваш-username/ваш-проект.git
   cd ваш-проект
2. **Настройте файл окружения**
   ```bash
   gcp .env.example .env
3. **Отредактируйте файл .env, указав ваши настройки:**
   ```bash
   DB_CONNECTION=mysql
    DB_HOST=127.127.126.1
    DB_PORT=3306
    DB_DATABASE=deshoes
    DB_USERNAME=root
    DB_PASSWORD=
    SESSION_DRIVER=file
4. **Установите зависимости Composer**
   ```bash
    composer update
5. **Сгенерируйте ключ приложения**
   ```bash
    php artisan key:generate
6. **Настройте хранилище (storage)**
   ```bash
    php artisan storage:link
