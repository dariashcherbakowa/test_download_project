//11.9 - сейчас у нас город прописан в коде. мы реализуем второй экран, где будем пользователю
//давать возможность вводить название любого города
//для этого в папке screens создаем новый файл (этот)

import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String?
  cityName; // создаем переменную cityName, которая будет хранить наш город

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey[800],
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter City Name",
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black87,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                      icon: const Icon(
                        Icons.location_city,
                        color: Colors.black87,
                        size: 50.0,
                      ),
                    ),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                ),
                onPressed: () {
                  if (cityName != null && cityName!.isNotEmpty) {
                    Navigator.pop(context, cityName);
                  }
                },
                child: const Text(
                  'Get Weather',
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
