import 'package:flutter/material.dart';
import 'package:qr_scanner_app/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  final String _url = scan.value;

  if(scan.type == 'http'){
    if (!await launch(_url)) throw 'Could not launch $_url';
  }else{
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}