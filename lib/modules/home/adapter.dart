import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/modules/home/adapter_cell_component/component.dart';
import 'package:weibo_flutter/modules/home/state.dart';

class ListGroupAdapter extends DynamicFlowAdapter<HomeState> {
  ListGroupAdapter()
      : super(pool: <String, Component<Object>>{
          'cell': ListCellComponent(),
        }, connector: ListGroupConnector());
}

class ListGroupConnector extends ConnOp<HomeState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeState state) {
    List<ItemBean> items = [];
    if (state.items == null) {
      return items;
    }
    for (var cellModel in state.items) {
      items.add(ItemBean('cell', cellModel));
    }
    return items;
  }
}
