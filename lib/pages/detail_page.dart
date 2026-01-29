import 'package:cached_network_image/cached_network_image.dart';
import 'package:cozy_flutter/models/space.dart';
import 'package:cozy_flutter/pages/error_page.dart';
import 'package:cozy_flutter/theme.dart';
import 'package:cozy_flutter/widgets/facility_item.dart';
import 'package:cozy_flutter/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  const DetailPage({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    Future<void> openUrl(String url) async {
      final uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => ErrorPage()),
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: space.imageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 450,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image),
            ),
            ListView(
              children: [
                // LIST DETAIL
                SizedBox(height: 328),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // DETAIL
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                    index: index,
                                    rating: space.rating,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),

                      // MAIN FACILITIES
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kitchen',
                              imageUrl: 'assets/icon_kitchen.png',
                              total: space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'bedroom',
                              imageUrl: 'assets/icon_bed.png',
                              total: space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'cupboard',
                              imageUrl: 'assets/icon_cupboard.png',
                              total: space.numberOfCupboards,
                            ),
                          ],
                        ),
                      ),

                      // PHOTOS
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 12),
                      SizedBox(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(width: 24),
                            ...space.photos.map((item) {
                              return Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: item,
                                    fit: BoxFit.cover,
                                    width: 110,
                                    height: 88,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.broken_image),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // LOCATION
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: Text(
                    'Location',
                    style: regularTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(space.address, style: greyextStyle),
                          SizedBox(height: 2),
                          Text(space.city, style: greyextStyle),
                        ],
                      ),
                      InkWell(
                        onTap: () => {openUrl(space.mapUrl)},
                        child: Image.asset(
                          'assets/icon_btn_location.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ),

                // BUTTON BOOK NOW
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: edge),
                  height: 50,
                  width: MediaQuery.of(context).size.width - (2 * edge),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5843BE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    onPressed: () {
                      openUrl('tel:+${space.phone}');
                    },
                    child: Text(
                      'Book Now',
                      style: whiteTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),

            // BUTTON BACK & FAVORITE
            Positioned(
              top: 70,
              left: edge,
              right: edge,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/icon_btn_back.png', width: 40),
                  ),
                  Image.asset('assets/icon_btn_wishlist.png', width: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
