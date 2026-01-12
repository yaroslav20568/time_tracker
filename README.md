# Time Tracker

Приложение для отслеживания времени выполнения задач.

## Описание проекта

Time Tracker - это мобильное приложение на Flutter для отслеживания времени работы над различными задачами. Приложение позволяет пользователям запускать таймер для задач, ставить на паузу, возобновлять отслеживание и автоматически сохранять накопленное время.

## Что было сделано

- Создана структура проекта с разделением на экраны, виджеты, модели, сервисы и константы
- Реализован основной экран с отображением списка задач в виде сетки
- Создана система отслеживания времени с таймером, поддерживающая запуск, паузу и возобновление
- Реализовано автоматическое сохранение времени при выходе из приложения через обработку lifecycle событий
- Добавлен диалог планирования паузы с возможностью выбора времени (1, 15, 30, 45 минут) и прокруткой
- Созданы переиспользуемые виджеты: карточки задач, кнопки управления, отображение таймера
- Настроены цвета приложения в отдельном файле констант
- Реализовано сохранение данных о времени выполнения задач в SharedPreferences
- Адаптирован интерфейс для разных размеров экрана с адаптивной сеткой
- Добавлена иконка приложения для Android
- Настроено название приложения "Time Tracker" для Android

## Используемые пакеты

- `flutter` - основной фреймворк
- `shared_preferences` - локальное хранение данных
- `cupertino_icons` - иконки для iOS стиля
- `flutter_lints` - линтеры для проверки кода
- `flutter_launcher_icons` - генерация иконок приложения (dev dependency)

## Архитектура

Проект следует принципам SOLID и KISS. Код организован в следующие директории:

- `lib/screens/` - экраны приложения
- `lib/widgets/` - переиспользуемые виджеты (карточки задач, кнопки, таймер)
- `lib/models/` - модели данных (Task)
- `lib/services/` - бизнес-логика (TimerService, TaskService, StorageService)
- `lib/constants/` - константы (цвета, список задач)

---

# Time Tracker

A mobile application for tracking time spent on tasks.

## Project Description

Time Tracker is a Flutter mobile application for tracking time spent on various tasks. The application allows users to start a timer for tasks, pause, resume tracking, and automatically save accumulated time.

## What Was Done

- Created project structure with separation into screens, widgets, models, services, and constants
- Implemented main screen with task list displayed as a grid
- Created time tracking system with timer supporting start, pause, and resume
- Implemented automatic time saving when exiting the application through lifecycle event handling
- Added scheduled pause dialog with time selection options (1, 15, 30, 45 minutes) and scrolling
- Created reusable widgets: task cards, control buttons, timer display
- Configured application colors in a separate constants file
- Implemented data persistence for task time tracking in SharedPreferences
- Adapted interface for different screen sizes with adaptive grid
- Added application icon for Android
- Configured application name "Time Tracker" for Android

## Used Packages

- `flutter` - main framework
- `shared_preferences` - local data storage
- `cupertino_icons` - icons for iOS style
- `flutter_lints` - linters for code checking
- `flutter_launcher_icons` - application icon generation (dev dependency)

## Architecture

The project follows SOLID and KISS principles. Code is organized into the following directories:

- `lib/screens/` - application screens
- `lib/widgets/` - reusable widgets (task cards, buttons, timer)
- `lib/models/` - data models (Task)
- `lib/services/` - business logic (TimerService, TaskService, StorageService)
- `lib/constants/` - constants (colors, task list)
