import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class GambarScreen extends StatefulWidget {
  const GambarScreen({Key? key}) : super(key: key);

  @override
  State<GambarScreen> createState() => _GambarScreenState();
}

class _GambarScreenState extends State<GambarScreen> {
  String? namaHewan;
  final player = AudioPlayer();

  void gantiNama(String inputNama) {
    setState(() {
      namaHewan = inputNama;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jenis-Jenis Hewan"),
        backgroundColor: Color.fromARGB(255, 169, 59, 42),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImage("Bebek", "asset_media/gambar/bebek.jpeg",
                  "asset_media/suara/bebek.mp3"),
              buildImage("Harimau", "asset_media/gambar/harimau.jpeg",
                  "asset_media/suara/harimau.mp3"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImage("Kelinci", "asset_media/gambar/kelinci.jpeg",
                  "asset_media/suara/kelinci.mp3"),
              buildImage("Kucing", "asset_media/gambar/kucing.jpg",
                  "asset_media/suara/kucing.mp3"),
            ],
          ),
          buildImage("Pinguin", "asset_media/gambar/pinguin.jpeg",
              "asset_media/suara/pinguin.mp3"),
          SizedBox(height: 10),
          Visibility(
            visible: namaHewan != null,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(namaHewan ?? "",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String nama, String imagePath, String audioPath) {
    return GestureDetector(
      onTap: () async {
        gantiNama(nama);
        await player.setAsset(audioPath);
        await player.play();
      },
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.all(8.0),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          if (namaHewan == null && nama == "Pinguin")
            ElevatedButton(
              onPressed: () {
                gantiNama(nama);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 238, 101, 194)),
              ),
              child: Text("Klik Gambar", style: TextStyle(color: Colors.white)),
            ),
        ],
      ),
    );
  }

  static AudioPlayer() {}
}
