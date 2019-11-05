import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/models/home_model.dart';

import 'view.dart';

class ListCellComponent extends Component<List<dynamic>> {
  ListCellComponent()
      : super(
          view: buildView,
        );
}
