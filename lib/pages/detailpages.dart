// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lagu_daerah/models/province.dart';

class DetailPages extends StatefulWidget {
  //properti variabel penampung data models
  //membuat object
  final Province province;

  //constructor
  const DetailPages({
    Key? key,
    required this.province,
  }) : super(key: key);

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      //-- appBar
      appBar: AppBar(
        //representasikan = final Province province;
        //tampilkan data dari model data dari variabel province
        title: Text(
          //textAlign: TextAlign.center,
          widget.province.nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      */

      //-- body
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            textAlign: TextAlign.center,
            widget.province.nama,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 4,
          ),

          //Row untuk menu horizontal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                widget.province.laguDaerah,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ), //circelAvatar
              const FavoriteButton(),
            ],
          ),

          /*
          Text(
            textAlign: TextAlign.center,
            widget.province.laguDaerah,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          */
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.province.ibuKota,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 2,
          ),

          //-- gambar
          Image.network(
            widget.province.photo,
            height: 300,
          ),

          const SizedBox(
            height: 12,
          ),

          //-- lirik diberi kontainer cover
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              widget.province.lirikLaguDaerah,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

//tombol favorite
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
