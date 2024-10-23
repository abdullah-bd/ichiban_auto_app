# ichiban_auto

A tool for managing your car service.

## Getting Started

### Prerequisites

Ensure you have the following installed on your machine:

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- Android Studio: [Install Android Studio](https://developer.android.com/studio)
- Xcode (for iOS development): [Install Xcode](https://developer.apple.com/xcode/)

### Installation

1. **Clone the repository:**


2. Install dependencies:  
flutter pub get


3. Configure Firebase: (Already have my own Firebase configuration)
Follow the instructions to set up Firebase for your Flutter app: Add Firebase to your Flutter app
Add the google-services.json file to the android/app directory.
Add the GoogleService-Info.plist file to the ios/Runner directory.

### Running the App
1. Run on Android:  
flutter run

2. Run on iOS:
flutter run

### Libraries Used
- flutter_screenutil: For responsive UI design.
- flutter_easyloading: For easy loading indicators.
- awesome_snackbar_content: For custom snackbars.
- firebase_core: For Firebase core functionalities.
- firebase_auth: For Firebase authentication.
- firebase_database: For Firebase real-time database.
- syncfusion_flutter_calendar: For calendar functionalities.
- intl: For internationalization and localization.
- dropdown_search: For searchable dropdowns.


## Special Instructions
Ensure you have configured Firebase correctly by adding the necessary configuration files (google-services.json and GoogleService-Info.plist).
If you encounter any issues with dependencies, run flutter pub cache repair to clear the pub cache and reinstall dependencies.