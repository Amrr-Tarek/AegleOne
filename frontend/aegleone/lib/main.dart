import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appointments',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const AppointmentsPage(),
    );
  }
}

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  List appointments = [];
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  String _startTime = '';
  String _endTime = '';

  // final String apiUrl = 'http://10.0.2.2:8000/tasks/'; // Android emulator
  // final String apiUrl = kIsWeb
  //     ? Uri.base.origin + '/appointments/'
  //     : 'http://192.168.1.100:8000/appointments/'; // Use the service name for mobile/emulator
  final String apiUrl = '/appointments/'; // Windows

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      setState(() {
        appointments = json.decode(response.body);
      });
    }
  }

  Future<void> addAppointment() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': _title,
        'description': _description,
        'start_time': _startTime,
        'end_time': _endTime,
      }),
    );
    if (response.statusCode == 201) {
      fetchAppointments();
      Navigator.of(context).pop();
    }
  }

  void showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Appointment'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    onChanged: (val) => _title = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    onChanged: (val) => _description = val,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Start Time (YYYY-MM-DDTHH:MM)'),
                    onChanged: (val) => _startTime = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'End Time (YYYY-MM-DDTHH:MM)'),
                    onChanged: (val) => _endTime = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Required' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  addAppointment();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: RefreshIndicator(
        onRefresh: fetchAppointments,
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final appt = appointments[index];
            return ListTile(
              title: Text(appt['title'] ?? ''),
              subtitle: Text(appt['description'] ?? ''),
              trailing:
                  Text(appt['start_time']?.toString().substring(0, 16) ?? ''),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
