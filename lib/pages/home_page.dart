import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/floating_actionbutton.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<ScanListProvider>(context, listen: false).borrarTodos();
            }, 
            icon: Icon(Icons.delete_forever)
          )
        ],
      ),


      body: _HomePageBody(),


      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: FloattingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    //Usar el scanListProvider

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch(currentIndex){
      case 0: 
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1: 
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();

      default: 
        return MapasPage();
    }
  }
}