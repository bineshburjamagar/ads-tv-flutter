enum AdType { video, image }

List<AdsModel> adsList = [
  AdsModel(
      adType: AdType.video,
      link:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
  AdsModel(
      adType: AdType.image,
      link:
          'https://images.unsplash.com/photo-1541535650810-10d26f5c2ab3?q=80&w=2076&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
];

class AdsModel {
  final AdType adType;
  final String link;

  AdsModel({required this.adType, required this.link});
}
