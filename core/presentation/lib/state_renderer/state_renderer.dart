
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
// to make sure that when rebuild there won't be any duplicated dialogs
    if(_isDialogShowing){
      _isDialogShowing = false;
      return Container();
    }
// to make sure that when rebuild there won't be any duplicated dialogs
    if(_isDialogDismissed){
      _isDialogDismissed = false;
      return Container();
    }
// to make sure that when rebuild there won't be any old dialogs  &&&& it works when the content come true
    if(_isThereCurrentDialogShowing(context)){
      Navigator.of(context,rootNavigator: true).pop(true);
    }


    switch(stateRendererType){
      case StateRendererType.popupLoadingState:
        return _showPopupLoadingDialog(context, _buildLoadingWidget());
      case StateRendererType.popupErrorState:
       return _showPopupErrorDialog(context, _buildErrorWidget()  );
      case StateRendererType.fullScreenLoadingState:
        return _buildFullScreenContent(_buildLoadingWidget());
      case StateRendererType.fullScreenErrorState:
        // to close the loading dialog and start the error dialog ///// important tests
        if(_isThereCurrentDialogShowing(context)){
          Navigator.of(context,rootNavigator: true).pop(true);
          return Container();
        }else{
          return _buildFullScreenContent(_buildErrorWidget(showRetryButton: true));
        }
      case StateRendererType.emptyState:
        return _showPopupLoadingDialog(context, _buildEmptyWidget());
      default:
        return Container();
    }
  }

  _isThereCurrentDialogShowing(BuildContext context)=> ModalRoute.of(context)?.isCurrent !=true; // it's used to check if the dialog is appeared or not

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
  Widget _buildEmptyWidget(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.inbox, size: 50,color: Colors.grey,),
        SizedBox(height: 10,),
        Text("No data available...")
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
