import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/modules/home/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ListHeaderComponent extends Component<List<User>> {
  ListHeaderComponent()
      : super(
//            effect: buildEffect(),
//            reducer: buildReducer(),
            view: buildView,
            );

}
