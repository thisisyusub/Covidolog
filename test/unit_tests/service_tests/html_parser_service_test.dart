import 'package:covidolog/data/models/azerbaijan_stat.dart';
import 'package:covidolog/data/services/html_parser_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/parser.dart';

const String _mockHtmlContent = '''
            <div class="flex_container">
              <div class="gray_little_statistic"><strong>89898</strong><span>Virusa yoluxan</span>
                <p>frontend.home_infected_desc  </p>
              </div>

              <div class="gray_little_statistic"><strong>62243</strong><span>Sağalan</span>
                <p>Virusa yoluxmuş  pasiyentlər xüsusi rejimli xəstəxanalara yerləşdirilir</p>
              </div>

              <div class="gray_little_statistic"><strong>0</strong><span>Yeni yoluxan</span>
                <p>Ölkə üzrə yeni yoluxma sayı</p>
              </div>

              <div class="gray_little_statistic"><strong>26548</strong><span>Aktiv koronavirus xəstəsi</span>
                <p>Bu günədək ölkədə koronavirusdan  ölüm faktının sayı </p>
              </div>

              <div class="gray_little_statistic"><strong>1107</strong><span>Ölüm halı</span>
                <p>Bu günədək ölkədə koronavirusdan  ölüm faktının sayı</p>
              </div>
              
              
              <div class="gray_little_statistic"><strong>1,592,280</strong><span>Müayinə aparılıb</span>
                <p>Ölkə üzrə laborator müayindən keçənlərin sayı  </p>
              </div>              
            </div>
''';

class MockHtmlParserService implements HtmlParserService {
  @override
  Future<AzerbaijanStat> parseAzerbaijanStat() {
    if (_mockHtmlContent != null && _mockHtmlContent.isNotEmpty) {
      final document = parse(_mockHtmlContent);

      final statistics =
          document.getElementsByClassName('gray_little_statistic');

      var stats = <String>[];

      for (var stat in statistics) {
        stats.add(stat.firstChild.text);
      }

      final azerbaijanStat = AzerbaijanStat(
        totalCasesCount: stats[0],
        totalHealedCount: stats[1],
        newCasesCount: stats[2],
        activeCasesCount: stats[3],
        totalDeathCount: stats[4],
        totalTestsCount: stats[5],
      );

      return Future.value(azerbaijanStat);
    }

    return null;
  }
}

void main() {
  group('HtmlParserService', () {
    var stat;

    setUp(() async {
      stat = await MockHtmlParserService().parseAzerbaijanStat();
    });

    tearDown(() {
      stat = null;
    });

    test('all fields sohuld not be null', () async {
      expect(stat.activeCasesCount, isNotNull);
      expect(stat.newCasesCount, isNotNull);
      expect(stat.totalCasesCount, isNotNull);
      expect(stat.totalDeathCount, isNotNull);
      expect(stat.totalHealedCount, isNotNull);
      expect(stat.totalTestsCount, isNotNull);
    });

    test('All fields should not be empty', () async {
      expect(stat.activeCasesCount, isNotEmpty);
      expect(stat.newCasesCount, isNotEmpty);
      expect(stat.totalCasesCount, isNotEmpty);
      expect(stat.totalDeathCount, isNotEmpty);
      expect(stat.totalHealedCount, isNotEmpty);
      expect(stat.totalTestsCount, isNotEmpty);
    });
  });
}
