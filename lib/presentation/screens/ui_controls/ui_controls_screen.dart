import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation =
      Transportation.car; // Definimos un transporte por default
  
  bool wantsBreakfast =false;
  bool wantsLunch = false;
  bool wantsDinner = false;


  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) {
              setState(() {
                isDeveloper = !isDeveloper;
              });
            }),
        ExpansionTile(
          title: const Text('Vehiculos de transporte'),
          subtitle: Text(
              'Selecciona un medio de transporte : $selectedTransportation'),
          children: [
            // Aqui hacemos todo un grupo
            RadioListTile(
                value: Transportation.car,
                title: const Text('Car'),
                subtitle: const Text('Viajar en tierra'),
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.car;
                  });
                }),

            RadioListTile(
                value: Transportation.boat,
                title: const Text('Boat'),
                subtitle: const Text('Viajar sobre agua'),
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.boat;
                  });
                }),

            RadioListTile(
                value: Transportation.plane,
                title: const Text('Plane'),
                subtitle: const Text('Viajar en aire'),
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.plane;
                  });
                }),

            RadioListTile(
                value: Transportation.submarine,
                title: const Text('Submarine'),
                subtitle: const Text('Viajar bajo el agua'),
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.submarine;
                  });
                })
          ],
        ),
      

        CheckboxListTile(
          value: wantsBreakfast, 
          title:const Text('Incluir desayuno'),
          onChanged: (value){
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          }
        ),
         CheckboxListTile(
          value: wantsLunch, 
          title:const Text('Incluir almuerzo'),
          onChanged: (value){
            setState(() {
              wantsLunch = !wantsLunch;
            });
          }
        ),
         CheckboxListTile(
          value: wantsDinner, 
          title:const Text('Incluir cena'),
          onChanged: (value){
            setState(() {
              wantsDinner = !wantsDinner;
            });
          }
        )

      
      ],
    );
  }
}
