import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudiopageController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Play network sound
  Future<void> playSound(String url) async {
    try {
      await _audioPlayer.setUrl(url); // Set network audio URL
      await _audioPlayer.play(); // Play the audio
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  void onClose() {
    // _audioPlayer.dispose(); // Dispose player on close
    super.onClose();
  }
}

// Initialize Controller
final AudiopageController audiopageController = Get.put(AudiopageController());

final List<String> audioUrls = [
  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
  "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Kevin_MacLeod/Windswept/Kevin_MacLeod_-_Windswept.mp3",
  "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/no_curator/Scott_Holmes/Scott_Holmes_-_Positive_And_Fun.mp3",
];
