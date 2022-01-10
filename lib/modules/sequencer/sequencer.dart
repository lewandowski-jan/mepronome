import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metronome/common/app_colors.dart';
import 'package:metronome/hamburger_menu.dart';
import 'package:metronome/modules/sequencer/widgets/add_sequence.dart';
import 'package:metronome/modules/sequencer/widgets/sequence_tile.dart';
import 'package:metronome/utils/metro_audio.dart';
import 'package:provider/provider.dart';

class Sequencer extends HookWidget {
  Sequencer({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final sequencesList = useState(<Sequence>[]);
    final isPlaying = useState(false);
    final player = SequencePlayer(metro: context.read<MetroAudio>());
    final cancellable = CancelableCompleter();

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
                            children: [
                              ...sequencesList.value
                                  .asMap()
                                  .entries
                                  .map((e) => SequenceTile(
                                        sequence: e.value,
                                        onSave: (bpm, notes, note, repeats) {
                                          sequencesList.value[e.key] = Sequence(
                                            bpm: bpm,
                                            note: note,
                                            notesInSequence: notes,
                                            repeats: repeats,
                                          );
                                          sequencesList.value =
                                              sequencesList.value.toList();
                                        },
                                        onDelete: () {
                                          sequencesList.value.removeAt(e.key);
                                          sequencesList.value =
                                              sequencesList.value.toList();
                                        },
                                        onLongPress: () {
                                          if (isPlaying.value) {
                                          } else {
                                            isPlaying.value = true;
                                            cancellable.complete(
                                                player.playSequences(
                                                    sequencesList.value.sublist(e.key)));
                                            cancellable.operation.value
                                                .whenComplete(() =>
                                                    isPlaying.value = false);
                                          }
                                        },
                                      ))
                                  .toList(),
                              if (sequencesList.value.length < 9)
                                AddSequence(onClick: () {
                                  sequencesList.value.add(Sequence());
                                  sequencesList.value =
                                      sequencesList.value.toList();
                                }),
                            ],
                          ),
                          Spacer(),
                          Container(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                gradient:
                                    AppColors.gradientPrimaryAccentGradientDark,
                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  if (isPlaying.value) {
                                  } else {
                                    isPlaying.value = true;
                                    cancellable.complete(player
                                        .playSequences(sequencesList.value));
                                    cancellable.operation.value.whenComplete(
                                        () => isPlaying.value = false);
                                  }
                                },
                                child: Icon(
                                  isPlaying.value
                                      ? Icons.stop
                                      : Icons.play_arrow,
                                  size: 50,
                                  color: AppColors.PrimaryLight,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).padding.bottom + 10),
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
