import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/globals.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  void displayResults() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SearchBar(
            onSearchTap: displayResults,
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final VoidCallback? onSearchTap;

  const SearchBar({
    super.key,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(30),
          blurRadius: 30,
          spreadRadius: 0,
        ),
      ]),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search Doctors",
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
            child: Container(
              width: 50,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: onSearchTap,
                      child: Opacity(
                        opacity: 0.4,
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          height: 32,
                        ),
                      ),
                    ),
                    // const VerticalDivider(color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: 50,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(color: Colors.black),
                    Opacity(
                      opacity: 0.4,
                      child: SvgPicture.asset(
                        'assets/icons/filter.svg',
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
