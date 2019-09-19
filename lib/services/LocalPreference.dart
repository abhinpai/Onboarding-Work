import 'package:shared_preferences/shared_preferences.dart';

class LocalPreference {


   setSiteId(String siteId)  async{
      final prefs = await
      SharedPreferences.getInstance() ;
    prefs.setString('siteId', siteId);
  }

   Future<String> get getSiteId async {
    final prefs = await
      SharedPreferences.getInstance() ;
      String id =prefs.getString('siteId');
    return id;
  }

  removePrefData() async {
    SharedPreferences prefs = await
      SharedPreferences.getInstance() ;
    prefs.remove('siteId');
  }
}
