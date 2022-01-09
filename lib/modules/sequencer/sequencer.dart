import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metronome/common/app_colors.dart';
import 'package:metronome/hamburger_menu.dart';
import 'package:metronome/modules/sequencer/widgets/add_sequence.dart';
import 'package:metronome/modules/sequencer/widgets/sequence.dart';

class Sequencer extends HookWidget {
  Sequencer({Key? key}) : super(key: key);

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final sequencesList = useState(<Widget>[]);
    final sequenceIndex = useState(0);

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 24, 0, 16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/mepronome_logo.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                      ),
                      gradient: AppColors.gradientPrimaryDarkGradientDark,
                    ),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50, width: double.infinity),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [...sequencesList.value,AddSequence(onClick: (){
                          if(sequencesList.value.length<9) {
                            sequencesList.value = [...sequencesList.value,
                              Sequence(index: sequenceIndex.value)];
                            sequenceIndex.value++;
                          }
                        },)],
                      ),
                    ],
                  ),
                  ),
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
              icon: Icon(Icons.menu, size: 33, color: Colors.black,), // change this size and style
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
