import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/models/home_model.dart';

import 'view.dart';

class ListCellComponent extends Component<Item> {
  ListCellComponent()
      : super(
          view: buildView,
          dependencies: Dependencies<Item>(
              adapter: null, slots: <String, Dependent<Item>>{}),
        );
}
