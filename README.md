# ABUTH Navigate 🏥📍

<div align="center">
  <img src="assets/images/ABUTH_SHIKA.jpg" alt="ABUTH Logo" width="200"/>
  <h3>Campus Navigation System for Ahmadu Bello University Teaching Hospital</h3>
</div>

## Overview

ABUTH Navigate is a comprehensive Flutter mobile application designed specifically for navigating the Ahmadu Bello University Teaching Hospital (ABUTH) campus in Shika, Nigeria. The app provides real-time navigation, location-based services, and user-friendly interface to help staff, patients, and visitors find their way around the hospital complex efficiently.

## ✨ Features

### 🗺️ Navigation & Maps
- **Interactive Google Maps Integration**: Real-time campus mapping with detailed building layouts
- **Turn-by-turn Navigation**: GPS-powered directions to any location within the campus
- **Location Search**: Find specific departments, wards, offices, and facilities
- **Offline Maps**: Continue navigating even without internet connectivity

### 🔐 User Authentication
- **Firebase Authentication**: Secure login system with multiple options
- **Google Sign-In**: Quick authentication using Google accounts
- **Apple Sign-In**: iOS integration for Apple users
- **Email/Password**: Traditional authentication method
- **Anonymous Access**: Browse basic information without registration

### 📱 User Interface
- **Intuitive Design**: Clean, medical-friendly interface design
- **Multi-language Support**: Available in English with potential for local language expansion
- **Dark/Light Mode**: Adaptive themes for better user experience
- **Accessibility**: Designed with accessibility guidelines in mind

### 🏢 Campus Features
- **Department Directory**: Complete listing of all hospital departments
- **Facility Locator**: Find parking, cafeterias, pharmacies, and other amenities
- **Emergency Services**: Quick access to emergency contact information
- **Visiting Hours**: Up-to-date information about visiting schedules

### 👥 Community Features
- **User Contributions**: Allow users to suggest location updates
- **Feedback System**: Report issues or suggest improvements
- **Profile Management**: Personal settings and preferences
- **History Tracking**: Keep track of frequently visited locations

## 📱 Screenshots

*Screenshots will be added once the app is fully functional*

## 🚀 Technology Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **Backend**: Firebase (Authentication, Firestore, Storage)
- **Maps**: Google Maps API
- **State Management**: Provider pattern
- **Architecture**: FlutterFlow generated with custom modifications

### 📦 Key Dependencies
```yaml
flutter: SDK
google_maps_flutter: ^2.2.6
firebase_auth: ^4.6.2
firebase_core: ^2.13.1
cloud_firestore: ^4.8.0
geolocator: ^10.1.0
google_sign_in: ^6.0.2
```

## 🛠️ Installation & Setup

### Prerequisites
- Flutter SDK (3.0.0 or later)
- Dart SDK (3.0.0 or later)
- Android Studio / Xcode for mobile development
- Firebase project setup
- Google Maps API key

### Steps

1. **Clone the repository**
```bash
git clone https://github.com/ameerulmumin/abuth-navigate.git
cd abuth-navigate
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Firebase Setup**
   - Create a Firebase project
   - Add Android/iOS apps to your Firebase project
   - Download and place `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Enable Authentication, Firestore, and Storage in Firebase Console

4. **Google Maps Setup**
   - Get a Google Maps API key from Google Cloud Console
   - Enable Maps SDK for Android and iOS
   - Add the API key to:
     - `android/app/src/main/AndroidManifest.xml`
     - `ios/Runner/AppDelegate.swift`

5. **Run the app**
```bash
# For Android
flutter run

# For iOS
flutter run -d ios

# For Web (limited functionality)
flutter run -d chrome
```

## 🔧 Configuration

### Firebase Configuration
Update the Firebase configuration in `lib/backend/firebase/firebase_config.dart` with your project credentials.

### Google Maps API
Add your Google Maps API key to the respective platform configurations.

## 🏗️ Project Structure

```
lib/
├── auth/                 # Authentication logic
├── backend/             # Firebase backend configuration
├── flutter_flow/        # FlutterFlow generated components
├── pages/              # Application screens
│   ├── home_page/      # Main navigation screen
│   ├── places/         # Places and locations
│   ├── profile/        # User profile management
│   └── more_details/   # Detailed location information
├── models/             # Data models
└── main.dart          # Application entry point
```

## 🤝 Contributing

We welcome contributions from the community! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue on GitHub
- Contact the development team at [ahmadsmaidamma@gmail.com](mailto:ahmadsmaidamma@gmail.com)

## 🙏 Acknowledgments

- Ahmadu Bello University Teaching Hospital for project inspiration
- FlutterFlow for the initial app structure
- Google Maps Platform for mapping services
- Firebase for backend services
- The Flutter community for continuous support

## 📊 Project Status

**Current Version**: 1.0.0  
**Status**: In Development  
**Platform Support**: Android, iOS, Web (Limited)

---

<div align="center">
  <p>Built with ❤️ for the ABUTH community</p>
  <p>© 2023-2024 ABUTH Navigate Team</p>
</div>
