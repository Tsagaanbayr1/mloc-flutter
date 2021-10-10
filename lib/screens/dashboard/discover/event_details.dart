import 'package:flutter/material.dart';
import 'package:mloc/core/assets.dart';

class EventDetailsScreen extends StatefulWidget {
  EventDetailsScreen({Key? key}) : super(key: key);

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  final controller = ScrollController();
  final List<String> coverImages = [
    Assets.event1,
    Assets.event2,
    Assets.event3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              _CoverImageSlider(coverImages: coverImages),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text('SUMMARY'),
                      Row(
                        children: [
                          Column(
                            children: [],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoverImageSlider extends StatelessWidget {
  const _CoverImageSlider({
    Key? key,
    required this.coverImages,
  }) : super(key: key);

  final List<String> coverImages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: PageView(
          children: [
            for (var item in coverImages)
              Image.asset(
                item,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
