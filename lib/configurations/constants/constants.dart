// Global APP - specific constants

import 'package:expiro/configurations/constants/fonts.gen.dart';

///Generate by running ```fluttergen``` in the terminal
export 'assets.gen.dart';
// export 'fonts.gen.dart'; //Uncomment if font is needed

const kAppTitle = 'Expiro';
const kAppBarTitle = 'exPIRO';

const kMongoUrl =
    'mongodb+srv://expiroadmin:expiroadmin@expirocluster.fhifirz.mongodb.net/expiroDatabase?retryWrites=true&w=majority';

const kBrandFontFamily = FontFamily.quando;
const kFontFamily = FontFamily.roboto;

//Oauth
const kAuth0ClientId = '1drVwmQ8njBIgldpHgXA7y3ijgCXqJ8m';
const kAuth0Domain = 'dev-katt2dm026s3d62b.us.auth0.com'; //auth0 domain

const productCategoryList = [
  'Grocery',
  'Medicine',
  'Dairy',
  'Cosmetic',
  'Vegetable & Fruit',
  'Meats',
  'Drinks',
  'Other',
];

const productStorageList = [
  'Bedroom',
  'Storage Room',
  'Kitchen',
  'Table',
  'Drawing Room',
  'Others',
];

const productRecyclableOptions = [
  'Recyclable',
  'Non-Recyclable',
];

///Collections
const kUserCollection = 'users';
const kProductsCollection = 'products';
const kExploreCollection = 'explore';
