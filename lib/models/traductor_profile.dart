class Profile {
  final String name;
  final String videoUrl;
  final String imageProfile;
  final String city;
  final String experience;
  final String clase;

  bool isPlaying;

  Profile(
      {required this.imageProfile,
      required this.city,
      required this.experience,
      required this.name,
      required this.videoUrl,
      required this.clase,
      this.isPlaying = false});
}
