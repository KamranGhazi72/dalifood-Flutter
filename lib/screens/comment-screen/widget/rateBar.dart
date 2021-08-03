import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateBar extends StatelessWidget {
  final onRatingUpdate;
  RateBar({
    Key? key,
    this.onRatingUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBar.builder(
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 0),
          itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
          onRatingUpdate: onRatingUpdate),
    );
  }
}
