import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../di/app_providers.dart';
import 'remote/remote_venue_repository.dart';
import 'venue_repository.dart';

part 'venue_repository_providers.g.dart';

@riverpod
VenueRepository venueRepository(Ref ref) {
  return RemoteVenueRepository(ref.read(clientProvider));
}