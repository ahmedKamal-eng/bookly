
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../Core/utils/styles.dart';

class BookingRating extends StatelessWidget {
  const BookingRating({Key? key,this.mainAxisAlignment=MainAxisAlignment.start,required this.rating,required this.count}) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final int rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
       const   SizedBox(width: 6,),
        Text(
         rating.toString(),
          style: Styles.textStyle16,
        ),
       const SizedBox(width: 5,),
        Text(
          count.toString(),
          style: Styles.textStyle14.copyWith(
            color: Color(0xff707070)
          ),
        ),
      ],
    );
  }
}
