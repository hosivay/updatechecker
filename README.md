# UpdaterMaster

 Developed with 💙 by [Hossein Valipour (Hosivay)](https://hosivay.github.io/)
 
[![Version](https://img.shields.io/pub/v/updatermaster)](https://pub.dev/packages/updatermaster)
[![Star](https://img.shields.io/github/stars/hosivay/updatermaster)](https://github.com/hosivay/updatermaster)
---
A package to check the new version of the application.

## Platform Support

| Android |  iOS  | MacOS |  Web  | Linux | Windows |
| :-----: | :---: | :---: | :---: | :---: | :-----: |
|✅|✅|✅|✅|✅|✅|

 ## Getting started

 Add `updatermaster` as a dependency in your `pubspec.yaml`:

 ```yaml
 dependencies:
    updatermaster: ^0.0.2
 ```

 Update your packages with `flutter pub get`.

## Usage
Check Update with github :

You can use UpdateChecker to query information about the new version of the program from the GitHub repository.

```dart
import 'package:updatermaster/updatermaster.dart';

...

  Future<bool>? _checker;

  @override
  void initState() {
    _checker = UpdaterMaster.withGithub(
      repo: "https://github.com/username/repo",
      version: "v1.3.0" //The current version of your program 
    );
    super.initState();
  }


...

FutureBuilder(
        future: _checker,
        builder: (context, snapshot) {
        if (snapshot.data == true) {
          return const Text("new version is available");
        } else {
            return const Text("The version is updated");
        }
    },
),

```
