class Blog {
  String? id;
  String? title;
  String? shortDescription;
  String? tags;
  String? imgUrl;
  String? postDate;
  String? body;

  Blog({
    this.id,
    this.title,
    this.shortDescription,
    this.tags,
    this.imgUrl,
    this.postDate,
    this.body,
  });

  Blog.fromJson(json) {
    id = json['id'].toString();
    title = json['title'];
    shortDescription = json['short_description'];
    tags = json['tags'];
    imgUrl = json['img_url'];
    postDate = json['post_date'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'short_description': shortDescription,
      'tags': tags,
      'featured_image': imgUrl,
      'img_url': postDate,
      'body': body
    };
  }
}
