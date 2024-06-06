import 'package:flutter/material.dart';

import '../videoplayer/videoplayer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Perfil',
              style: TextStyle(
                  color: Color(0xFF172983),
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              radius: 80,
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: VideoPlayerScreen(
                    videoUrl: 'assets/videos/floGaete.mp4',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Fernanda Gaete",
              style: TextStyle(
                color: Color(0xFF172983),
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileOption(
                      icon: Icons.edit,
                      label: 'Editar Perfil',
                      onPressed: () {
                        // Acción al presionar
                      },
                      backIcon: Icons.arrow_forward_ios_rounded,
                    ),
                    ProfileOption(
                      icon: Icons.settings_outlined,
                      label: 'Configuración',
                      onPressed: () {
                        // Acción al presionar
                      },
                      backIcon: Icons.arrow_forward_ios_rounded,
                    ),
                    ProfileOption(
                      icon: Icons.live_help_outlined,
                      label: 'Preguntas Frecuentes',
                      onPressed: () {
                        // Acción al presionar
                      },
                      backIcon: Icons.arrow_forward_ios_rounded,
                    ),
                    ProfileOption(
                      icon: Icons.build_outlined,
                      label: 'Soporte',
                      onPressed: () {
                        // Acción al presionar
                      },
                      backIcon: Icons.arrow_forward_ios_rounded,
                    ),
                    ProfileOption(
                      icon: Icons.logout_rounded,
                      label: 'Cerrar Sesión',
                      onPressed: () {
                        // Acción al presionar
                      },
                      backIcon: Icons.arrow_forward_ios_rounded,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final IconData backIcon;
  final String label;
  final VoidCallback? onPressed;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.backIcon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        iconColor: const Color(0xFF172983),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 8),
              Icon(icon),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF172983),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Icon(backIcon),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
