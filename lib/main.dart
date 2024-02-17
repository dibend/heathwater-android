import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Heathwater Investment Research Tools'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _huggingFaceButton(
                context,
                '5 years in the future asset price predicting AI 🤖',
                'https://huggingface.co/spaces/dibend/OracleOfNewProvidence'),
            SizedBox(height: 20), // Gap
            Divider(), // Line
            SizedBox(height: 20), // Gap
            _huggingFaceButton(
                context,
                'U.S. Residential Average Price Graph by Zip Code 🏠',
                'https://huggingface.co/spaces/dibend/US-Residential-Real-Estate-Average-Price-By-Zip'),
            SizedBox(height: 20), // Gap
            Divider(), // Line
            SizedBox(height: 20), // Gap
            _huggingFaceButton(
                context,
                'Asset Price Linear Regression Model 📈',
                'https://huggingface.co/spaces/dibend/asset-price-linear-regression'),
            SizedBox(height: 20), // Gap
            Divider(), // Line
            SizedBox(height: 20), // Gap
            _huggingFaceButton(
                context,
                'U.S. Residential Average Price Linear Regression Model 🏘️',
                'https://huggingface.co/spaces/dibend/real-estate-linear-regression'),
            SizedBox(height: 20), // Gap
            Divider(), // Line
            SizedBox(height: 20), // Gap
            _huggingFaceButton(
                context,
                'Stock Price Candlestick Grapher with Dividends and Moving Averages 🕯️',
                'https://huggingface.co/spaces/dibend/stock-dock'),
          ],
        ),
      ),
    );
  }

  Widget _huggingFaceButton(BuildContext context, String title, String url) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => WebViewScreen(url: url, title: title))),
      child: Text(title),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;

  const WebViewScreen({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
