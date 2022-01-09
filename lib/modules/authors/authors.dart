import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metronome/common/app_colors.dart';
import 'package:metronome/common/app_text_styles.dart';
import 'package:metronome/hamburger_menu.dart';

class Authors extends HookWidget {
  Authors();

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isPlaying = useState(false);
    final bpm = useState(128.0);
    return Scaffold(
      drawer: HamburgerMenu(),
      backgroundColor: AppColors.PrimaryLight,
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          SafeArea(
            bottom: false,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(24),
                    child: Image.asset(
                      'assets/mepronome_logo.png',
                    ),
                  ),
                  Expanded(

                    child: Container(
                        //color:Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: Column(children: [
                            const SizedBox(height:10),
                            Text(
                              'TWÓRCY',
                              style: AppTextStyles.blue,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              //style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          const SizedBox(height:8),
                            RichText(

                              textAlign: TextAlign.center,
                              text: new TextSpan(
                                style:AppTextStyles.black,

                                children: <TextSpan>[
                                  new TextSpan(text: 'Product Owner\n', style: new TextStyle(fontWeight: FontWeight.bold),),
                                  new TextSpan(text: 'Jan Lewandowski\n'),
                                  new TextSpan(text: 'Scrum Master\n', style: new TextStyle(fontWeight: FontWeight.bold, height:2.3),),
                                  new TextSpan(text: 'Oskar Zając\n'),
                                  new TextSpan(text: 'Developers\n', style: new TextStyle(fontWeight: FontWeight.bold,height:2.3),),
                                  new TextSpan(text: 'Michał Kowalik\n'),
                                  new TextSpan(text: 'Rafał Wolert\n'),
                                  new TextSpan(text: 'Mateusz Mianowany'),
                                ],
                              ),

                            )

                          ]
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
          new Positioned(
            top: 0.0,
            left: 2.0,
            right: 0.0,
            child: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 33,
                  color: Colors.black,
                ), // change this size and style
                onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0, //Shadow gone
            ),
          ),
        ],
      ),
    );
  }
}
