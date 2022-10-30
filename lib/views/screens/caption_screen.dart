import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CaptionScreen extends StatefulWidget {
  // final File videoFile;
  // final String videoPath;
  const CaptionScreen({
    Key? key,
    // required this.videoFile,
    // required this.videoPath,
  }) : super(key: key);

  @override
  State<CaptionScreen> createState() => _CaptionScreenState();
}

class _CaptionScreenState extends State<CaptionScreen> {
  //late VideoPlayerController controller;
  // TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  var growableList = <String>[' '];
  String caption = "";
  //String hashtags = "";

  // UploadVideoController uploadVideoController =
  //     Get.put(UploadVideoController());

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     controller = VideoPlayerController.file(widget.videoFile);
  //   });
  //   controller.initialize();
  //   controller.play();
  //   controller.setVolume(1);
  //   controller.setLooping(true);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          // ignore: sort_child_properties_last
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.11,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery.of(context).size.width * 0.015)),
                  ),
                  child: Center(
                      child: Text(
                    "Discard",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.045),
                  )),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.09,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    caption = _captionController.text;
                    growableList = <String>[
                      ' '
                    ]; //Reinitializes list to empty list after every upload button tap.
                    caption =
                        "$caption "; // Adds an extra space at the end of caption to not miss out the last word.
                    String p = ""; //Stores each word of the string caption.

                    for (int i = 0; i < caption.length; i++) {
                      var ch = caption[i]; // Extracts each character .
                      if (ch != ' ') {
                        p = p + ch; // Forming of the word .
                      } else {
                        if (p.isNotEmpty && p[0] == '#') {
                          growableList.add(p);
                        }
                        p = "";
                      }
                    }

                    growableList.removeAt(0); // Removes first empty string .
                    // The Growable list now has all the Hastags used in the caption .
                    //print(growableList);
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.11,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery.of(context).size.width * 0.015)),
                  ),
                  child: Center(
                      child: Text(
                    "Upload",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.045),
                  )),
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
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
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
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: const Text(
                      "Add caption",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.045,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.grey,
                ),
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 2.95,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Caption",
                    hintText: "Write your Caption here",
                    fillColor: Colors.transparent,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 1, //Normal textInputField will be displayed
                  maxLines: 1000,
                  controller: _captionController,
                  // decoration: ThemeHelper().textInputDecoration(
                  //     'Applicant Name', 'Enter Applicant Name'),
                  validator: (val) {
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 15,
                endIndent: 15,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(10.0),
                  color: Colors.transparent,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.045,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        "#Add Hashtags ",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 15,
                endIndent: 15,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0),
              //     color: Colors.green,
              //   ),
              //   width: MediaQuery.of(context).size.width / 1,
              //   height: MediaQuery.of(context).size.height / 1.2,
              //   //child: VideoPlayer(controller),
              // ),
              const SizedBox(
                height: 30,
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.vertical,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
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
              //   height: 100,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     InkWell(
              //       onTap: () => {},
              //       child: Container(
              //         width: MediaQuery.of(context).size.width * 0.3,
              //         height: MediaQuery.of(context).size.width * 0.11,
              //         decoration: BoxDecoration(
              //           color: Colors.blue,
              //           borderRadius: BorderRadius.all(Radius.circular(
              //               MediaQuery.of(context).size.width * 0.015)),
              //         ),
              //         child: Center(
              //             child: Text(
              //           "Upload",
              //           style: TextStyle(
              //               fontSize:
              //                   MediaQuery.of(context).size.width *
              //                       0.06),
              //         )),
              //         //Icon(Icons.arrow_forward_ios_rounded),
              //       ),
              //     ),
              //     // ElevatedButton(
              //     //     onPressed: () =>
              //     //         {}, //uploadVideoController.uploadVideo(
              //     //     // _songController.text,
              //     //     // _captionController.text,
              //     //     // widget.videoPath),
              //     //     child: const Text(
              //     //       'Next',
              //     //     )),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.045,
              //     )
              //   ],
              // )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
