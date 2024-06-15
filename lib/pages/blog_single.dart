
import 'package:bourboneur/Core/Apis/Blog.dart';
import 'package:bourboneur/Core/BlogController.dart';
import 'package:bourboneur/Core/Utils.dart';
import 'package:bourboneur/common/login_wrapper.dart';
import 'package:bourboneur/pages/blog_single/blog_comment.dart';
import 'package:bourboneur/pages/blog_single/blog_product.dart';
import 'package:bourboneur/pages/blog_single/recent_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogSinglePage extends StatefulWidget {
  BlogSinglePage({super.key, required this.id});

  String id;

  @override
  State<BlogSinglePage> createState() => _BlogSinglePageState();
}

class _BlogSinglePageState extends State<BlogSinglePage> {
  bool isLoading = true;
  Utils utils = Utils();
  BlogController blogController = Get.find<BlogController>();
  String? postedDate;

  int readTime = 0;

  @override
  void initState() {
    getData();    
    super.initState();
  }

  void getData() async {

    setState(() {
      isLoading = true;
    });

    bool response = await BlogApi.getSingle(widget.id);
    if (!response) {
      Navigator.of(context).pop();     
    }

    DateTime date = DateTime.parse(blogController.blog.value.postDate!);
    postedDate = DateFormat('d MMM, y').format(date);

    readTime = _calculateReadTime();

    setState(() {
      isLoading = false;
    });
  }

int _calculateReadTime() {
  final document = parse(blogController.blog.value.body);

  double number = 0;

  if ( document.body != null ) {     
    String? body = document.body?.text.replaceAll(RegExp(r'\s+'), ' ');
    List<String>words =  body!.split(" ");
    number = words.length / 250;
  }  

  // final String parsedString = parse(document.body.text).documentElement.text;

  return number.ceil();
}

  @override
  Widget build(BuildContext context) {
    return LoginWrapper(
      child: !isLoading
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      blogController.blog.value.title!,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      postedDate!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "${readTime} min read",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.network(blogController.blog.value.imgUrl!),
                    const SizedBox(
                      height: 30,
                    ),
                    HtmlWidget(
                      blogController.blog.value.body!,                      
                      onTapUrl: (url) {
                         launchUrl(
                          Uri.parse(url),
                          // mode: LaunchMode.externalApplication
                        );
                        return true;
                      },
                      textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlogProduct(
                      text: "Bourboneur Glencairn Glass ",
                      onTap: () {
                        launchUrl(
                          Uri.parse("https://www.bourboneur.com/product/bourboneur-glencairn-glasses"),
                          mode: LaunchMode.externalApplication
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RecentPost(),
                    // BlogComment()
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFff8202),
              ),
            ),
    );
  }
}
