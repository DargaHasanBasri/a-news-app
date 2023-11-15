import 'package:a_news_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class TopicsItem extends StatefulWidget {
  final String newsImageAddress;
  final Function onPress;

  const TopicsItem({
    super.key,
    required this.newsImageAddress,
    required this.onPress,
  });

  @override
  State<TopicsItem> createState() => _TopicsItemState();
}

class _TopicsItemState extends State<TopicsItem> {
  ValueNotifier<bool> isAdd = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 0.8,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.newsImageAddress,
                    fit: BoxFit.cover,
                  ),
                  ValueListenableBuilder(
                      valueListenable: isAdd,
                      builder: (_, __, ___) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    widget.onPress.call();
                                    isAdd.value = !isAdd.value;
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: isAdd.value ? CustomColors.darkMidnightBlue : CustomColors.coolBlue,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        isAdd.value ? "images/ic_tick.png" : "images/ic_add_plus.png",
                                        width: 18,
                                        height: 18,
                                        color: CustomColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 78,
          child: Text(
            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
