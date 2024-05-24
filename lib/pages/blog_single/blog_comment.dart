import 'package:flutter/material.dart';

class BlogComment extends StatefulWidget {
  const BlogComment({super.key});

  @override
  State<BlogComment> createState() => _BlogCommentState();
}

class _BlogCommentState extends State<BlogComment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "0 Comments",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).textTheme.titleMedium?.color,
            fontSize: 22
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 2,
          decoration: const BoxDecoration(
            color: Color.fromARGB(85, 225, 225, 225)
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

// class CommentForm extends StatelessWidget {
//   CommentForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
          
//         )
//       ],
//     );
//   }
// }