import 'package:flutter/material.dart';
import 'package:viewith/ui/app_design.dart';

class ReviewItem extends StatelessWidget {
  final String imageUrl;
  final String concert;
  final String seat;
  final double rating;
  final String review;
  final String date;

  const ReviewItem({
    super.key,
    required this.imageUrl,
    required this.concert,
    required this.seat,
    required this.rating,
    required this.review,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(concert, style: AppDesign.typo.body3()),
                    const SizedBox(height: 2),
                    Text(seat, style: AppDesign.typo.title1()),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        ...List.generate(5, (index) {
                          return Icon(
                            index < rating.floor()
                                ? Icons.star
                                : index < rating
                                    ? Icons.star_half
                                    : Icons.star_border,
                            color: Colors.red,
                            size: 16,
                          );
                        }),
                        const SizedBox(width: 4),
                        Text(
                          '${rating.toStringAsFixed(1)} / 5.0',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      review,
                      style: const TextStyle(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          date,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
