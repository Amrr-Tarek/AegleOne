import 'package:flutter/material.dart';
import '../utils/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  //   Future<void> _logout() async {
  //   await secureStorage.delete(key: 'auth_token');
  //   Navigator.pushReplacementNamed(context, '/login');
  // }

  int _currentIndex = 0;

  final List<Widget> _patientPages = [
    const PatientDashboard(),
    const AppointmentsPage(),
    const Placeholder(),
    const ProfilePage(),
  ];

  static const List<BottomNavigationBarItem> _patientNav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today),
      label: "Appointments",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bubble_chart_outlined),
      label: "Ai Bot",
    ),
  ];

  final List<Widget> _doctorPages = [
    const DoctorDashboard(),
    const PrescriptionsPage(),
    const ProfilePage(),
  ];

  static const List<BottomNavigationBarItem> _doctorNav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today),
      label: "Prescriptions",
    ),
  ];

  final List<Widget> _adminPages = [
    const Placeholder(),
    const Placeholder(),
    const ProfilePage(),
  ];

  static const List<BottomNavigationBarItem> _adminNav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.admin_panel_settings_outlined), // Add an on-click
      label: "Admin Panel",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.insights),
      label: "Insights",
    ),
  ];

  final List<Widget> _visitorPages = [
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const ProfilePage(),
  ];

  static const List<BottomNavigationBarItem> _visitorNav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard), // Add an on-click
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today),
      label: "Calendar",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bubble_chart_outlined),
      label: "Ai Bot",
    ),
  ];

  final List<Widget> _pharmPages = [
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const ProfilePage(),
  ];

  static const List<BottomNavigationBarItem> _pharmNav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard), // Add an on-click
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today),
      label: "Manage Medicines",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bubble_chart_outlined),
      label: "Ai Bot",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages;
    final List<BottomNavigationBarItem> navBar;
    if (UserData.userType == "patient") {
      pages = _patientPages;
      navBar = _patientNav;
    } else if (UserData.userType == "doctor") {
      pages = _doctorPages;
      navBar = _doctorNav;
    } else if (UserData.userType == "admin") {
      pages = _adminPages;
      navBar = _adminNav;
    } else if (UserData.userType == "pharmacy") {
      pages = _pharmPages;
      navBar = _pharmNav;
    } else {
      pages = _visitorPages;
      navBar = _visitorNav;
    }

    print(pages);
    print(navBar);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome, ${UserData.name.split(" ").first}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        drawer: Drawer(),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            ...navBar,
            BottomNavigationBarItem(
              icon: Icon(UserData.gender == "male"
                  ? Icons.person_outline
                  : Icons.person_2_outlined), // Add an on-click
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

class PatientDashboard extends StatelessWidget {
  const PatientDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person, // Differentiate genders
            size: 80,
            color: Colors.blue,
          ),
          SizedBox(height: 20),
          Text(
            "Dashboard",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20),
          Card(),
        ],
      ),
    );
  }
}

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medical_services,
            size: 80,
            color: Colors.green,
          ),
          SizedBox(height: 20),
          Text(
            "Dashboard",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20),
          Card(),
        ],
      ),
    );
  }
}

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_month,
            size: 80,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class PrescriptionsPage extends StatelessWidget {
  const PrescriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Prescriptions"),
    );
  }
}

// Placeholder
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(UserData.name),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(UserData.userType),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(UserData.email),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(UserData.gender),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("${UserData.age}"),
            ),
          ),
        ],
      ),
    );
  }
}
