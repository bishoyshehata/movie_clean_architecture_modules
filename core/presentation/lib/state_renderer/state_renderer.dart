
import 'package:flutter/material.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  var _isDialogDismissed = false;
  var _isDialogShowing = false;
  final String title;
  final String message;
  final VoidCallback? retryActionFunction;
    StateRenderer({super.key, required this.stateRendererType, this.title = 'Error', this.message ='Loading...',  this.retryActionFunction});

  @override
  Widget build(BuildContext context) {
    switch(stateRendererType){
      case StateRendererType.popupLoadingState:
        return _showPopupLoadingDialog(context, _buildLoadingWidget());
      case StateRendererType.popupErrorState:
       return _showPopupErrorDialog(context, _buildErrorWidget()  );
      case StateRendererType.fullScreenLoadingState:
        return _buildFullScreenContent(_buildLoadingWidget());
      case StateRendererType.fullScreenErrorState:
        return _buildFullScreenContent(_buildErrorWidget(showRetryButton: true));
      case StateRendererType.emptyState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.contentState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.none:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  _isThereCurrentDialogShowing(BuildContext context)=> ModalRoute.of(context)?.isCurrent !=true;

  Widget _buildLoadingWidget(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 10,),
        Text("Loaing...")
      ],
    );
  }
  Widget _buildFullScreenContent(Widget content){
    return Container(
      color: Colors.white,
     child: Center(
       child: content,
     ),
    );
  }
  Widget _buildErrorWidget({bool showRetryButton = false}){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline,size: 70, color: Colors.red,),
        SizedBox(height: 10,),
        Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text(message),
        SizedBox(height: 10,),
        if(showRetryButton)
          ElevatedButton(onPressed: retryActionFunction, child:Text("Retry"))

      ],
    );
  }
  // it  show popup loading
  Widget _showPopupLoadingDialog(BuildContext context, Widget content) {
    if (!_isThereCurrentDialogShowing(context)) {
      _isDialogShowing = true;

      WidgetsBinding.instance.addPersistentFrameCallback((_) => showDialog(       // it's used to make sure that all the frames ended and begin after this .
          context: context,
          builder: (context) => AlertDialog(
            content: content,
          )));
    }
    return Container(); // keep screen content behind the dialog
  }
  // it  show popup error
  Widget _showPopupErrorDialog(BuildContext context, Widget content) {
    if (!_isThereCurrentDialogShowing(context)) {
      _isDialogShowing = true;

      WidgetsBinding.instance.addPersistentFrameCallback((_) => showDialog(       // it's used to make sure that all the frames ended and begin after this .
          context: context,
          builder: (context) => AlertDialog(
            content: content,
            actions: [
              TextButton(onPressed: (){
                _isDialogDismissed = true;
                Navigator.of(context , rootNavigator: true).pop(true);
              }, child: Text("Close"))
            ],
          )));
    }
    return Container(); // keep screen content behind the dialog
  }
}
