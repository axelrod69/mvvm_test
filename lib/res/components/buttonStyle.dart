import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/authViewModel.dart';
import '../appColors.dart';

class StyleOfButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;

  StyleOfButton({
    required this.title,
    this.loading = false,
    required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    final provider = Provider.of<AuthViewModel>(context);


    // TODO: implement build
    return InkWell(
      onTap: onPressed,
      child: provider.loading ? Center(
        child: CircularProgressIndicator(
          color: AppColors.greenColour,
        ),
      ) : Container(
        height: height * 0.1,
        width: width * 0.4,
        decoration: BoxDecoration(
          color: AppColors.greenColour,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(title, style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          )),

        ),
      ),
    );
  }
}