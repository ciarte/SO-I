import 'package:flutter/material.dart';
import 'package:tap_to_expand/tap_to_expand.dart';
import '../models/traductor_profile.dart';
import '../videoplayer/videoplayer.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({super.key});

  @override
  ProfileListState createState() => ProfileListState();
}

class ProfileListState extends State<ProfileList> {
  List<Profile> profiles = [
    Profile(
        name: 'Freddy Ibacache',
        videoUrl: 'assets/videos/Freddy.mp4',
        imageProfile: 'assets/images/Perfil_2.jpg',
        city: 'Región Metropolitana',
        experience: '3',
        clase: 'Intérprete LSCH'),
    Profile(
        name: 'Jorge Lopez',
        videoUrl: 'assets/videos/jesuss.mp4',
        imageProfile: 'assets/images/Perfil_4.jpeg',
        city: 'Región Metropolitana',
        experience: '5',
        clase: 'Intérprete LSCH'),

    Profile(
        name: 'Daniela Olave',
        videoUrl: 'assets/videos/dona.mp4',
        imageProfile: 'assets/images/Perfil_0.jpeg',
        city: 'Región Metropolitana',
        experience: '2',
        clase: 'Intérprete LSCH'),
    Profile(
        name: 'Sergio Mendoza',
        videoUrl: 'assets/videos/homre.mp4',
        imageProfile: 'assets/images/Perfil_1.jpg',
        city: 'Región Metropolitana',
        experience: '3',
        clase: 'Intérprete LSCH'),
    Profile(
        name: 'Rosita Herrera',
        videoUrl: 'assets/videos/mujer.mp4',
        imageProfile: 'assets/images/Perfil_3.jpeg',
        city: 'Región De Valparaíso',
        experience: '1',
        clase: 'Intérprete LSCH'),

    // Agrega más perfiles según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: TapToExpand(
                titlePadding:
                    const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                backgroundcolor: Colors.white,
                duration: const Duration(milliseconds: 50),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VideoPlayerScreen(
                      videoUrl: profiles[index].videoUrl,
                      radius: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      const Icon(
                        Icons.location_on_outlined, // Icono de ciudad
                        color: Color(0xFF172983),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        profiles[index]
                            .city, // Agrega aquí la ciudad del perfil
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icon/personicon.png',
                          width: 24, // Tamaño del icono
                          height: 24, // Icono de años de experiencia
                          color: const Color(0xFF172983),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Experiencia ${profiles[index].experience} años', // Agrega aquí los años de experiencia del perfil
                        ),
                      ],
                    ),
                  ],
                ),
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage(profiles[index].imageProfile),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(profiles[index].name,
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text(
                        '-',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        profiles[index].clase,
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ]),
                closedHeight: 50,
                outerOpenedPadding: 0,
                outerClosedPadding: 0,
                borderRadius: BorderRadius.circular(10),
                openedHeight: 150,
              ),
            )
          ],
        );
      },
    );
  }
}
