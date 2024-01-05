import 'package:app/Components/cache/manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/models/http.dart'; // Assicurati che questo import sia corretto

class HttpLoadingWrapper<T> extends ConsumerStatefulWidget {
  const HttpLoadingWrapper({
    super.key,
    required this.url,
    this.headers,
    required this.providerFun,
    required this.child,
    required this.fromJson,
  });

  final String url;
  final Map<String, String>? headers;
  final void Function(T?) providerFun;
  final Widget child;
  final T Function(Map<String, dynamic>) fromJson;

  @override
  ConsumerState<HttpLoadingWrapper<T>> createState() =>
      _HttpLoadingWrapperState<T>();
}

class _HttpLoadingWrapperState<T> extends ConsumerState<HttpLoadingWrapper<T>> {
  late Future<T?> fetchData;

  @override
  void initState() {
    super.initState();
    fetchData = fetchApiData();
  }

  Future<T?> fetchApiData({bool forceRefresh = false}) async {
    try {
      var data =
          await httpGet(widget.url, widget.headers, forceRefresh: forceRefresh);
      T convertedData = widget.fromJson(data);
      widget.providerFun(convertedData);
      return convertedData;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> refreshData() async {
    await CustomCacheManager().emptyCache();
    setState(() {
      fetchData = fetchApiData(forceRefresh: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T?>(
      future: fetchData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          return RefreshIndicator(onRefresh: refreshData, child: widget.child);
        } else {
          return const Center(child: Text("No data available"));
        }
      },
    );
  }
}
