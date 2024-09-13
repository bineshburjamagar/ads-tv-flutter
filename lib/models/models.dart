enum AdType { video, image }

List<AdsModel> adsList = [
  AdsModel(
      adType: AdType.image,
      link:
          'https://www.sportsnet.ca/wp-content/uploads/2024/09/UFC-306-SN_1280x720_Thumbnail.jpg'),
  AdsModel(
      adType: AdType.image,
      link:
          'https://www.billboard.com/wp-content/uploads/2024/09/Linkin-Park-digital-cover-James-Minchin-III-2024-bb-billboard-fea-840.jpg'),
  AdsModel(
      adType: AdType.video,
      link:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'),
];

class AdsModel {
  final AdType adType;
  final String link;

  AdsModel({required this.adType, required this.link});
}
