import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';


//credentials
const _credentials =r'''
{
  "type": "service_account",
  "project_id": "fluttergsheets-406721",
  "private_key_id": "c76e0c515317c07cd46286dc5217c9e1203b8b55",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC16iTZmGG+kLuV\nlZsAQEj2ryYir5XzPSD5fip1lBSdsSvw/HZKjW5JaWxNsZW35jNy7lM60nWFdEay\nzYmohyeuSvar9wofRbcrCSDKUhzHzR+ra7ZV6+FDztlJPsxznrCaax+5s5CaYo2w\nDaLa4Brsoyw3Y4Cm6+iCXy06IJjSZNK9XlIsBrwPiLTXtN8cfJHEPizzjDVKXzRF\n7R72l9GBddV2ADuKH/wluvx9igP8MtzuwGOJOZ5dZtN7/FN3fsivJrltyQTJhzDE\n4iD+ArY2njCXldlovFgG1adCdLC7eEWwjJHF7PBmmlV6FxoMK0WJG5TjOJ1bpdMP\nFrNAKbVtAgMBAAECggEAJVpzwJ5yi5/KdNeoYS/SC51BVmP5hV2q9K/8ZfJHHW4w\n2KXuYDaUS8yy6W0qkf1Z2SKowm5OpV2P2s0rlAhUlIxeBEeQs4UsLFEOg5zCviAX\nfap7YT8zHSpPIaQcdS1DlCGk/QurCJhuAZV7ODhGLwr+XE05MI1GS+bhMYtZ9fFX\nJKx641YeeuRF7bD3RbRVbH5tqf1i9x2S4bwV1RITqTfiWmUraAuZffgrL+rNerC8\n5xjP/hTawxmii9Hkn078sSJ29aGUcVMtI21nvrRee0IzX5ukuXEGnIXRraCJ7KRc\n5a01TAOjXh6CGWN4SsisaqNpNDtF+aiQtP5KHVYaoQKBgQDm63VDnvQE8VNZY5UC\nmTV64bw4J8pb/qQ0LIvHsY6CkMYzM7QoflHnVxlyrZNt1qWjSG5b6FaT9/SsaJe9\n1UwhiFuIEQ4/r2jDP6PIAuHpp6AEDQb+Hf5Ea+2hFTF/zusKEZ+Y0xkB+1vjujb/\n7mlO7NJPb7APito+zl7hX6EyZQKBgQDJrCMCzEnKwAcJziB9ZrsXtMJAuuHipVcW\ntlgfad4hRy0B2NbzPBFRv3AJOwJMJ5ohgw5hXVZOrDS7eEkWSTtsO7d2rqddT7JK\nAtOkJBVrX9IL3McLvkvbrzceyOi5Pk85kMUoGoze/tS+zABo+6sJP2XAp5eApxD4\nWBkar/ZCaQKBgFrW43FvdUUAfi5a60JzbMNjS7y3gnaADK5tm6s54Prh4uY/f66y\nSpv7+onPWIDMAKrkEm3bTzu0Pi8YkiDeaK2ES6WSOA27fjXYsiA7ag2VoHAXg9mx\niNX3syo8ARXrGzEBz8u5t0u9St+h4IL7kbe3l+Ah6puinso4OsDj8rC1AoGAK7Pr\n2l1e2FsIq21JySMMBDUdq11UOgNOfhOBwTz18Aw2iqHs4sTvk+GCa92nv80NL5nw\n8dSCMYZL3xxP6k5wXCIMveFXT3dH0ZYPOxC+u4gGQp/TWo4gbjjoHvm2xP3luTnQ\nH8KxKFnczIP0ystO4zAj4r3urOiHWunsdsYO/ZECgYB1ELFRBApeLbcyM3zoZC1J\neRtVn3k/EPZJdk2YgJXYBXe5/ZJHZlGpIooG9dK9Pdg2fpKVShdZvE2SsxPn5bkS\nWVVnSpn7fmIM3HBDYqI8PHtfLcohA8tk4UyCMD1Nl0L3/0ZUr2fhAUz5lX3dU/Mx\nlMfiCnC657v8eN/eSLP+Pg==\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheets-tutorial@fluttergsheets-406721.iam.gserviceaccount.com",
  "client_id": "106982367938743917048",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets-tutorial%40fluttergsheets-406721.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

//spreadsheet id
const _spreadsheetId = '1Q5YUgzU1tak3WWC-3DazuXD8Aa0AHBUE7CWeWUg33hQ';






void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  final gSheets = GSheets(_credentials);
  final ss = await gSheets.spreadsheet(_spreadsheetId);
  var sheet = ss.worksheetByTitle('Worksheet1');


  await sheet!.values.insertValue('Poo.', column: 3, row: 1);
  final number =  await sheet.values.value(column: 5, row: 1);

  runApp(
      MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  void initState() async {

  }




  @override
  Widget build(BuildContext context) {




    return Center(child: Text('Hello.'),);
  }
}
