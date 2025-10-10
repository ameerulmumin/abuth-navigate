# ABUTH Navigate 🏥📍

<div align="center">
  <img src="assets/images/ABUTH_SHIKA.jpg" alt="ABUTH Logo" width="200"/>
  <h3>Navigation System for Ahmadu Bello University Teaching Hospital</h3>
</div>

## Overview

ABUTH Navigate is a comprehensive Flutter mobile application designed specifically for navigating the Ahmadu Bello University Teaching Hospital (ABUTH) in Shika, Nigeria. The app provides real-time navigation, location-based services, and user-friendly interface to help staff, patients, and visitors find their way around the hospital complex efficiently.

## ✨ Features

### 🗺️ Navigation & Maps
- **Interactive Google Maps Integration**: Real-time mapping with detailed building layouts
- **Turn-by-turn Navigation**: GPS-powered directions to any location within the hospital 
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
- Firebase project (for authentication and database)
- Google Maps API key (for navigation features)

### Quick Start

1. **Clone the repository**
```bash
git clone https://github.com/ameerulmumin/abuth-navigate.git
cd abuth-navigate
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run with existing configuration**
```bash
# The project includes sample Firebase and Google Maps configuration
# For development/testing purposes, you can run directly:
flutter run
```

### Production Setup

For production deployment, you'll need to set up your own Firebase project and Google Maps API:

#### 🔥 Firebase Configuration

The project includes sample Firebase configuration files:
- `android/app/google-services.json` (Android Firebase config)
- `ios/Runner/GoogleService-Info.plist` (iOS Firebase config)
- `lib/backend/firebase/firebase_config.dart` (App configuration)

**To set up your own Firebase:**

1. **Create Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project: `abuth-navigate-[your-suffix]`
   - Enable Google Analytics (optional)

2. **Add Android App**
   - Click "Add app" → Android
   - Package name: `com.mycompany.abuthnavigate`
   - Download `google-services.json`
   - Replace `android/app/google-services.json`

3. **Add iOS App**
   - Click "Add app" → iOS
   - Bundle ID: `com.mycompany.abuthnavigate`
   - Download `GoogleService-Info.plist`
   - Replace `ios/Runner/GoogleService-Info.plist`

4. **Enable Firebase Services**
   ```
   Authentication → Sign-in method:
   - ✅ Email/Password
   - ✅ Google
   - ✅ Apple (for iOS)
   - ✅ Anonymous
   
   Firestore Database:
   - ✅ Create database (Start in test mode)
   
   Storage:
   - ✅ Create default bucket
   ```

5. **Update Configuration**
   - Update `lib/backend/firebase/firebase_config.dart` with your project credentials

#### 🗺️ Google Maps Setup

The project includes sample Google Maps API keys:
- **Android**: In `android/app/src/main/AndroidManifest.xml` (line 58)
- **iOS**: In `ios/Runner/AppDelegate.swift` (line 12)

**To set up your own Google Maps API:**

1. **Get API Key**
   - Go to [Google Cloud Console](https://console.cloud.google.com/)
   - Create/select project
   - Enable APIs:
     - Maps SDK for Android
     - Maps SDK for iOS
     - Places API
     - Directions API
   - Create API Key

2. **Configure API Key**
   
   **Android** (`android/app/src/main/AndroidManifest.xml`):
   ```xml
   <meta-data 
       android:name="com.google.android.geo.API_KEY" 
       android:value="YOUR_ANDROID_API_KEY_HERE"/>
   ```
   
   **iOS** (`ios/Runner/AppDelegate.swift`):
   ```swift
   GMSServices.provideAPIKey("YOUR_IOS_API_KEY_HERE")
   ```

3. **Restrict API Key** (Recommended)
   - Android: Restrict to your app's SHA-1 fingerprint
   - iOS: Restrict to your app's Bundle ID

### 🚀 Running the App

```bash
# Check Flutter installation
flutter doctor

# Get dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Build for specific platforms
flutter build apk              # Android APK
flutter build ios              # iOS (requires Xcode)
flutter build web              # Web version
```

### 📱 Platform-Specific Setup

**Android:**
- Minimum SDK: API 21 (Android 5.0)
- Target SDK: API 34
- Requires location permissions for navigation

**iOS:**
- Minimum iOS: 12.0
- Requires location usage description in `Info.plist`
- Requires Xcode 14+ for building

**Web:**
- Limited Google Maps functionality
- Firebase Auth works with web
- Best for admin/dashboard features

## 🔧 Configuration Details

### 🔥 Firebase Configuration Files

**Current Configuration:**
- **Project ID**: `abuth-navigate-me`
- **Android Package**: `com.mycompany.abuthnavigate`
- **iOS Bundle ID**: `com.mycompany.abuthnavigate`

**Configuration Files:**
```
📁 Firebase Config Files
├── android/app/google-services.json           # Android Firebase config
├── ios/Runner/GoogleService-Info.plist        # iOS Firebase config
└── lib/backend/firebase/firebase_config.dart  # Flutter Firebase config
```

**Firebase Services Configured:**
- ✅ Authentication (Email, Google, Apple, Anonymous)
- ✅ Cloud Firestore (Database)
- ✅ Firebase Storage (File storage)
- ✅ Firebase Performance Monitoring

### 🗺️ Google Maps API Configuration

**Current API Keys:**
- **Android**: `AIzaSyBeBTVvMhOPReV83q6mu0xyMAJGKs3-w78`
- **iOS**: `AIzaSyApzJee_0zk0GvKrzUa_P7VPPQnc7iuzbw`

**Configuration Locations:**
```xml
<!-- Android: android/app/src/main/AndroidManifest.xml -->
<meta-data 
    android:name="com.google.android.geo.API_KEY" 
    android:value="AIzaSyBeBTVvMhOPReV83q6mu0xyMAJGKs3-w78"/>
```

```swift
// iOS: ios/Runner/AppDelegate.swift
GMSServices.provideAPIKey("AIzaSyApzJee_0zk0GvKrzUa_P7VPPQnc7iuzbw")
```

**Required Google APIs:**
- Maps SDK for Android
- Maps SDK for iOS  
- Places API (for location search)
- Directions API (for navigation)
- Geocoding API (for address lookup)

### 📱 Package Configuration

**Application ID:**
- Android: `com.mycompany.abuthnavigate`
- iOS: `com.mycompany.abuthnavigate`

**Deep Linking:**
- Scheme: `abuthnavigate`
- Host: `abuthnavigate.com`

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
