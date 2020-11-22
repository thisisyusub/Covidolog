/*
 * Created on Sun Nov 22 2020
 *
 * BSD 3-Clause License
 *
 *Copyright (c) 2020, Kanan Yusubov
 *All rights reserved.
 *
 *Redistribution and use in source and binary forms, with or without
 *modification, are permitted provided that the following conditions are met:
 *
 *1. Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 *2. Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 *3. Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 *THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 *FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 *SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 *OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/azerbaijan_stat.dart';

/// HTML Parsing Service
///
/// parses given html content to desired one
class HtmlParserService {
  HtmlParserService._();

  static HtmlParserService _instance;

  /// simple getter to implement [Singleton] Pattern will
  /// provide only the same instance to all call stacks
  static HtmlParserService get instance {
    if (_instance == null) {
      _instance = HtmlParserService._();
    }

    return _instance;
  }

  final _client = http.Client();

  /// parses statistics for [Azerbaijan]
  /// returns all stats parsing from HTML content
  Future<AzerbaijanStat> parseAzerbaijanStat() async {
    final response = await _client
        .get(Uri.parse('${Config.baseUrl}${Config.azerbaijanStatEndpoint}'));

    if (response.statusCode == 200) {
      final document = parse(response.body);

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

      return azerbaijanStat;
    }

    return null;
  }
}
