import 'dart:convert';
import 'package:app/Components/cache/manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Cache class to store data and timestamp
class CacheItem<T> {
  final T data;
  final DateTime timestamp;

  CacheItem(this.data) : timestamp = DateTime.now();
}

// List of URLs to be cached. Every widget that need to call an
// api that will not change result will populate this ist
List<String> cachableUrls = [];

// Cache Map
Map<String, CacheItem<dynamic>> cache = {};

Future<dynamic> httpGet<T>(String url, Map<String, String>? headers,
    {bool forceRefresh = false}) async {
  try {
    // Check if the URL should be cached
    bool shouldCache = cachableUrls.contains(url);

    String responseBody;

    if (shouldCache && !forceRefresh) {
      // Try to get from cache first
      try {
        responseBody = await CustomCacheManager().getSingleFile(url);
        return json.decode(responseBody);
      } catch (e) {
        print("Cache miss: $e");
      }
    }

    // If not in cache or not cachable, perform HTTP GET

    print("API called");
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      responseBody = response.body;
      return json.decode(responseBody);
    } else {
      throw Exception('Failed to fetch data');
    }
  } catch (e) {
    print(e.toString());
    return null;
  }
}
