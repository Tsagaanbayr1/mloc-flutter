import 'package:flutter/material.dart';
import 'package:mloc/core/assets.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProfileDetails(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  'Account',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                  ),
                ),
              ),
              ListTile(
                title: Text('Account Information'),
                subtitle: Text('Change your account information'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Wallet'),
                subtitle: Text('Manage payment methods'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Favorites'),
                subtitle: Text('Manage favorites'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Friends'),
                subtitle: Text('Manage friends'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Settings'),
                subtitle:
                    Text('Change application, language & notification options'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('Deactivate Account'),
                subtitle: Text('Manage closure of your MLOC account'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Material(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.indigo],
          stops: [0, 1],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        Assets.avatar,
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Roger Sanchez',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'R.Sanchez@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '931',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: 'points'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Material(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: InkWell(
                onTap: () {},
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.redeem,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Redeem',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
