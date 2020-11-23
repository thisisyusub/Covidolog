import 'package:covidolog/presentation/pages/local_statistics/local_statistics_page.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../unit_tests/service_tests/html_parser_service_test.dart';

void main() {
  testWidgets('LocalStatisticsPage test', (tester) async {
    final mockHtmlParserService = MockHtmlParserService();

    await tester.pumpWidget(
        LocalStatisticsPage(htmlParserService: mockHtmlParserService));

    await tester.pump(Duration.zero);
  });
}
