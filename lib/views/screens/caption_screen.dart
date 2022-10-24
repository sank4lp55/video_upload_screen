import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:video_upload/views/widgets/text_input_field.dart';
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
  late VideoPlayerController controller;
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();

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
                        fontSize: MediaQuery.of(context).size.width * 0.06),
                  )),
                  //Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.09,
              ),
              InkWell(
                onTap: () => {},
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
                        fontSize: MediaQuery.of(context).size.width * 0.06),
                  )),
                  //Icon(Icons.arrow_forward_ios_rounded),
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
          physics: BouncingScrollPhysics(),
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
                      child: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
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
                  color: Colors.green,
                ),
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 2.95,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
              Divider(
                color: Colors.teal.shade100,
                thickness: 1.0,
                indent: 15,
                endIndent: 15,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(10.0),
                  color: Colors.transparent,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.045,
                child: Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: const Text(
                          "# Add Hashtags ",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.teal.shade100,
                thickness: 1.0,
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
