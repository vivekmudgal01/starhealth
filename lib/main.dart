import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/home/views/home_view.dart';
import 'package:star_health/app/modules/language_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  final box = GetStorage();

  // Read saved locale or set default locale
  Locale locale =
      box.read('locale') == 'hi' ? Locale('hi', 'IN') : Locale('en', 'US');

  runApp(MyApp(locale: locale));
}

class MyApp extends StatelessWidget {
  final Locale locale;

  MyApp({required this.locale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: MyTranslations(),
      locale: locale,
      fallbackLocale: Locale('en', 'US'),
    );
  }
}
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final LanguageController languageController = Get.put(LanguageController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: "Application",
//           initialRoute: AppPages.INITIAL,
//           getPages: AppPages.routes,
//           locale: languageController.selectedLocale.value,
//           fallbackLocale: Locale('en', 'US'),
//           translations: MyTranslations(languageController.translations),
//           //   home: LanguageToggleScreen(),
//         ));
//   }
// }

// class MyTranslations extends Translations {
//   final Map<String, String> translations;
//   MyTranslations(this.translations);

//   @override
//   Map<String, Map<String, String>> get keys => {
//         'en_US': translations,
//         'hi_IN': translations,
//       };
// }
class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'English': 'हिन्दी',
          'Rewards': 'Rewards',
          " Download Rule Book": " Download Rule Book",
          'Total Points Earned': 'Total Points Earned',
          'Total Points Redeem': 'Total Points Redeem',
          'Points Available': 'Points Available',
          'Points Expiry by today': 'Points Expiry by today',
          'Redeem': 'Redeem',
          'Leaderboard': 'Leaderboard',
          'Order/Points\n     History': 'Order/Points\n     History',
          'Help & Support': 'Help & Support',
          'Product Suggestion': 'Product Suggestion',
          'Available for redeem': 'Available for redeem',
          'Redeem Now': 'Redeem Now',
          'Pts': 'Pts',
          'Redeem Catalogue': 'Redeem Catalogue',
          'Search here': 'Search here',
          'History': 'History',
          "Order History": "Order History",
          "Points History": "Points History",
          'Recent Orders': 'Recent Orders',
          'Product Code :': 'Product Code :',
          'Points :': 'Points :',
          'Status :': 'Status :',
          'Delivered': 'Delivered',
          'Track Order': 'Track Order',
          'Total Points': 'Total Points',
          'Earned': 'Earned',
          'Points Expiry': 'Points Expiry',
          'Today': 'Today',
          'Tomorrow': 'Tomorrow',
          'Within 7 Days': 'Within 7 Days',
          'This Month': 'This Month',
          'Points': 'Points',
          '25 sept 2023 | 20:12pm': '25 sept 2023 | 20:12pm',
          'Transaction Type - Earned': 'Transaction Type - Earned',
          'Transaction Type - Forfeit': 'Transaction Type - Forfeit',
          'Transaction Type - Redeemed': 'Transaction Type - Redeemed',
          'Expired Points': 'Expired Points',
          'From': 'From',
          'For': 'For',
          'Leaderboard': 'Leaderboard',
          'Vivek Mudgal': 'Vivek Mudgal',
          'Help & Support': 'Help & Support',
          'How Can We \n  Help You?': 'How Can We \n  Help You?',
          'Select An Option Below': 'Select An Option Below',
          'FAQs': 'FAQs',
          'Write Us': 'Write Us',
          'Enquiry Now': 'Enquiry Now',
          'Enquiry form': 'Enquiry form',
          ' Past Enquiries': ' Past Enquiries',
          'Enquiry': 'Enquiry',
          "Select Enquiry": "Select Enquiry",
          'Message': 'Message',
          'Write details of your Enquiry': 'Write details of your Enquiry',
          'Attach Photo, Video or Document': 'Attach Photo, Video or Document',
          'Submit': 'Submit',
          'Past Enquiry': 'Past Enquiry',
          'Enquiry :': 'Enquiry :',
          ' App related issue': ' App related issue',
          'Enquiry id :': 'Enquiry id :',
          'Date & Time :': 'Date & Time :',
          'Remark :': 'Remark :',
          ' Issue will resolve soon': ' Issue will resolve soon',
          '06:09pm': '06:09pm',
          'Reviewing': 'Reviewing'
        },
        'hi_IN': {
          'English': 'English',
          "Rewards": "पुरस्कार",
          " Download Rule Book": " नियम पुस्तिका डाउनलोड करें",
          "Total Points Earned": "कुल अर्जित अंक",
          'Total Points Redeem': 'कुल रिडीम किए गए अंक',
          'Points Available': 'उपलब्ध अंक',
          'Points Expiry by today': 'अंक आज समाप्त हो जाएंगे',
          'Redeem': 'रिडीम करें',
          'Leaderboard': 'अग्रणी सूची',
          'Order/Points\n     History': 'ऑर्डर/अंक\n  इतिहास',
          'Help & Support': 'सहायता और समर्थन',
          'Product Suggestion': 'उत्पाद सुझाव',
          'Available for redeem': 'रिडीम के लिए उपलब्ध',
          'Redeem Now': 'अभी रिडीम करें',
          'Pts': 'अंक',
          'Redeem Catalogue': 'रिडीम कैटलॉग',
          'Search here': 'यहाँ खोजें',
          'History': 'रिकॉर्ड',
          "Order History": 'ऑर्डर विवरण',
          "Points History": "अंक विवरण",
          'Recent Orders': 'हाल के ऑर्डर',
          'Product Code :': 'उत्पाद कोड :',
          'Points :': 'अंक :',
          'Status :': 'स्थिति :',
          'Delivered': 'डिलीवर किया गया',
          'Track Order': 'आदेश की स्थिति देखें',
          'Total Points': 'कुल अंक',
          'Earned': 'अर्जित',
          'Points Expiry': 'अंकों की समाप्ति',
          'Today': 'आज',
          'Tomorrow': 'कल',
          'Within 7 Days': '7 दिनों के भीतर',
          'This Month': 'इस महीने',
          'Points': 'अंक',
          '25 sept 2023 | 20:12pm': "25 सितम्बर 2023 | 20:12 बजे",
          'Transaction Type - Earned': 'लेनदेन प्रकार - अर्जित',
          'Transaction Type - Forfeit': "लेनदेन प्रकार - जब्त",
          'Transaction Type - Redeemed': "लेनदेन प्रकार - रिडीम किया गया",
          'Expired Points': 'समाप्त हुए अंक',
          'From': 'से',
          'For': 'के लिए',
          'Leaderboard': 'लीडरबोर्ड',
          'Vivek Mudgal': 'विवेक मुद्गल',
          'Help & Support': "सहायता और समर्थन",
          'How Can We \n  Help You?': "हम आपकी कैसे सहायता कर सकते हैं?",
          'Select An Option Below': 'नीचे एक विकल्प चुनें',
          'FAQs': 'सामान्य प्रश्न',
          'Write Us': 'हमें लिखें',
          'Enquiry Now': 'अभी पूछताछ करें',
          'Enquiry form': 'पूछताछ फ़ॉर्म',
          ' Past Enquiries': 'पिछली पूछताछ',
          'Enquiry': 'पूछताछ',
          "Select Enquiry": 'पूछताछ चुनें',
          'Message': 'संदेश',
          'Write details of your Enquiry': 'अपनी पूछताछ का विवरण लिखें',
          'Attach Photo, Video or Document':
              'फोटो, वीडियो या दस्तावेज़ संलग्न करें',
          'Submit': 'जमा करें',
          'Past Enquiry': 'पिछली पूछताछ',
          'Enquiry :': 'पूछताछ :',
          ' App related issue': '  ऐप से संबंधित समस्या',
          'Enquiry id :': "पूछताछ आईडी :",
          'Date & Time :': "तारीख और समय :",
          'Remark :': 'टिप्पणी :',
          ' Issue will resolve soon': '  समस्या जल्द ही हल हो जाएगी',
          '06:09pm': '06:09 बजे शाम',
          'Reviewing': 'समीक्षा की जा रही है'
        },
      };
}
