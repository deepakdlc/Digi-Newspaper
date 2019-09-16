import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

var technology="https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=b813e5b6bebb4f50828cd62661ccac30";
var business="https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=b813e5b6bebb4f50828cd62661ccac30";
var entertainment="https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=b813e5b6bebb4f50828cd62661ccac30";
var health="https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=b813e5b6bebb4f50828cd62661ccac30";
var science="https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=b813e5b6bebb4f50828cd62661ccac30";
var sports="https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=b813e5b6bebb4f50828cd62661ccac30";



class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("News"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
      child:Column(
        children: <Widget>[
          Card(
            child: ListTile(
              title : Text("Sports "),
              subtitle: SizedBox(height: 10.0,),
              trailing: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/55/55243.png")),
              onTap:(){ Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => News(text: sports,name: "Sports News",),
                  ));
              },
            ),
          ),
          Card(
            child: ListTile(
              title : Text("Business "),
              subtitle: SizedBox(height: 10.0,),
              trailing: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/57/57134.png"),),
              onTap:(){ Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => News(text: business,name: "Business News",),
                  ));
              },
            ),
          ),
          Card(
            child: ListTile(
              title : Text("Technology"),
              subtitle: SizedBox(height: 10.0,),
              trailing: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/22/22819.png")),
              onTap:(){ Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => News(text: technology,name: "Technology news",),
                  ));
              },
            ),
          ), Card(
            child: ListTile(
              title : Text("Science "),
              subtitle: SizedBox(height: 10.0,),
              trailing: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/40/40488.png"),),
              onTap:(){ Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => News(text: science,name: "Science News",),
                  ));
              },
            ),
          ), Card(
            child: ListTile(
              title : Text("Entertainment "),
              subtitle: SizedBox(height: 10.0,),
              trailing: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/68/68966.png"),),
              onTap:(){ Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => News(text: entertainment,name: "Entertainment News",),
                  ));
              },
            ),
          ), Card(
            child: ListTile(
              title : Text("Health "),
              subtitle: SizedBox(height: 10.0,),
              trailing: Image(image: NetworkImage("https://image.flaticon.com/icons/png/512/90/90593.png"),),
              onTap:(){ Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => News(text: health,name: "Health News",),
                  ));
              },
            ),
          )
        ],
      )
      ));
  }


}



class News extends StatefulWidget {
  final String text;
  final String name;
  News({Key key,  this.text,this.name}) : super(key: key);
  @override
  NewsState createState() => NewsState(text , name);
}


class NewsState extends State<News> {
  Map data;
  List userData;
  String url;
  String newstype;
  NewsState(this.url,this.newstype);


  Future getdata() async{

      http.Response response = await http.get(url);
      data = json.decode(response.body);

      setState(() {
        userData = data["totalResults"];
      });
    }


  void initState(){
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return userData == null ? Scaffold(
      backgroundColor: Colors.deepPurple,
      body:
            Center(
              
              child:
              CircularProgressIndicator(
                backgroundColor: Colors.orange,
                strokeWidth: 10.0,),
            ),

    ):
    Scaffold(
      appBar: AppBar(centerTitle: true,
      title: Text("$newstype"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple,
      body: ListView.builder(
        itemCount:userData == null ? 0 : userData.length - 1,

          itemBuilder: (BuildContext context, int index)
    {
      return  Card(
        child: ListTile(


        trailing: Image.network(
        userData[index]["urlToImage"], fit: BoxFit.cover,
        width: 100.0,
        height: 100.0,),


          title: Text("${userData[index]["title"]}}", style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
          ),


          subtitle: Text(
            "${userData[index]["description"]} \n\n ${userData[index]["content"]}}",
            style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold),),
        ),
      );
    }
    ));
  }
}

