import 'package:flutter/material.dart';
import '../sub_screens/sub_screens.dart';
import 'screens.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 15, top: 30),
            child: Text(
              'Inicio',
              style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF172983),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Text(
              'Servicios',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFF172983),
              ),
            ),
          ),
          SizedBox(
            height: 190,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                ServiceCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TipoDeAtencion()),
                    );
                  },
                  iconColor: const Color(0xFF65C18E),
                  color: const Color(0xFF3FB272),
                  icon: Icons.videocam_outlined,
                  text: 'Llamar\nIntérprete LSCH',
                ),
                ServiceCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen(
                                currentPageIndex: 1,
                              )),
                    );
                  },
                  iconColor: const Color(0xFF33ADD5),
                  color: const Color(0xFF009EE0),
                  icon: Icons.calendar_today_outlined,
                  text: 'Agendar Llamadas\ncon Intérprete',
                ),
                const ServiceCard(
                  iconColor: Color(0xFFFF7063),
                  color: Color(0xFFFF4C3C),
                  icon: Icons.wifi_calling_3_outlined,
                  text: 'Llamada Emergencia',
                ),
                // Agrega más ServiceCard aquí según sea necesario
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Próximas Reuniones',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF172983),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen(
                                    currentPageIndex: 1,
                                  )),
                        );
                      },
                      icon: const Icon(Icons.add),
                      iconSize: 35,
                      color: const Color(0xFF172983),
                    ),
                  ],
                ),
                const Text(
                  '1 Reunión Pendiente',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Tema Capacitaciones FOSIS', // Título
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF172983),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Freddy Ibacache  · Intérprete LSCH', // Subtítulo
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    endIndent: 10,
                    indent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextButton.icon(
                            onPressed: () {},
                            label: const Text(
                              'Lunes, 15 Julio 2024 · 14:30',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xFF172983),
                            ),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/Perfil_2.jpg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final String text;
  final void Function()? onTap;

  const ServiceCard({
    super.key,
    required this.color,
    required this.iconColor,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: iconColor,
                  child: Icon(
                    icon,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
