import 'package:flutter/material.dart';

import '../../../utils/contants/colors.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    super.key,
    required this.collecionName,
    required this.noOfBook,
    required this.date,
  });
  final String date;
  final int collecionName, noOfBook;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: HColors.cardBgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(0, 12.0, 12.0, 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 4,
              height: 30,
              decoration: const BoxDecoration(
                color: HColors.mainColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Collection $collecionName",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                  decoration: const BoxDecoration(
                    color: Color(0xffD6D3FF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Text(
                    "$noOfBook books",
                    style: const TextStyle(
                      color: HColors.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: HColors.textColor,
                  size: 15,
                ),
                const SizedBox(width: 5),
                Text(
                  date,
                  style: const TextStyle(
                    color: HColors.textColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
