import 'package:cozy_flutter/data/dummy_city.dart';
import 'package:cozy_flutter/data/dummy_tips.dart';
import 'package:cozy_flutter/providers/space_provider.dart';
import 'package:cozy_flutter/widgets/bottom_navbar_item.dart';
import 'package:cozy_flutter/widgets/city_card.dart';
import 'package:cozy_flutter/widgets/space_card.dart';
import 'package:cozy_flutter/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:cozy_flutter/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      // ignore: use_build_context_synchronously
      context.read<SpaceProvider>().getRecommendedSpaces();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.only(bottom: 110 + edge),
          children: [
            SizedBox(height: edge),

            // HEADER
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

            // POPULAR CITIES
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
                  ...dummyCities.map((city) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CityCard(key: ValueKey(city.id), city: city),
                    );
                  }),
                ],
              ),
            ),

            SizedBox(height: 30),

            // RECOMMENDED SPACE
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
              child: Consumer<SpaceProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (provider.error != null) {
                    return Center(child: Text(provider.error!));
                  }

                  return Column(
                    children: List.generate(provider.spaces.length, (index) {
                      final space = provider.spaces[index];
                      final isLast = index == provider.spaces.length - 1;

                      return Padding(
                        padding: EdgeInsets.only(bottom: isLast ? 0 : 30),
                        child: SpaceCard(key: ValueKey(space.id), space: space),
                      );
                    }),
                  );
                },
              ),
            ),

            SizedBox(height: 30),

            // TIPS & GUIDANCE
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
                children: List.generate(dummyTips.length, (index) {
                  final tips = dummyTips[index];
                  final isLast = index == dummyTips.length - 1;

                  return Padding(
                    padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
                    child: TipsCard(key: ValueKey(tips.id), tips: tips),
                  );
                }),
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVBAR
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
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
