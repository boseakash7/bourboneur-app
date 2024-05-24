import 'package:bourboneur/Core/Apis/Blog.dart';
import 'package:bourboneur/Core/BlogController.dart';
import 'package:bourboneur/pages/blog_single.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bourboneur/Core/Controllers/Blog.dart' as cBlog;

class RecentPost extends StatefulWidget {
  const RecentPost({super.key});

  @override
  State<RecentPost> createState() => _RecentPostState();
}

class _RecentPostState extends State<RecentPost> {
  BlogController blogController = Get.find<BlogController>();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var response = await BlogApi.getRecent();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Posts",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              fontFamily: 'Arial',
              color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: _prepareBlogs(blogController.recentBlogs.value),
          ),
        ),
      ],
    ));
  }

  List<Widget> _prepareBlogs(List<cBlog.Blog> result) {
    List<Widget> list = [];

    for (var item in result) {
      list.add(RecentPostItem(
        id: item.id!,
        title: item.title!,
        image: item.imgUrl!,
        postedAt: item.postDate!,
        shortDec: item.shortDescription!,
      ));
    }

    return list;
  }
}

class RecentPostItem extends StatelessWidget {
  RecentPostItem(
      {super.key,
      required this.id,
      required this.title,
      required this.image,
      required this.shortDec,
      required this.postedAt});

  String id;
  String title;
  String image;
  String shortDec;
  String postedAt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Get.to(() => BlogSinglePage(id: id));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                      alignment: Alignment.center)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Arial',
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
