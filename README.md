# ISS Tracker - Flutter App

## Overview
This Flutter app fetches real-time data about the International Space Station (ISS) from an open API and displays it on the screen. It includes:
- Firebase anonymous sign-in.
- Real-time ISS location data with auto-refresh every minute.
- Manual refresh button.
- Bonus features (e.g., special message when ISS is above the user's country).

## Features
- **Login Screen**: Automatically signs in the user anonymously using Firebase.
- **Home Screen**:
  - Displays the latitude and longitude of the ISS.
  - Shows the UTC and local time of the last update.
  - Displays the country or region the ISS is currently above.
  - Auto-updates data every minute with a countdown timer.
  - Includes a manual refresh button.
- **Bonus**:
  - Shows a special message if the ISS is above the user's country.

## Prerequisites
- Flutter 3.24.5
- Firebase project with anonymous sign-in enabled. [or use provided config]

## Setup
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/krzshipon/iss-tracker.git
   cd iss-tracker
   code .
   ```

2. **Install Dependencies**:
   ```bash
    flutter pub get
   ```
3. **Run the App**:
   ```bash
    flutter run
   ```

## APK
The APK file is located in the dist folder. You can install it on an Android device using adb:
 ```bash
    adb install -r dist/app-release.apk
```


## Project Architecture
The project follows a clean and modular architecture with clear separation of concerns:

### Layers
1. **Data Layer**:
   - **Repository**: Handles data fetching from APIs and Firebase.
   - **Services**: Implements API calls, Firebase authentication, and location services.
   - **Models**: Defines data structures for API responses and domain models.

2. **Domain Layer**:
   - Contains business logic and use cases.
   - Defines abstract interfaces for repositories.

3. **Presentation Layer**:
   - **Views**: UI screens (e.g., `AuthView`, `HomeView`).
   - **ViewModels**: Manages state and logic for the views using Riverpod.


### Directory Structure
```
lib/
├── config/                  # App configuration (theme, assets, etc.)
├── data/                    # Data layer (repositories, services, models)
├── domain/                  # Domain layer (business logic, models)
├── provider/                # Riverpod providers
├── routing/                 # App routing and navigation
├── ui/                      # Presentation layer (views, view models)
└── util/                    # Utilities (logging, extensions)
```

## Dependencies
- **Firebase**: For anonymous authentication.
- **Dio**: For making HTTP requests to the ISS API.
- **Riverpod**: For state management.
- **Geolocator**: For determining the user's country.
- **Intl**: For date and time formatting.

## Testing
To run the tests, use the following command:
```bash
flutter test
```

## Bonus Features
- State management using **Riverpod**.
- Special message when the ISS is above the user's country.
- **Dio** package for HTTP requests.
- Clean and modular directory structure.

## Troubleshooting
- **Build Errors**: Ensure all dependencies are installed and Firebase is properly configured.
- **APK Installation**: Make sure USB debugging is enabled on your Android device.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.