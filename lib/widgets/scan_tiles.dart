import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({
    required this.tipo
  });

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (_ , i)=> Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direccion){
          Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scanListProvider.scans[i].id!);
        },
        child: ListTile(
          leading: Icon( this.tipo == 'http' ? Icons.home : Icons.streetview, color: Theme.of(context).primaryColor),
          title: Text(scanListProvider.scans[i].valor),
          subtitle: Text(scanListProvider.scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
          onTap: () => lauchURL(context, scanListProvider.scans[i]),
        ),
      )
    );
  }
}