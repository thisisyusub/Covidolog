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

import 'package:hive/hive.dart';

part 'azerbaijan_stat.g.dart';

/// Simple Class for [Azerbaijan Statistics]
///
/// instance contains different [counts] of [statistics]
@HiveType(typeId: 0)
class AzerbaijanStat {
  AzerbaijanStat({
    this.totalCasesCount,
    this.totalHealedCount,
    this.newCasesCount,
    this.activeCasesCount,
    this.totalDeathCount,
    this.totalTestsCount,
  });

  /// count of total cases in [Azerbaijan]
  @HiveField(0)
  final String totalCasesCount;

  /// count of healed in [Azerbaijan]
  @HiveField(1)
  final String totalHealedCount;

  /// count of new cases in [Azerbaijan]
  @HiveField(2)
  final String newCasesCount;

  /// count of active cases in [Azerbaijan]
  @HiveField(3)
  final String activeCasesCount;

  /// count of total death in [Azerbaijan]
  @HiveField(4)
  final String totalDeathCount;

  /// count of total tests in [Azerbaijan]
  @HiveField(5)
  final String totalTestsCount;
}
