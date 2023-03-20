import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  SliderProvider? sliderProviderTrue;
  SliderProvider? sliderProviderFalse;

  @override
  Widget build(BuildContext context) {
    sliderProviderTrue = Provider.of<SliderProvider>(context, listen: true);
    sliderProviderFalse = Provider.of<SliderProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Image Slider"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 300,
                    height: 200,
                    child: Image.asset(
                      "${sliderProviderTrue!.images[index]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.easeInCubic,
                autoPlayAnimationDuration: Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  sliderProviderFalse!.changeindex(index);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: sliderProviderTrue!.images
                  .asMap()
                  .entries
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: sliderProviderTrue!.indexofinage == e.key
                              ? Colors.black
                              : Colors.black45,
                          shape: BoxShape.circle),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
