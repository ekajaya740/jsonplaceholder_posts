import 'package:flutter/material.dart';
import 'package:jsonplaceholder_posts/providers/expandable_text_provider.dart';
import 'package:provider/provider.dart';

class ExpandableText extends StatelessWidget {
  const ExpandableText(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          maxLines: Provider.of<ExpandableTextProvider>(
            context,
          ).isExpanded
              ? null
              : 2,
          overflow: Provider.of<ExpandableTextProvider>(
            context,
          ).isExpanded
              ? null
              : TextOverflow.ellipsis,
          style: style,
        ),
        TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero), // Remove padding
          ),
          onPressed: () {
            Provider.of<ExpandableTextProvider>(context, listen: false)
                .expandText();
          },
          child: const Text("Read more"),
        )
      ],
    );
  }
}
