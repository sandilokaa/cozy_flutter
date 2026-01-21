import 'package:cozy_flutter/models/space.dart';
import 'package:cozy_flutter/pages/detail_page.dart';
import 'package:cozy_flutter/theme.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  const SpaceCard({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              height: 110,
              width: 130,
              child: Stack(
                children: [
                  Image.asset(space.imageUrl),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 85,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon_star.png',
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${space.rating}/5',
                            style: whiteTextStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(space.name, style: blackTextStyle.copyWith(fontSize: 18)),
              SizedBox(height: 2),
              Text.rich(
                TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: greyextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text('${space.city}, ${space.country}', style: greyextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
