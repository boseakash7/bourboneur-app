import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoodPourBack extends StatelessWidget {
  GoodPourBack({super.key, this.onTapBack, this.onTapRefresh});

  void Function()? onTapBack;
  void Function()? onTapRefresh;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          GestureDetector(
            onTap: onTapBack,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background
              ),
              child: Row(              
                children: [
                  Icon(Icons.arrow_back_sharp, color: Theme.of(context).textTheme.bodySmall?.color, size: 20),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Back",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTapRefresh,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background
              ),
              child: Row(
                children: [
                  Text(
                    "Refresh",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),                
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.replay, color: Theme.of(context).textTheme.bodySmall?.color, size: 20)
                ],
              ),
            ),
          ),
        ],
      );
  }
}