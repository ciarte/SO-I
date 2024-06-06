import 'package:flutter/material.dart';
import '../videoplayer/videoplayer.dart';
import 'sub_screens.dart';

class TipoDeAtencion extends StatelessWidget {
  const TipoDeAtencion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color(0xFF172983),
          ),
          title: const Text(
            'Atrás',
            style: TextStyle(
              color: Color(0xFF172983),
            ),
          ),
        ),
        body: const SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10.0),
            child: VideoPlayerScreen(
              videoUrl: 'assets/videos/Tipoatencin.mp4',
              radius: 20,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Elige el tipo de atención',
              style: TextStyle(fontSize: 24, color: Color(0xFF374151)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: AgendaInterprete(),
            ),
          )
        ])));
  }
}

class AgendaInterprete extends StatefulWidget {
  const AgendaInterprete({super.key});

  @override
  AgendaInterpreteState createState() => AgendaInterpreteState();
}

final List<TimeSlots> _timeSlots = [
  TimeSlots(
      time: 'Conversación Cotidiana',
      icon: const Icon(
        Icons.chat,
        color: Color(0xFF172983),
      )),
  TimeSlots(
      time: 'Entrevista',
      icon: const Icon(
        Icons.wallet_travel,
        color: Colors.brown,
      )),
  TimeSlots(
      time: 'Salud',
      icon: const Icon(
        Icons.local_hospital_outlined,
        color: Colors.red,
      )),
];

class TimeSlots {
  final String time;
  final Icon icon;

  TimeSlots({required this.icon, required this.time});
}

class AgendaInterpreteState extends State<AgendaInterprete> {
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      DropdownButtonFormField<String>(
        hint: const Text('Tema'),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.5,
                color: Color(0xFF6B7280)), // Mismo color que el borde normal
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
          ),
        ),
        items: _timeSlots.map((time) {
          return DropdownMenuItem<String>(
            value: time.time,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                time.icon,
                const SizedBox(width: 10),
                Text(
                  time.time,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _isButtonEnabled = true;
          });
        },
      ),
      const SizedBox(
        height: 50,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _isButtonEnabled ? const Color(0xFF3FB272) : Colors.grey,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: _isButtonEnabled
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Interprete(),
                  ),
                );
              }
            : null,
        child: const Text(
          'Buscar Intérprete',
          style: TextStyle(color: Colors.white),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
