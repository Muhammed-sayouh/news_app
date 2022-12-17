import 'package:news_app/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => HomeViewModel(),
  ),

];
