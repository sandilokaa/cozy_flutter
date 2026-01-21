import 'package:cozy_flutter/models/city.dart';
import 'package:cozy_flutter/models/space.dart';
import 'package:cozy_flutter/models/tips.dart';
import 'package:cozy_flutter/widgets/bottom_navbar_item.dart';
import 'package:cozy_flutter/widgets/city_card.dart';
import 'package:cozy_flutter/widgets/space_card.dart';
import 'package:cozy_flutter/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:cozy_flutter/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.only(bottom: 110 + edge),
          children: [
            SizedBox(height: edge),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 24),
                  ...cityLists.map((city) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CityCard(key: ValueKey(city.id), city: city),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: List.generate(spaceLists.length, (index) {
                  final space = spaceLists[index];
                  final isLast = index == spaceLists.length - 1;

                  return Padding(
                    padding: EdgeInsets.only(bottom: isLast ? 0 : 30),
                    child: SpaceCard(key: ValueKey(space.id), space: space),
                  );
                }),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: List.generate(tipsLists.length, (index) {
                      final tips = tipsLists[index];
                      final isLast = index == tipsLists.length - 1;

                      return Padding(
                        padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
                        child: TipsCard(key: ValueKey(tips.id), tips: tips),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xFFF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home_solid.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_mail_solid.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card_solid.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love_solid.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
