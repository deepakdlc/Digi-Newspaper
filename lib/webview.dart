import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebBr extends StatefulWidget {
  @override
  _WebBrState createState() => _WebBrState();
}

class _WebBrState extends State<WebBr> {

  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://www.google.com/search?q=";
  var uurl;


  launchUrl() {
    setState(() {
      if(controller.text == null)
        {
          flutterWebviewPlugin.reloadUrl("https://www.google.com/");
        }
      else {
        uurl = urlString + controller.text;
        flutterWebviewPlugin.reloadUrl(uurl);
      }
    });
  }






  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(appBar: AppBar(

      backgroundColor: Colors.black12,

      title: TextField(

        autofocus: false,
        controller: controller,
        textInputAction: TextInputAction.go,
        onSubmitted: (url) => launchUrl(),
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(icon: Image.asset('images/google.png'),

          hintText: 'Search',
          contentPadding: EdgeInsets.fromLTRB(
              20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
      actions: <Widget>[

        IconButton(
          icon:
              Image.asset('images/search.png'),
          onPressed: () => launchUrl(),
        )

      ],
    ),

      url: uurl == null ? "https://aajtak.intoday.in/" : uurl,
      withZoom: false,
    );
  }
}
