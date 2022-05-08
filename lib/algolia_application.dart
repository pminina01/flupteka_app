import 'package:algolia/algolia.dart';

class AlgoliaApplication{
  static const Algolia algolia = Algolia.init(
    applicationId: 'RS41IP53S3', //ApplicationID
    apiKey: '0b103f372ed5aa876addd96e3eb25efe', // search-only api key in flutter code
  );
}