
import 'package:bourboneur/pages/blog_single.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BlogItem extends StatefulWidget {
  BlogItem({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.shortDec,
    required this.postedAt
  });

  String id;
  String title;
  String image;
  String shortDec;
  String postedAt;
  void Function()? onTap;

  @override
  State<BlogItem> createState() => _BlogItemState();
}

class _BlogItemState extends State<BlogItem> {

  String? postedDate;

  @override
  void initState() {
    DateTime date = DateTime.parse(widget.postedAt);
    postedDate = DateFormat('d MMM, y').format(date);

    super.initState();
  }

  void _handleOnTap() {
    Get.to(() => BlogSinglePage(
      id: widget.id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleOnTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFff8202), Color.fromARGB(0, 20, 20, 20)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Container(
          margin: const EdgeInsets.all(2),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 40),
          decoration: const BoxDecoration(color: Color(0xFF000000)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(widget.image),
              const SizedBox(
                height: 30,
              ),
              if ( postedDate != null )
              Text(
                postedDate!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.shortDec,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 17, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
