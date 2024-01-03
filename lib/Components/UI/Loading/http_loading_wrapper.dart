import 'package:app/models/http.dart';
import 'package:flutter/material.dart';

class HttpLoadingWrapper extends StatefulWidget {
  const HttpLoadingWrapper({
    super.key,
    required this.child,
    required this.httpRequest,
    this.informProvider,
  });
  final Widget child;
  final Function httpRequest;
  final Function? informProvider;

  @override
  State<HttpLoadingWrapper> createState() => _HttpLoadingWrapperState();
}

class _HttpLoadingWrapperState extends State<HttpLoadingWrapper> {
  HttpStates httpStatus = HttpStates.loading;

  Future<void> httpCall() async {
    try {
      final response = await widget.httpRequest();

      if (response.statusCode >= 400) {
        setState(() {
          httpStatus = HttpStates.error;
        });
      } else {
        setState(() {
          httpStatus = HttpStates.success;
        });
        widget.informProvider != null ? widget.informProvider!() : null;
      }
    } catch (e) {
      print(e);
      setState(() {
        httpStatus = HttpStates.exception;
      });
      // print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    // Make http request
    Future.delayed(Duration.zero, () {
      httpCall();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: httpStatus == HttpStates.loading
          ? const CircularProgressIndicator()
          : httpStatus == HttpStates.success
              ? widget.child
              : httpStatus == HttpStates.error
                  ? const Center(
                      child: Text("Error"),
                    )
                  : const Center(
                      child: Text("Exception"),
                    ),
    );
  }
}
