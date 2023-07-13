class Feed {
  String? title;
  String? description;
  String? content;
  String image;
  int? view;
  int? commentId;
  int? userId;
  int? id;

  Feed({
    this.title,
    this.description,
    this.content,
    required this.image,
    this.view,
    this.commentId,
    this.userId,
    this.id,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
        title: json['name'],
        description: json['description'],
        content: json['content'],
        image: json['image']?.length > 0 ? json['image'][0]['path'] : '',
        view: json['view'],
        commentId: json['commentId'],
        userId: json['userId'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['content'] = content;
    data['image'] = image;
    data['view'] = view;
    data['commentId'] = commentId;
    data['userId'] = userId;
    data['id'] = id;
    return data;
  }
}
