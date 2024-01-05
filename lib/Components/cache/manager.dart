import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager {
  static const cacheKey = "customCacheKey";

  static final CustomCacheManager _instance = CustomCacheManager._internal();

  factory CustomCacheManager() {
    return _instance;
  }

  CustomCacheManager._internal();

  Future<String> getSingleFile(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    return file.readAsString();
  }

  Future<bool> emptyCache() async {
    try {
      await DefaultCacheManager().emptyCache();
      return true;
    } catch (e) {
      return false;
    }
  }
}
