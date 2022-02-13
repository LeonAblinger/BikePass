import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final g_Language = 0; // EN=0, DE=1
DateTime? g_SelectedDate = DateTime.now();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BikePass',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const Bike(),
    );
  }
}

class _BikeState extends State<Bike> {
  void _pushAddBike() {
    List<String> _title = ['Add new bike', 'Neues Rad hinzufügen'];

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_title[g_Language]),
            ),
            body: _addBikeLayout(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Text('Save'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      )
    );
  }

  void _pushSettings() {
    List<String> _title = ['Settings', 'Einstellungen'];

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_title[g_Language]),
            ),
            body: _settingsLayout(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Text('Save'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> _tooltip = ['Settings', 'Einstellungen'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BikePass'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _pushSettings,
            icon: const Icon(Icons.list),
            tooltip: _tooltip[g_Language],
          ),
        ],
      ),
      body: _homeLayout(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushAddBike,
        child: const Text('+'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Widget _homeLayout() {
    return const Text('blabla');
  }

  Widget _settingsLayout() {
    return Container();
  }

  Widget _addBikeLayout() {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _addBikeLayoutContactInfo(),
              const Divider(height: 40, thickness: 2),
              _addBikeLayoutBikeInfo(),
              const Divider(height: 40, thickness: 2),
              _addBikeLayoutDealerInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addBikeLayoutContactInfo() {
    const List<List<String>> _fieldNames = [
      ['Contact information', 'Name', 'Surname', 'Address', 'Telephone', 'E-Mail'], // EN
      ['Kontaktinformationen', 'Vorname', 'Nachname', 'Adresse', 'Telefonnummer', 'E-Mail'] // DE
    ];
    List<Widget> _fieldWidgets = <Widget>[];

    // Add head title
    _fieldWidgets.add(
      Text(_fieldNames[g_Language][0], style: const TextStyle(fontSize: 20), textAlign: TextAlign.left)
    );

    // Add form fields with spacer
    for (int i = 1; i < _fieldNames[g_Language].length; i++) {
      _fieldWidgets.add(
        const SizedBox(
          height: 10
        ),
      );

      _fieldWidgets.add(
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: _fieldNames[g_Language][i],
          ),
          onChanged: (text) {}
        )
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _fieldWidgets,
      )
    );
  }

  Widget _addBikeLayoutBikeInfo() {
    const List<List<String>> _fieldNames = [
      ['Bike information', 'Name (for in-app displaying)', 'Make & Model', 'Registration Number', 'Registration Number of Battery (E-Bike / E-Scooter)', 'Frame Size, Material & Color',
      'Rim size', 'Fender', 'Gear box - Make & Model', 'Gear box - Type & Count of Gears', 'E-Bike-Engine - Make & Model',
      'E-Bike-Engine - Position (front, middle, back)', 'Seat - Type & Color', 'Handlebar - Type & Color', 'Suspension - Type (front, frame)',
      'Lights', 'Speedometer', 'Accessories', 'Special features, stickers or damages'], // EN
      ['Radinformation', 'Name (für Anzeige in der App)', 'Marke & Modell', 'Registriernummer', 'Akkunummer (E-Bike / E-Scooter)', 'Rahmengröße, Material & Farbe', 'Reifengröße',
      'Kotflügel', 'Gangschaltung - Marke & Modell', 'Art der Schaltung & Anzahl der Gänge', 'E-Bike-Antrieb - Marke & Modell',
      'E-Bike-Antrieb - Position (vorne, mittig, hinten)', 'Sattel - Art & Farbe', 'Lenker - Art & Farbe', 'Federung - Art (Gabel, Rahmen)',
      'Beleuchtung', 'Tachometer', 'Zubehör', 'Besondere Kennzeichen, Aufkleber oder Beschädigungen'] // DE
    ];
    List<Widget> _fieldWidgets = <Widget>[];

    // Add head title
    _fieldWidgets.add(
      Text(_fieldNames[g_Language][0], style: const TextStyle(fontSize: 20), textAlign: TextAlign.left)
    );

    // Add form fields with spacer
    for (int i = 1; i < _fieldNames[g_Language].length; i++) {
      _fieldWidgets.add(
        const SizedBox(
          height: 10
        ),
      );

      _fieldWidgets.add(
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: _fieldNames[g_Language][i],
          ),
          onChanged: (text) {}
        )
      );
    }

    var fields = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _fieldWidgets,
    );

    const List<List<String>> _bikeTypes = [
      ['Ladies\'', 'Men\'s', 'Youth', 'Kids', 'E-Bike', 'E-Scooter', 'Mountainbike', 'Racing', 'City', 'Trekking', 'BMX', 'Other'], // EN
      ['Damenrad', 'Herrenrad', 'Jugendrad', 'Kinderrad', 'E-Bike', 'Roller / E-Scooter', 'Mountainbike', 'Rennrad', 'Citybike', 'Trekkingbike', 'BMX-Rad', 'Sonstiges'] // DE
    ];
    List<bool> _bikeTypeSelected = List<bool>.generate(_bikeTypes[g_Language].length, (i) => false);
    final _bikeInfoChildrenTotal = <Widget>[];
    List<List<Widget>> _bikeInfoChildren = List<List<Widget>>.generate(6, (i) => <Widget>[]);

    // Add bike types to rows which contains a total of 2 options
    int r = 0;
    for (int i = 0; i < _bikeTypes[g_Language].length; i++) {
      _bikeInfoChildren[r].add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: StatefulBuilder(
              builder: (context, _setState) => CheckboxListTile(
                title: Text(_bikeTypes[g_Language][i]),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.orange,
                value: _bikeTypeSelected[i],
                onChanged: (value) {
                  _setState(() => _bikeTypeSelected[i] = value! );
                },
              ),
            ),
          ),
        ),
      );
      if (_bikeInfoChildren[r].length == 2) r++;
    }

    // Add rows together
    for (int i = 0; i < _bikeInfoChildren.length; i++) {
      _bikeInfoChildrenTotal.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _bikeInfoChildren[i],
        ),
      );
    }

    // Build checkbox list
    Widget checkboxes = Column(
      children: _bikeInfoChildrenTotal,
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fields,
          checkboxes,
        ],
      ),
    );
  }

  String _selectedDate = '';
  var _dateController = TextEditingController(text: '');
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: g_SelectedDate!, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
      initialEntryMode: DatePickerEntryMode.input,
    );
    if (picked != g_SelectedDate) {
      setState(() {
        g_SelectedDate = picked!;
        _dateController.text = g_SelectedDate!.day.toString() + '.' + g_SelectedDate!.month.toString() + '.' + g_SelectedDate!.year.toString();
      });
    }
  }

  Widget _addBikeLayoutDealerInfo() {
    const List<List<String>> _fieldNames = [
      ['Dealer information', 'Name', 'Address', 'Price', 'Date'], // EN
      ['Händlerinformationen', 'Name', 'Adresse', 'Kaufpreis', 'Kaufdatum'] // DE
    ];
    List<Widget> _fieldWidgets = <Widget>[];

    // Add head title
    _fieldWidgets.add(
      Text(_fieldNames[g_Language][0], style: const TextStyle(fontSize: 20), textAlign: TextAlign.left)
    );

    // Add form fields with spacer
    for (int i = 1; i < _fieldNames[g_Language].length - 1; i++) {
      _fieldWidgets.add(
        const SizedBox(
          height: 10
        ),
      );

      _fieldWidgets.add(
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: _fieldNames[g_Language][i],
          ),
          onChanged: (text) {}
        )
      );
    }

    _fieldWidgets.add(
        const SizedBox(
          height: 10
        )
    );

    _fieldWidgets.add(
      TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: _fieldNames[g_Language][_fieldNames[g_Language].length - 1],
          ),
          controller: _dateController,
          readOnly: true,
          onTap: () {
            _selectDate(context);
          },
        )
      );

    var fields = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _fieldWidgets,
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fields,
        ],
      ),
    );
  }
}

class Bike extends StatefulWidget {
  const Bike({Key? key}) : super(key: key);

  @override
  _BikeState createState() => _BikeState();
}