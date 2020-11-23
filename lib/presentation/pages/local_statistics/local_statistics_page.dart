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

import 'package:flutter/material.dart';
import './widgets/stat_item.dart';
import '../../../data/models/azerbaijan_stat.dart';
import '../../../data/services/html_parser_service.dart';

class LocalStatisticsPage extends StatefulWidget {
  const LocalStatisticsPage({Key key, this.htmlParserService})
      : super(key: key);

  final HtmlParserService htmlParserService;

  @override
  _LocalStatisticsPageState createState() => _LocalStatisticsPageState();
}

class _LocalStatisticsPageState extends State<LocalStatisticsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder<AzerbaijanStat>(
        future: widget.htmlParserService.parseAzerbaijanStat(),
        builder: (_, azerbaijanStatSnapshot) {
          if (azerbaijanStatSnapshot.connectionState ==
              ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (azerbaijanStatSnapshot.hasError) {
            return Center(
              child: Text(azerbaijanStatSnapshot.error.toString()),
            );
          }

          final azerbaijanStat = azerbaijanStatSnapshot.data;

          return GridView(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            children: [
              StatItem(
                title: 'Ümumi yoluxan',
                count: azerbaijanStat.totalCasesCount,
              ),
              StatItem(
                title: 'Sağalan',
                count: azerbaijanStat.totalHealedCount,
              ),
              StatItem(
                title: 'Yeni yoluxan',
                count: azerbaijanStat.newCasesCount,
              ),
              StatItem(
                title: 'Aktiv xəstə',
                count: azerbaijanStat.activeCasesCount,
              ),
              StatItem(
                title: 'Ölüm halı',
                count: azerbaijanStat.totalDeathCount,
              ),
              StatItem(
                title: 'Ümumi müayinə',
                count: azerbaijanStat.totalHealedCount,
              ),
            ],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
