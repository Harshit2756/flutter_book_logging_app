import 'package:flutter/material.dart';

import '../../../utils/contants/sizes.dart';

class ReviewBottomaSheet extends StatelessWidget {
  const ReviewBottomaSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Your Review',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: HSizes.defaultSpace),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(185, 194, 204, 1),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "This book is a true masterpiece! The author's captivating storytelling and attention to detail immerse you in a world that feels so real, you'll be reluctant to put it down.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
