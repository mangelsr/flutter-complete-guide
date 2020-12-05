import 'package:flutter/material.dart';

import 'package:qr_scanner_app/src/bloc/scans_bloc.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';
import 'package:qr_scanner_app/src/utils/utils.dart' as utils; 

class MapsPage extends StatelessWidget {
  final ScansBloc scansBloc = ScansBloc();

  @override
  Widget build(BuildContext context) {
    scansBloc.getScans();
    return StreamBuilder(
      stream: scansBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (snapshot.hasData) {
          final scans = snapshot.data;
          if (scans.length == 0) {
            return Center(
              child: Text('No data'),
            );
          }
          return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (DismissDirection direction) {
                  scansBloc.deleteScan(scans[index].id);
                },
                background: Container(
                  color: Colors.red,
                ),
                child: ListTile(
                  onTap: () {
                    utils.openScan(context, scans[index]);
                  },
                  leading: Icon(
                    Icons.map,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(scans[index].value),
                  subtitle: Text('ID: ${scans[index].id}'),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
