import 'package:fish_redux/fish_redux.dart';
import 'package:weibo_flutter/models/home_model.dart';
import 'package:weibo_flutter/modules/home/adapter_cell_component/component.dart';
import 'package:weibo_flutter/modules/home/state.dart';
import 'package:weibo_flutter/modules/home/adapter_header_component/component.dart';

class ListGroupAdapter extends DynamicFlowAdapter<HomeState> {
  ListGroupAdapter()
      : super(pool: <String, Component<Object>>{
          'cell': ListCellComponent(),
          'header': ListHeaderComponent(),
        }, connector: ListGroupConnector());
}

class ListGroupConnector extends ConnOp<HomeState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeState state) {
    List<ItemBean> items = [];
    if (state.items == null) {
      return items;
    }
    if (state.users.length != 0) {
      items.add(ItemBean('header', state.users));
    }
    for (var cellModel in state.items) {
      items.add(ItemBean('cell', cellModel));
    }
    return items;
  }
}
