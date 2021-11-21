import 'package:flutter/material.dart';

import 'common/app_colors.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.PrimaryLight,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(''),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/mepronome_logo.png',
                  ),
                ),
              ),
            ),
            ListTile(
              leading:  Icon(Icons.arrow_forward_ios_rounded),
              title: const Text('Metronom',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 21,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading:  Icon(Icons.arrow_forward_ios_rounded),
              title: const Text('Stwórz sekwencję',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 21,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading:  Icon(Icons.arrow_forward_ios_rounded),
              title: const Text('Wczytaj sekwencję',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 21,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading:  Icon(Icons.arrow_forward_ios_rounded),
              title: const Text('Ustawienia',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 21,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading:  Icon(Icons.arrow_forward_ios_rounded),
              title: const Text(
                'Twórcy',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 21,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}