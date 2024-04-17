# UpdaterMaster
 
A package to check the new version of the application.

## Platform Support

| Android |  iOS  | MacOS |  Web  | Linux | Windows |
| :-----: | :---: | :---: | :---: | :---: | :-----: |
|✅|✅|✅|✅|✅|✅|

## Usage

You can use UpdateChecker to query information about the new version of the application.

```dart
import 'package:updatermaster/update/updatermaster.dart';

...

  Future<bool>? _checker;

  @override
  void initState() {
    _checker = UpdaterMaster().withgithub(
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
