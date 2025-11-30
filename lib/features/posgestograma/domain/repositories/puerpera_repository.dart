import 'package:pami_app/features/posgestograma/data/model/puerpera_model.dart';

abstract class PuerperaRepository {
  Stream<List<PuerperasResponseModel>> watchPuerperas();
}
