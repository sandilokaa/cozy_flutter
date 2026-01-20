import 'package:cozy_flutter/models/city.dart';
import 'package:cozy_flutter/models/space.dart';
import 'package:cozy_flutter/widgets/city_card.dart';
import 'package:cozy_flutter/widgets/space_card.dart';
import 'package:flutter/material.dart';
import 'package:cozy_flutter/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: edge),
          child: ListView(
            children: [
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
              Column(
                children: [
                  const SizedBox(width: 24),
                  ...spaceLists.map((space) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: SpaceCard(key: ValueKey(space.id), space: space),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
