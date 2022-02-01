import 'package:flutter/material.dart';
import 'package:qr_scanner_app/models/scan_model.dart';
import 'package:qr_scanner_app/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];
  String typeSelected = 'http';

  newScan(String value) async{
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;
    if(typeSelected == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  loadScans() async{
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  loadScansByType(String type) async{
    final myScans = await DBProvider.db.getScanByType(type);
    scans = [...?myScans];
    typeSelected = type;
    notifyListeners();
  }

  deleteAll() async{
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScansById(int id) async{
    await DBProvider.db.deleteScan(id);
    loadScansByType(typeSelected);
  }

}