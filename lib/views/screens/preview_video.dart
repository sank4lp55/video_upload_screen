import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_upload/views/screens/caption_screen.dart';
import 'package:video_player/video_player.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';

class PreviewVideoScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const PreviewVideoScreen({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<PreviewVideoScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<PreviewVideoScreen> {
  late VideoPlayerController controller;
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime = "00:00";
  // TextEditingController _songController = TextEditingController();
  // TextEditingController _captionController = TextEditingController();

  // UploadVideoController uploadVideoController =
  //     Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: VideoPlayer(controller),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Container(
                        //   margin: const EdgeInsets.symmetric(horizontal: 10),
                        //   width: MediaQuery.of(context).size.width - 20,
                        //   child: TextInputField(
                        //     controller: _songController,
                        //     labelText: 'Song Name',
                        //     icon: Icons.music_note,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   margin: const EdgeInsets.symmetric(horizontal: 10),
                        //   width: MediaQuery.of(context).size.width - 20,
                        //   child: TextInputField(
                        //     controller: _captionController,
                        //     labelText: 'Caption',
                        //     icon: Icons.closed_caption,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            MediaQuery.of(context).size.width *
                                                0.11 /
                                                2)),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.50,
                                  height:
                                      MediaQuery.of(context).size.width * 0.11,
                                  child:
                                      const Center(child: Text("Choose Song")),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const CaptionScreen(
                                        // videoFile: File(video),
                                        // videoPath: video,
                                        ),
                                  ),
                                )
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.11,
                                height:
                                    MediaQuery.of(context).size.width * 0.11,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.11 /
                                              2)),
                                ),
                                child:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                            ),
                            // ElevatedButton(
                            //     onPressed: () =>
                            //         {}, //uploadVideoController.uploadVideo(
                            //     // _songController.text,
                            //     // _captionController.text,
                            //     // widget.videoPath),
                            //     child: const Text(
                            //       'Next',
                            //     )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.045,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () => {Navigator.pop(context)},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.11,
                      height: MediaQuery.of(context).size.width * 0.11,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.11 / 2)),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
