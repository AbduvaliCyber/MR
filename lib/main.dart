import 'package:flutter/material.dart';

void main() {
  runApp(FifaApp());
}

class FifaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FIFA Davlatlari',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: FifaHomePage(),
    );
  }
}

class FifaHomePage extends StatefulWidget {
  @override
  _FifaHomePageState createState() => _FifaHomePageState();
}

class _FifaHomePageState extends State<FifaHomePage> {
  // 🌍 Davlatlar ro‘yxati
  List<Map<String, String>> davlatlar = [
    {
      "nom": "Ispaniya",
      "rasm": "https://flagcdn.com/w320/es.png",
      "info": "Futbol bo‘yicha 2010-yil Jahon chempioni.",
      "ustoz": "Eng mashhur futbolchi: Sergio Ramos",
    },
    {
      "nom": "Argentina",
      "rasm": "https://flagcdn.com/w320/ar.png",
      "info": "2022-yilgi Jahon chempioni.",
      "ustoz": "Eng mashhur futbolchi: Lionel Messi",
    },
    {
      "nom": "Portugaliya",
      "rasm": "https://flagcdn.com/w320/pt.png",
      "info": "2016-yilgi Yevropa chempioni.",
      "ustoz": "Eng mashhur futbolchi: Cristiano Ronaldo",
    },
    {
      "nom": "Fransiya",
      "rasm": "https://flagcdn.com/w320/fr.png",
      "info": "1998 va 2018-yil Jahon chempioni.",
      "ustoz": "Eng mashhur futbolchi: Kylian Mbappé",
    },
    {
      "nom": "Germaniya",
      "rasm": "https://flagcdn.com/w320/de.png",
      "info": "4 marta Jahon chempioni (1954, 1974, 1990, 2014).",
      "ustoz": "Eng mashhur futbolchi: Manuel Neuer",
    },
    {
      "nom": "O‘zbekiston",
      "rasm": "https://flagcdn.com/w320/uz.png",
      "info": "Markaziy Osiyodagi eng faol futbol davlatlaridan biri.",
      "ustoz": "Eng mashhur futbolchi: Eldor Shomurodov",
    },
  ];

  Map<String, String>? tanlangan;

  void _qidiruv() async {
    final natija = await showSearch(
      context: context,
      delegate: FifaSearchDelegate(davlatlar),
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
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Icon(Icons.flag, color: Colors.white),
            SizedBox(width: 8),
            Text("FIFA Davlatlari"),
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
          "Qidiruvdan biror davlatni tanlang 🌍",
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        )
            : SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bayroq
              Image.network(
                tanlangan!["rasm"]!,
                width: 150,
                height: 100,
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
              // Ma’lumot
              Text(
                tanlangan!["info"]!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey[800]),
              ),
              SizedBox(height: 20),
              // Eng mashhur futbolchi
              Text(
                tanlangan!["ustoz"]!,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔍 Qidiruv SearchDelegate
class FifaSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> davlatlar;

  FifaSearchDelegate(this.davlatlar);

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
    final results = davlatlar
        .where((j) => j["nom"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final davlat = results[index];
        return ListTile(
          leading: Image.network(
            davlat["rasm"]!,
            width: 50,
            height: 30,
            fit: BoxFit.contain,
          ),
          title: Text(davlat["nom"]!),
          subtitle: Text(davlat["info"]!),
          onTap: () {
            close(context, davlat);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = davlatlar
        .where((j) => j["nom"]!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final davlat = suggestions[index];
        return ListTile(
          leading: Image.network(
            davlat["rasm"]!,
            width: 40,
            height: 25,
            fit: BoxFit.contain,
          ),
          title: Text(davlat["nom"]!),
          subtitle: Text(davlat["info"]!),
          onTap: () {
            query = davlat["nom"]!;
            showResults(context);
          },
        );
      },
    );
  }
}
