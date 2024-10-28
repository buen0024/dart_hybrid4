import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    var url = Uri.parse('https://random-data-api.com/api/v2/users?size=12');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      for (var user in jsonResponse) {
        String uid = user['uid'].toString();
        String firstName = user['first_name'];
        String lastName = user['last_name'];
        print('User Id: $uid, Name: $firstName $lastName');
      }
    } else {
      print('Failed to load users. Status code: ${response.statusCode}');
    }
  } catch (err) {
    print('Failed http request');
  }
}
