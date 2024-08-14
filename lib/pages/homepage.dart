import 'package:flutter/material.dart';
import 'package:lagu_daerah/models/province.dart';
import 'package:lagu_daerah/pages/detailpages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //gambar background di luar Scaffold diberi Container
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/img/background.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //--- appBar Header
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Aplikasi Lagu Daerah',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 5,
        ),

        //--- isi data
        body: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              //wrap dengan inkwell agar bisa diklik
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailPages(
                        province: laguDaerahList[index],
                      );
                    },
                  ),
                );
              },
              child: Card(
                //wrap dengan widget card
                child: ListTile(
                  title: Text(laguDaerahList[index].laguDaerah),
                  subtitle: Text(
                      '${laguDaerahList[index].nama} - ${laguDaerahList[index].ibuKota}'),
                  leading: Image.network(
                    laguDaerahList[index].photo,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          //diulang sebanyak data yg ada
          itemCount: laguDaerahList.length,
        ),

        //--- footer
        bottomNavigationBar: const BottomAppBar(
          color: Colors.orange,
          height: 70,
          child: Center(
            child: Column(
              children: [
                Text(
                  'Daus',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  'Copyright © 2024',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
