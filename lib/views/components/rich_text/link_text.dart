import 'package:flutter/foundation.dart' show VoidCallback, immutable;
import 'package:flutter/material.dart';
import 'package:instant_gram/views/components/rich_text/base_text.dart';

@immutable
class LinkText extends BaseText {
  final VoidCallback onTapped;
  const LinkText({
    required super.text,
    super.style,
    required this.onTapped,
  });
}
