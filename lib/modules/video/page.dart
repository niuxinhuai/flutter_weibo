import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VideoPage extends Page<VideoState, Map<String, dynamic>> {
  VideoPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VideoState>(
                adapter: null,
                slots: <String, Dependent<VideoState>>{
                }),
            middleware: <Middleware<VideoState>>[
            ],);

}
