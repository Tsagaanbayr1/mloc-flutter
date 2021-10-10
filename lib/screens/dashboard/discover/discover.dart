import 'package:flutter/material.dart';
import 'package:mloc/core/assets.dart';
import 'package:mloc/screens/dashboard/discover/event_details.dart';
import 'package:mloc/screens/dashboard/discover/notifications.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final eventImages = <Event>[
    Event(
      imageUrl: Assets.event1,
      title: 'VR',
      description: 'Vr is the future. Come here!',
      venues: 35,
      tax: 15,
      type: 'VRdwad',
      distance: 2.5,
    ),
    Event(
      imageUrl: Assets.event2,
      title: 'Arcade Gaming',
      description: 'We have dominating here!',
      venues: 75,
      tax: 45,
      type: 'Arcade Gaming',
      distance: 1.5,
    ),
    Event(
      imageUrl: Assets.event3,
      title: 'Fitness',
      description: 'Believe in yourself, just do it!',
      venues: 90,
      tax: 30,
      type: 'Fitness',
      distance: 2.0,
    ),
    Event(
      imageUrl: Assets.event4,
      title: 'Skate Stuff',
      description: 'Stunning things here! We got talented people',
      venues: 12,
      tax: 20,
      type: 'Skate Stuff',
      distance: 2.2,
    ),
    Event(
      imageUrl: Assets.event5,
      title: 'Basketball',
      description: 'Not for shorts.',
      venues: 54,
      tax: 15,
      type: 'Basketball',
      distance: 0.5,
    ),
  ];

  bool searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: searching
            ? BackButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() => searching = false);
                },
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.pngLogo),
              ),
        actions: [
          if (searching)
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_alt_rounded),
            )
          else
            IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsScreen(),
                  ),
                );
              },
            ),
        ],
        title: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.grey[200],
            filled: true,
            hintText: 'What are you looking for?',
            contentPadding: EdgeInsets.only(
              top: kToolbarHeight / 4,
              left: 10,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ),
          onTap: () => setState(() => searching = true),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Title(title: 'Explore'),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: [
                  for (var item in eventImages) _ExploreItem(item: item),
                ],
              ),
            ),
            const _Title(title: 'Popular near you'),
            for (var item in eventImages) _PopularNearYouWidget(item: item),
          ],
        ),
      ),
    );
  }
}

class _PopularNearYouWidget extends StatelessWidget {
  const _PopularNearYouWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Event item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDetailsScreen(),
            ),
          );
        },
        child: Row(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                  ),
                  Text(
                    '\$${item.tax} / entry',
                  ),
                  Text(
                    '${item.type}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${item.distance} kms away',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      SizedBox(width: 5),
                      Text('·'),
                      SizedBox(width: 5),
                      Text(
                        '4.8',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.blue,
                            ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExploreItem extends StatelessWidget {
  const _ExploreItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Event item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsScreen(),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                '${item.venues} Venues',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key, required this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 20,
        bottom: 20,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class Event {
  final String imageUrl;
  final String title;
  final String description;
  final int venues;
  final int tax;
  final String type;
  final double distance;

  Event({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.venues,
    required this.tax,
    required this.type,
    required this.distance,
  });
}
