# Time Tracker

Приложение для отслеживания времени выполнения задач, разработанное на Flutter.

## Описание проекта

Time Tracker — мобильное приложение для управления временем работы над различными задачами. Позволяет отслеживать время, затраченное на каждую задачу, с возможностью паузы, возобновления и автоматического сохранения данных.

## Основной функционал

- Отслеживание времени для нескольких задач одновременно
- Запуск, пауза и остановка таймера
- Автоматическая пауза по расписанию (1, 15, 30, 45 минут)
- Автоматическое сохранение времени при выходе из приложения
- Сохранение накопленного времени для каждой задачи
- Адаптивный интерфейс для разных размеров экрана

## Используемые пакеты

### Основные зависимости

- **shared_preferences** (^2.2.2) — для локального хранения данных о времени выполнения задач
- **cupertino_icons** (^1.0.8) — набор иконок для iOS-стиля интерфейса

### Dev зависимости

- **flutter_launcher_icons** (^0.13.1) — для генерации иконок приложения для различных платформ
- **flutter_lints** (^6.0.0) — набор правил линтинга для обеспечения качества кода

## Реализованные возможности

1. **Система отслеживания времени** — сервис таймера с возможностью паузы и возобновления
2. **Сохранение данных** — автоматическое сохранение времени в SharedPreferences
3. **Обработка lifecycle событий** — сохранение текущего времени при выходе из приложения
4. **Диалог планирования паузы** — с прокруткой для удобного выбора времени
5. **Настройка иконки приложения** — генерация иконок для Android платформы
6. **Локализация названия** — отображение "Time Tracker" в Android-версии

## Установка и запуск

```bash
flutter pub get
flutter run
```

## Генерация иконок

Для генерации иконок приложения используйте:

```bash
dart run flutter_launcher_icons
```

---

# Time Tracker

A Flutter application for tracking time spent on tasks.

## Project Description

Time Tracker is a mobile application for managing time spent on various tasks. It allows you to track time spent on each task with pause, resume, and automatic data saving capabilities.

## Main Features

- Time tracking for multiple tasks simultaneously
- Start, pause, and stop timer functionality
- Scheduled automatic pause (1, 15, 30, 45 minutes)
- Automatic time saving when exiting the application
- Stored accumulated time for each task
- Adaptive interface for different screen sizes

## Used Packages

### Main Dependencies

- **shared_preferences** (^2.2.2) — for local storage of task time tracking data
- **cupertino_icons** (^1.0.8) — icon set for iOS-style interface

### Dev Dependencies

- **flutter_launcher_icons** (^0.13.1) — for generating application icons for various platforms
- **flutter_lints** (^6.0.0) — linting rules for code quality assurance

## Implemented Features

1. **Time tracking system** — timer service with pause and resume capabilities
2. **Data persistence** — automatic time saving to SharedPreferences
3. **Lifecycle event handling** — saving current time when exiting the application
4. **Scheduled pause dialog** — with scrolling for convenient time selection
5. **Application icon setup** — icon generation for Android platform
6. **Name localization** — "Time Tracker" display in Android version

## Installation and Running

```bash
flutter pub get
flutter run
```

## Icon Generation

To generate application icons, use:

```bash
dart run flutter_launcher_icons
```
