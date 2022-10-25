import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_trimmer/video_trimmer.dart';
import 'package:video_upload/views/screens/preview_video.dart';

class TrimVideoScreen extends StatefulWidget {
  final File file;
  final String videoPath;
  //final String videoPath;
  const TrimVideoScreen({
    Key? key,
    required this.file,
    required this.videoPath,
    //required this.videoPath,
  }) : super(key: key);
  @override
  _TrimVideoScreenState createState() => _TrimVideoScreenState();
}

class _TrimVideoScreenState extends State<TrimVideoScreen> {
  final Trimmer _trimmer = Trimmer();

  double _startValue = 0.0;
  double _endValue = 0.0;

  bool _isPlaying = false;
  bool _progressVisibility = false;

  Future<String?> _saveVideo() async {
    setState(() {
      _progressVisibility = true;
    });

    String? _value;

    await _trimmer
        .saveTrimmedVideo(
      startValue: _startValue,
      endValue: _endValue,
      onSave: (String? outputPath) {
        final video = outputPath;
        // File file = File(video.path);
        if (video != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PreviewVideoScreen(
                videoFile: File(video),
                videoPath: video,
              ),
            ),
          );
        }
      },
    )
        .then((value) {
      setState(() {
        _progressVisibility = false;
        value = value;
      });
    });

    return _value;
  }

  void _loadVideo() {
    _trimmer.loadVideo(videoFile: widget.file);
  }

  @override
  void initState() {
    super.initState();

    _loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Trimmer"),
      ),
      body: Builder(
        builder: (context) => Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Visibility(
                  visible: _progressVisibility,
                  child: const LinearProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // _saveVideo().then((outputPath) {
                    //   print('OUTPUT PATH: $outputPath');
                    //   final snackBar = SnackBar(
                    //       content: Text('Video Saved successfully'));
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     snackBar,
                    //   );
                    // });
                    final video = await _saveVideo();
                    // File file = File(video.path);
                  },
                  child: const Text("SAVE"),
                ),
                Expanded(
                  child: VideoViewer(trimmer: _trimmer),
                ),
                Center(
                  child: TrimEditor(
                    trimmer: _trimmer,
                    viewerHeight: 50.0,
                    viewerWidth: MediaQuery.of(context).size.width,
                    maxVideoLength: Duration(seconds: 60),
                    onChangeStart: (value) {
                      _startValue = value;
                    },
                    onChangeEnd: (value) {
                      _endValue = value;
                    },
                    onChangePlaybackState: (value) {
                      setState(() {
                        _isPlaying = value;
                      });
                    },
                  ),
                ),
                TextButton(
                  child: _isPlaying
                      ? const Icon(
                          Icons.pause,
                          size: 80.0,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.play_arrow,
                          size: 80.0,
                          color: Colors.white,
                        ),
                  onPressed: () async {
                    bool playbackState = await _trimmer.videPlaybackControl(
                      startValue: _startValue,
                      endValue: _endValue,
                    );
                    setState(() {
                      _isPlaying = playbackState;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
