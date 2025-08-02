import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24.0),
            CustomTextField(),
            Spacer(),
            AspectRatio(
              aspectRatio: 1496 / 1067,
              child: SvgPicture.asset('assets/search.svg'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
