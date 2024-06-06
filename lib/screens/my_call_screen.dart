import 'dart:async';
import 'package:flutter/material.dart';
import '../videoplayer/videoplayer.dart';
import 'rating_screen.dart';
import 'package:agora_uikit/agora_uikit.dart';

class MyCall extends StatefulWidget {
  const MyCall({super.key});

  @override
  State<MyCall> createState() => _MyCallState();
}

class _MyCallState extends State<MyCall> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "70951246aa3d44f0a1e2926e791f29fe",
      channelName: "1",
      username: "user",
    ),
  );
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      initAgora();
    });
  }

  void initAgora() async {
    await client.initialize();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: isLoading
              ? const CameraScreen()
              : Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          AgoraVideoViewer(
                            floatingLayoutContainerHeight:
                                MediaQuery.of(context).size.height / 2.2,
                            floatingLayoutContainerWidth:
                                MediaQuery.of(context).size.width / 2.1,
                            client: client,
                            layoutType: Layout.floating,
                            enableHostControls: true,
                          ),
                          AgoraVideoButtons(
                            client: client,
                            enabledButtons: const [
                              BuiltInButtons.callEnd,
                              BuiltInButtons.toggleMic,
                              BuiltInButtons.toggleCamera
                            ],
                            onDisconnect: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RatingScreen(),
                                ),
                              );
                            },
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 2.4,
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: const AspectRatio(
                                aspectRatio:
                                    1, // Esto mantiene una relación de aspecto de 16:9
                                child: VideoPlayerScreen(
                                  videoUrl: 'assets/videos/reformat.mp4',
                                  radius: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
