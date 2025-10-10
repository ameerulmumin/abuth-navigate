# ABUTH Navigate Configuration Reference

## 🔧 Current Configuration

### Firebase Project Details
- **Project ID**: `abuth-navigate-me`
- **Project Number**: `993316165292`
- **Storage Bucket**: `abuth-navigate-me.appspot.com`
- **Auth Domain**: `abuth-navigate-me.firebaseapp.com`

### Application Package Names
- **Android**: `com.mycompany.abuthnavigate`
- **iOS**: `com.mycompany.abuthnavigate`

### Google Maps API Keys
- **Android**: `AIzaSyBeBTVvMhOPReV83q6mu0xyMAJGKs3-w78`
- **iOS**: `AIzaSyApzJee_0zk0GvKrzUa_P7VPPQnc7iuzbw`
- **Web**: `AIzaSyB7AEXLsJlEsDKRaHyQd2mQ_7s6loOkwSY`

## 📁 Configuration Files Location

```
📦 ABUTH Navigate
├── 🔥 Firebase Configuration
│   ├── android/app/google-services.json
│   ├── ios/Runner/GoogleService-Info.plist
│   └── lib/backend/firebase/firebase_config.dart
│
├── 🗺️ Google Maps Configuration
│   ├── android/app/src/main/AndroidManifest.xml (line 58)
│   └── ios/Runner/AppDelegate.swift (line 12)
│
└── 📱 App Configuration
    ├── pubspec.yaml (dependencies)
    └── android/app/build.gradle (build config)
```

## 🚀 Quick Setup Commands

### For Development (Using Existing Config)
```bash
git clone https://github.com/ameerulmumin/abuth-navigate.git
cd abuth-navigate
flutter pub get
flutter run
```

### For Production (Your Own Firebase/Maps)
```bash
# 1. Set up Firebase project at https://console.firebase.google.com/
# 2. Set up Google Maps API at https://console.cloud.google.com/
# 3. Replace configuration files:

# Android Firebase
cp your-google-services.json android/app/

# iOS Firebase  
cp your-GoogleService-Info.plist ios/Runner/

# Update API keys in:
# - android/app/src/main/AndroidManifest.xml
# - ios/Runner/AppDelegate.swift
# - lib/backend/firebase/firebase_config.dart
```

## 🔐 Security Notes

⚠️ **For Production:**
- Replace all API keys with your own
- Restrict API keys to your app's package/bundle ID
- Use Firebase Security Rules for Firestore
- Enable App Check for additional security

✅ **Current Setup:**
- API keys are configured for development/testing
- Firebase project allows test mode access
- No additional security restrictions applied

## 🌍 Deployment Environments

| Environment | Firebase Project | Status |
|-------------|------------------|---------|
| Development | `abuth-navigate-me` | ✅ Active |
| Staging | TBD | ⏳ Pending |
| Production | TBD | ⏳ Pending |

## 📞 Support

For configuration issues:
- Check Firebase Console: https://console.firebase.google.com/project/abuth-navigate-me
- Check Google Cloud Console: https://console.cloud.google.com/
- GitHub Issues: https://github.com/ameerulmumin/abuth-navigate/issues

---
*Last updated: October 2025*