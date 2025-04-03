import 'dart:async';

import 'package:star_health/models/catalogueModel.dart';
import 'package:http/http.dart' as http;
import 'package:star_health/models/enquiryModel.dart';
import 'package:star_health/models/faqModel.dart';
import 'package:star_health/models/uploadModel.dart';

class RemoteServices {
  static Future<CatalogueModel> fetchcataloguemodel() async {
    final response = await http.post(
        Uri.parse(
            'https://starhealthapi.development.almonds.ai/api/catalogue/products'),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXVpZCI6Ijc4OTUiLCJuYW1lIjoiY2hhbWtpbGxhIiwibW9iaWxlIjoiOTU5OTQ5MjQzNSIsInVzZXJUeXBlIjoiVVNFUiIsImlhdCI6MTczOTMzMzM4MiwiZXhwIjoxNzM5NDE5NzgyfQ.sgI2lde6xkfQbLu4wM7Stv0xs4deHfy6tkY9S-IyLfU"
        });

    print("response: fetchcataloguemodel()====> ${response.body} ");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return catalogueModelFromJson(response.body);
      //  return ProductDataFromJson(jsonDecode(jsonEncode((response.body))));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Product Data');
    }
  }
}

class FaqServices {
  static Future<FaqModel> fetchfaqmodel() async {
    final response = await http.get(
        Uri.parse(
            'https://starhealthapi.development.almonds.ai/api/public/faq'),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6InNvbWlsIGphaW4iLCJtb2JpbGUiOiI3ODk1NjgzNjA3IiwiaWF0IjoxNzQwNDYyNTkyLCJleHAiOjE3NDA1NDg5OTJ9.uUg9ZEALj6mnsuxXd7hXp1mybW6G9u7JuazzMIIrIwk"
        });

    print("response: fetchfaqmodel()====> ${response.body} ");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return faqModelFromJson(response.body);
      //  return ProductDataFromJson(jsonDecode(jsonEncode((response.body))));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load faqs Data');
    }
  }
}

class EnquiryServices {
  static Future<EnquiryModel> fetchenquirymodel() async {
    final response = await http.get(
        Uri.parse(
            'https://starhealthapi.development.almonds.ai/api/public/enquiry/dropdown'),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6InNvbWlsIGphaW4iLCJtb2JpbGUiOiI3ODk1NjgzNjA3IiwiaWF0IjoxNzQwNDYyNTkyLCJleHAiOjE3NDA1NDg5OTJ9.uUg9ZEALj6mnsuxXd7hXp1mybW6G9u7JuazzMIIrIwk"
        });

    print("response: fetchenquirymodel()====> ${response.body} ");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return enquiryModelFromJson(response.body);
      //  return ProductDataFromJson(jsonDecode(jsonEncode((response.body))));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Enquiry Data');
    }
  }
}

class UploadServices {
  static Future<UploadModel> fetchuploadmodel() async {
    final response = await http.post(
        Uri.parse(
            'https://starhealthapi.development.almonds.ai/api//public/image-upload'),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6InNvbWlsIGphaW4iLCJtb2JpbGUiOiI3ODk1NjgzNjA3IiwiaWF0IjoxNzQwNDYyNTkyLCJleHAiOjE3NDA1NDg5OTJ9.uUg9ZEALj6mnsuxXd7hXp1mybW6G9u7JuazzMIIrIwk"
        });

    print("response: fetchuploadmodel()====> ${response.body} ");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return uploadModelFromJson(response.body);
      //  return ProductDataFromJson(jsonDecode(jsonEncode((response.body))));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Upload Data');
    }
  }
}
