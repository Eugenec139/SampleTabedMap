class Images {
  final int imageId;
  final String imageName;

  Images({this.imageId, this.imageName});

  factory Images.fromJson(Map<String, dynamic> parsedJson){
    return Images(
        imageId:parsedJson['id'],
        imageName:parsedJson['media_name']
    );
  }
}