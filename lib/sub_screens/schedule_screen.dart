import 'package:flutter/material.dart';
import '../videoplayer/videoplayer.dart';

class Agenda extends StatelessWidget {
  const Agenda({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3.8,
            child: const VideoPlayerScreen(
              videoUrl: 'assets/videos/Agendarllamadahora.mp4',
              radius: 20,
            ),
          ),
        ),
        const Text(
          'Agenda tu llamada',
          style: TextStyle(fontSize: 24, color: Color(0xFF374151)),
        ),
        const Center(
          child: AgendaInputs(),
        ),
      ],
    );
  }
}

class AgendaInputs extends StatefulWidget {
  const AgendaInputs({super.key});

  @override
  AgendaInputsState createState() => AgendaInputsState();
}

final List<String> _timeSlots = [
  '09:00 AM',
  '10:00 AM',
  '11:00 AM',
  '12:00 PM',
  '01:00 PM',
  '02:00 PM',
  '03:00 PM',
  '04:00 PM',
  '05:00 PM',
];

class AgendaInputsState extends State<AgendaInputs> {
  DateTime _selectedDate = DateTime.now();

  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text =
        '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fecha:',
              style: TextStyle(color: Color(0xFF6B7280)),
            ),
            TextFormField(
                keyboardType: TextInputType.none,
                onTap: () => _selectDate(context),
                controller: _dateController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5,
                        color: Color(
                            0xFF6B7280)), // Mismo color que el borde normal
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6B7280)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: '26/04/2024',
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: Color(0xFF172983),
                  ),
                )),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 20, 8, 15),
              child: Text(
                'Hora:',
                style: TextStyle(color: Color(0xFF6B7280)),
              ),
            ),
            DropdownButtonFormField<String>(
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5,
                      color:
                          Color(0xFF6B7280)), // Mismo color que el borde normal
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Bordes redondeados
                ),
              ),
              hint: const Row(
                children: [
                  Icon(
                    Icons.access_alarm_rounded,
                    color: Color(0xFF172983),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Hora'),
                ],
              ),
              items: _timeSlots.map((time) {
                return DropdownMenuItem<String>(
                  value: time,
                  child: Text(time),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {});
              },
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color(0x0f3fb272)), // Color de fondo verde
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Bordes redondeados
                    ),
                  ),
                  minimumSize: WidgetStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                onPressed: () {},
                child: const Text(
                  'Continuar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
