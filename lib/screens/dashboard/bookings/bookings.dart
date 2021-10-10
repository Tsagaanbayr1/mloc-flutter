import 'package:flutter/material.dart';
import 'package:mloc/core/assets.dart';
import 'package:mloc/screens/dashboard/bookings/booking_details.dart';

class BookingsScreen extends StatefulWidget {
  BookingsScreen({Key? key}) : super(key: key);

  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  var _selectedStatus = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        leadingWidth: 0,
        title: Text(
          'Your bookings',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.calendar_today_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _BookingStatusButton(
                label: 'Ongoing',
                onTap: _onStatusChange,
                index: 0,
                isActive: _selectedStatus == 0,
              ),
              _BookingStatusButton(
                label: 'Upcoming',
                onTap: _onStatusChange,
                index: 1,
                isActive: _selectedStatus == 1,
              ),
              _BookingStatusButton(
                label: 'Completed',
                onTap: _onStatusChange,
                index: 2,
                isActive: _selectedStatus == 2,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Upcoming Bookings for   ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '1/1/2022',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: _generateEventList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onStatusChange(int index) {
    setState(() => _selectedStatus = index);
  }

  List<Widget> _generateEventList() {
    var list = List.generate(
      10,
      (index) => _EventListItem(),
    );
    var generatedList = <Widget>[];
    for (var index = 0; index < list.length; index++) {
      generatedList.add(list[index]);
      if (index != list.length - 1) {
        generatedList.add(
          Divider(),
        );
      }
    }

    return generatedList;
  }
}

class _EventListItem extends StatelessWidget {
  const _EventListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingDetailsScreen(),
          ),
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text('10:00 PM'),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.event1,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VR Realm 247',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        'Virtual Reality Arcade',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingStatusButton extends StatelessWidget {
  const _BookingStatusButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.isActive,
    required this.index,
  }) : super(key: key);

  final String label;
  final bool isActive;
  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(index),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Colors.grey : Colors.grey[200],
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 25,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
