import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Model/category.dart';
import 'package:musicvic/Model/slider.dart';
import 'package:musicvic/core/api/api.dart';



class AdvertisementList extends StatefulWidget {
 final  List<Slidert> ads;
  const AdvertisementList({ Key key, @required this.ads}): super(key: key);
  @override
  _AdvertisementListState createState() => _AdvertisementListState();
}

class _AdvertisementListState extends State<AdvertisementList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.ads.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(end: 12.0),
              child: FadedScaleAnimation(
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network('${Api.banner_image_url}${widget.ads[index].bannerSliderImage}')),
              ),
            );
          }),
    );
  }
}
