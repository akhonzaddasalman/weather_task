# Weather Application

## Overview

This Flutter application is a Weather Application that fetches and displays real-time weather data based on the 
user's current location or a user-specified location. It provides core features such as fetching weather data, 
utilizing a weather API (OpenWeatherMap), searching functionality, displaying weather data including location name, 
temperature, humidity, wind speed, and weather condition, and proper error handling. Additionally, it incorporates 
state management using Provider.

## Core Features

1. **Fetch Weather Data**: Utilizes OpenWeatherMap API to fetch real-time weather data.
2. **User's Current Location**: Automatically detects and uses the user's current location to fetch weather data.
3. **Search Functionality**: Allows users to search for weather data from a specified location.
4. **Display Weather Data**: Displays location name, temperature, humidity, wind speed, and weather condition.
5. **Error Handling**: Properly handles cases such as no internet connection and failure to fetch data from the API.

## Bonus Features

1. **5-day Weather Forecast Feature**: Provides a forecast for the next 5 days.
2. **Dark Mode/Light Mode Toggle Feature**: Allows users to switch between dark and light modes.
3. **Unit Tests**: Includes unit tests to ensure code reliability.

## Architecture

The application follows a clean architecture pattern, separating concerns into different layers:

- **Presentation Layer**: Contains UI components, widgets, and screens.
- **Domain Layer**: Contains business logic and entities.
- **Data Layer**: Handles data fetching, parsing, and caching.

## Technical Choices

- **State Management**: Utilized Provider for state management due to its simplicity and efficiency for small to medium-sized projects.
- **API Integration**: Chose OpenWeatherMap API for weather data due to its extensive coverage and reliability.
- **UI Design**: Followed Material Design principles for a clean and intuitive user interface.

## Running the App

To run the app:

1. Clone the repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. Connect a device or use an emulator.
5. Run `flutter run` to launch the app.

## Challenges Faced

- Integrating location services for fetching user's current location.
- Handling asynchronous operations and error states effectively.
- Implementing unit tests for complex functionalities.

## Contributors

- Salman Khan


