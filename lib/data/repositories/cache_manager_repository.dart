import 'package:flutter/foundation.dart';

import '../contractors/impl_cache_manager_repository.dart';
import '../services/cache_service.dart';
import '../models/azerbaijan_stat.dart';

class CacheManagerRepository implements ICacheManagerRepository {
  CacheManagerRepository({@required this.cacheService})
      : assert(cacheService != null);

  final CacheService cacheService;

  @override
  Future<void> storeAzerbaijanStat(AzerbaijanStat azerbaijanStat) async {
    /// todo: continue from here
  }
}
