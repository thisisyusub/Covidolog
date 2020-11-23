/*
 * Created on Mon Nov 23 2020
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

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/azerbaijan_stat.dart';
import '../../data/contractors/impl_local_stat_repository.dart';

part 'local_stat_state.dart';

/// Simple [BLoC] to handle process of [LocalStat] and
/// send it to the [UI].
class LocalStatCubit extends Cubit<LocalStatState> {
  LocalStatCubit({@required this.localStatRepository})
      : super(LocalStatInitial());

  /// any instance that is the child of [ILocalStatRepository]
  /// can be set to this parameter. This type is used for
  /// [Dependency Inversion (DI)]. High level  entities shouldn't 
  /// be depend on low level entities.
  final ILocalStatRepository localStatRepository;

  /// handles fetcing prosses by requesting directly from [LocalStatRepository]
  /// and undirectly from [HtmlParserSerivce] to get covid-19 statistics
  /// for [Azerbaijan].
  void fetchAzerbaijanStat() async {
    try {
      emit(LocalStatInProgress());
      emit(LocalStatSuccess(
          azerbaijanStat: await localStatRepository.fetchAzerbaijanStat()));
    } on Exception {
      emit(LocalStatFailure(
          errorMessage: 'Xəta baş verdi. Zəhmət olmasa, yenidən yoxlayın.'));
    }
  }
}
