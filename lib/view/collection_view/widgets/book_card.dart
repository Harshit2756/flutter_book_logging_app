import 'package:flutter/material.dart';

import '../../../common/widgets/Buttons/text_icon_button.dart';
import '../../../utils/contants/colors.dart';
import '../../../utils/contants/sizes.dart';
import 'review_bottom_sheet.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.category,
    required this.bookName,
    required this.summury,
    required this.review,
    required this.onDelete,
    required this.onEdit,
  });
  final String category, bookName, summury, review;
  final VoidCallback onDelete, onEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: HColors.cardBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  PopupMenuButton<String>(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    onSelected: (value) {
                      if (value == 'edit') {
                        onEdit();
                      } else if (value == 'delete') {
                        onDelete();
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text(
                            'Remove',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                      ];
                    },
                    icon: Icon(Icons.more_vert, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Book Title
              Text(
                bookName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                summury,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 16),
              // Read Review button
              TextIconButton(
                text: 'Read Review',
                icon: Icons.article,
                bottomSheetChild: ReviewBottomaSheet(
                  review: review,
                ),
                fontSize: HSizes.textSize14,
                isBold: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
