import 'package:flutter/material.dart';

class BlogNavigation extends StatefulWidget {
  BlogNavigation({
    super.key,
    required this.totalPages,
    required this.currentPage,
    this.onTapPrevious,
    this.onTapNext
  });

  int totalPages;
  int currentPage;
  void Function()? onTapPrevious;
  void Function()? onTapNext;

  @override
  State<BlogNavigation> createState() => _BlogNavigationState();
}

class _BlogNavigationState extends State<BlogNavigation> {

  Widget icon(icon) {
    return SizedBox(
      width: 20,
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.background,
        size: 10,
      ),
    );
  }

  Widget navigationButton(onPressed, text,
      {IconData? suffixIcon, IconData? prefixIcon}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
        decoration: const BoxDecoration(
            color: Color(0xffe07e2f),
            borderRadius: const BorderRadius.all(Radius.circular(1))),
        child: Row(
          children: [
            if (prefixIcon != null) icon(prefixIcon),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.background),
            ),
            if (suffixIcon != null) icon(suffixIcon)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if ( widget.currentPage > 1 )
            navigationButton(widget.onTapPrevious, "PREV", prefixIcon: Icons.arrow_back_ios),
            const SizedBox(width: 15),
             if ( widget.currentPage < widget.totalPages )
            navigationButton(widget.onTapNext, "NEXT", suffixIcon: Icons.arrow_forward_ios)
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "${widget.currentPage} / ${widget.totalPages}",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'TradeGothic'
          )
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
