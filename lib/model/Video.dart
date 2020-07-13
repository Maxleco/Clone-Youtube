class Video{
  String id;
  String title;
  String description;
  String channel;
  String image; 

  Video({this.id, this.title, this.description, this.channel, this.image});

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      description: json["snippet"]["description"],
      channel: json["snippet"]["channelTitle"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
    );
  }

}