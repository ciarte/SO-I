import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

enum WidgetState { none, loading, loaded, error }

class CameraScreenState extends State<CameraScreen> {
  WidgetState _widgetState = WidgetState.none;
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (_widgetState) {
      case WidgetState.none:
      case WidgetState.loading:
        return buildScaffold(
            context, const Center(child: CircularProgressIndicator()));
      case WidgetState.loaded:
        return buildScaffold(
          context,
          Stack(
            children: [
              Positioned(top: 30, left: 0, child: _muteMicButton(context)),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CameraPreview(_cameraController),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.5),
                      Colors.grey.withOpacity(0.5)
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      const Text(
                        'Fernanda Gaete',
                        style:
                            TextStyle(color: Color(0xFFF2F2F2), fontSize: 26),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'llamando...',
                          style: TextStyle(color: Color(0xFFF2F2F2)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _muteMicButton(context),
                              _disconnectCallButton(context),
                              _disableVideoButton(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      case WidgetState.error:
        return buildScaffold(
            context,
            const Center(
                child: Text(
                    "¡Ooops! Error al cargar la cámara 😩. Reinicia la apliación.")));
    }
  }

  Widget buildScaffold(
    BuildContext context,
    Widget body,
  ) {
    return Scaffold(
      body: body,
    );
  }

  Future<void> initializeCamera() async {
    _widgetState = WidgetState.loading;
    if (mounted) setState(() {});

    _cameras = await availableCameras();

    _cameraController = CameraController(
      _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      ),
      ResolutionPreset.medium,
    );
    await _cameraController.initialize();

    if (_cameraController.value.hasError) {
      _widgetState = WidgetState.error;
      if (mounted) setState(() {});
    } else {
      _widgetState = WidgetState.loaded;
      if (mounted) setState(() {});
    }
  }
}

Widget _muteMicButton(context) {
  return RawMaterialButton(
    onPressed: () => {},
    shape: const CircleBorder(),
    elevation: 2.0,
    fillColor: Colors.white,
    padding: const EdgeInsets.all(12.0),
    child: const Icon(
      Icons.mic,
      color: Colors.blueAccent,
      size: 20.0,
    ),
  );
}

Widget _disconnectCallButton(context) {
  return RawMaterialButton(
    onPressed: () {
      Navigator.pop(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(
            currentPageIndex: 0,
          ),
        ),
      );
    },
    shape: const CircleBorder(),
    elevation: 2.0,
    fillColor: Colors.redAccent,
    padding: const EdgeInsets.all(15.0),
    child: const Icon(Icons.call_end, color: Colors.white, size: 35),
  );
}

Widget _disableVideoButton() => RawMaterialButton(
      onPressed: () {},
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(12.0),
      child: const Icon(
        Icons.videocam,
        color: Colors.blueAccent,
        size: 20.0,
      ),
    );
