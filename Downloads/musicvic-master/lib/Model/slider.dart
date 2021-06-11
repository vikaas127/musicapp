class Slidert {
  String bannerSliderId;
  String bannerSliderImage;
  String bannerSliderLink;

  Slidert({this.bannerSliderId, this.bannerSliderImage, this.bannerSliderLink});

  Slidert.fromJson(Map<String, dynamic> json) {
    bannerSliderId = json['banner_slider_id'];
    bannerSliderImage = json['banner_slider_image'];
    bannerSliderLink = json['banner_slider_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_slider_id'] = this.bannerSliderId;
    data['banner_slider_image'] = this.bannerSliderImage;
    data['banner_slider_link'] = this.bannerSliderLink;
    return data;
  }
}
