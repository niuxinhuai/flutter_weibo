import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/modules/home/adapter.dart';
import 'package:weibo_flutter/modules/home/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
              adapter: NoneConn<HomeState>() + ListGroupAdapter(),
              slots: <String, Dependent<HomeState>>{}),
          middleware: <Middleware<HomeState>>[],
        );
}
