import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> sendQuery(String query) async {
  // print(query);
  var url = 'https://howiebackend.onrender.com/api/query/message';

  var data = {'prompt': query};
  try {
    String reply = await http
        .post(Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
            },
            body: jsonEncode(data))
        .then((response) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map<String, dynamic> body = jsonDecode(response.body)['message'];
      String reply = body['content'];
      // reply = reply.replaceAll(RegExp(r"\t|\n"), "");

      return reply.substring(2);
    });

    return reply;
  } catch (e) {
    print(e);
    return 'Error';
  }

  // print(response.body);
}
