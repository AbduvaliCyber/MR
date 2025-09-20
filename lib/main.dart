import 'package:flutter/material.dart';

void main() {
  runApp(EduApp());
}

class EduApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'O‘quv markazlari',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: EduHomePage(),
    );
  }
}

class EduHomePage extends StatefulWidget {
  @override
  _EduHomePageState createState() => _EduHomePageState();
}

class _EduHomePageState extends State<EduHomePage> {
  // 📚 O‘quv markazlari ro‘yxati
  List<Map<String, String>> markazlar = [
    {
      "nom": "Sky English",
      "rasm":
      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
      "info": "Ingliz tili kurslari, IELTS va CEFR tayyorlov markazi.",
      "ustoz": "Eng mashhur ustoz: Mr. John",
    },
    {
      "nom": "IT Park Academy",
      "rasm":
      "https://cdn-icons-png.flaticon.com/512/2721/2721292.png",
      "info": "Dasturlash, web va mobil ilovalar bo‘yicha kurslar.",
      "ustoz": "Eng mashhur ustoz: Akmal Programmer",
    },
    {
      "nom": "Najot Ta'lim",
      "rasm":
      "https://cdn-icons-png.flaticon.com/512/3135/3135810.png",
      "info": "Frontend, Backend, Python, Flutter, Grafik dizayn.",
      "ustoz": "Eng mashhur ustoz: Azizbek Najotov",
    },
    {
      "nom": "Cambridge Learning Center",
      "rasm":
      "https://cdn-icons-png.flaticon.com/512/3135/3135773.png",
      "info": "Bolalar va kattalar uchun ingliz tili kurslari.",
      "ustoz": "Eng mashhur ustoz: Miss Sarah",
    },
    {
      "nom": "Matematika Pro",
      "rasm":
      "https://cdn-icons-png.flaticon.com/512/3135/3135755.png",
      "info": "Oliy matematika, maktab imtihonlariga tayyorlov kurslari.",
      "ustoz": "Eng mashhur ustoz: Professor Karimov",
    },
    {
      "nom": "ABU-TECH",
      "rasm":
      "https://cdn-icons-png.flaticon.com/512/3135/3135768.png", // logotip sifatida texnika ikonkasi
      "info": "IT, Robototexnika, va Zamonaviy texnologiyalar kurslari.",
      "ustoz": "Eng mashhur ustoz: Mr. Otabek",
    },
  ];

  Map<String, String>? tanlangan;

  void _qidiruv() async {
    final natija = await showSearch(
      context: context,
      delegate: EduSearchDelegate(markazlar),
    );

    if (natija != null) {
      setState(() {
        tanlangan = natija;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Icon(Icons.school, color: Colors.white),
            SizedBox(width: 8),
            Text("O‘quv markazlari"),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _qidiruv,
          ),
        ],
      ),
      body: Center(
        child: tanlangan == null
            ? Text(
          "Qidiruvdan biror o‘quv markazni tanlang 📚",
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        )
            : SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logotip
              Image.network(
                tanlangan!["rasm"]!,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 16),
              // Nom
              Text(
                tanlangan!["nom"]!,
                style:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Yo‘nalish
              Text(
                tanlangan!["info"]!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),
              SizedBox(height: 20),
              // Eng mashhur ustoz
              Text(
                tanlangan!["ustoz"]!,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔍 Qidiruv SearchDelegate
class EduSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> markazlar;

  EduSearchDelegate(this.markazlar);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = markazlar
        .where((j) => j["nom"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final markaz = results[index];
        return ListTile(
          leading: Image.network(
            markaz["rasm"]!,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          title: Text(markaz["nom"]!),
          subtitle: Text(markaz["info"]!),
          onTap: () {
            close(context, markaz);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = markazlar
        .where((j) => j["nom"]!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final markaz = suggestions[index];
        return ListTile(
          leading: Image.network(
            markaz["rasm"]!,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          title: Text(markaz["nom"]!),
          subtitle: Text(markaz["info"]!),
          onTap: () {
            query = markaz["nom"]!;
            showResults(context);
          },
        );
      },
    );
  }
}
