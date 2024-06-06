import 'package:flutter/material.dart';

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Historial',
                style: TextStyle(
                    color: Color(0xFF172983),
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            CustomCard(
              titulo: 'Tema Abogado',
              subTitulo: 'Jorge Lopez  · Intérprete LSCH',
            ),
            SizedBox(
              height: 8,
            ),
            CustomCard(
              titulo: 'Tema Capacitaciones FOSIS',
              subTitulo: 'Freddy Ibacache  · Intérprete LSCH',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final String titulo;
  final String subTitulo;

  const CustomCard({super.key, required this.titulo, required this.subTitulo});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 247, 247, 247),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.titulo, // Título
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF172983),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.subTitulo, // Subtítulo
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(), // Espaciador flexible para empujar el corazón hacia la derecha
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  color: const Color(0xFF172983),
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ), // Icono de corazón lleno
              const SizedBox(
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
          ), // Espacio entre la fila de título/subtítulo y los iconos
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: const Text(
                  'Compartir',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF172983),
                  ),
                ),
                icon: Image.asset(
                  scale: 1.5,
                  'assets/icon/compartir.png',
                  color: const Color(0xFF172983),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: const Text(
                  'Descargar',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF172983),
                  ),
                ),
                icon: const Icon(
                  Icons.file_download_outlined,
                  color: Color(0xFF172983),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: const Text(
                  'Ver Llamada',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF172983),
                  ),
                ),
                icon: const Icon(
                  Icons.play_arrow_outlined,
                  color: Color(0xFF172983),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
