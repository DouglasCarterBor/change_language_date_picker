import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Picker Demo',
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en'), 
        Locale('pt'), 
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyDatePicker(),
    );
  }
}
class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});
  @override
  MyDatePickerState createState() => MyDatePickerState();
}
class MyDatePickerState extends State<MyDatePicker> {
  late DateTime _selectedDate; 
  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                  locale: const Locale('pt'),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              child: const Text('Selecionar Data'),
            ),
            const SizedBox(height: 20),
            Text(
              'Data selecionada: ${_selectedDate.toLocal()}',
            ),
          ],
        ),
      ),
    );
  }
}