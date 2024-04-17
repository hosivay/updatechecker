import 'dart:convert'; 
import 'package:http/http.dart' as http; 

class UpdaterMaster {
  /// example repo : https://github.com/hosivay/blackbird
  /// //
  /// example version : v1.0.0
  Future<bool> withgithub(
      {required String repo,
      required String version,
      bool printdebug = true}) async {

  
 
    String userName;
    String repositoryName;
    List<String> parts = repo.split('/');
    if (parts.length >= 4) {
      userName = parts[3];
      repositoryName = parts[4];
    } else {
      userName = "";
      repositoryName = "";
    }

    var url = Uri.parse(
        'https://api.github.com/repos/$userName/$repositoryName/releases/latest');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var releaseInfo = json.decode(response.body);
      var latestVersion = releaseInfo['tag_name'];

      if (latestVersion.compareTo(version) > 0) {
        printdebug
            ? print(
                " *** UpdateChecker : A new version is available $latestVersion")
            : null;
        return true;
      } else {
        printdebug
            ? print(" *** UpdateChecker : The version is updated.")
            : null;
        return false;
      }
    } else {
      printdebug ? print(' *** UpdateChecker : ERROR ') : null;
      return false;
    }
  }
}
