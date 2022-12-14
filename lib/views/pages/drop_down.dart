// import 'package:emdad_khodro_saipa/constants.dart';
// import 'package:flutter/material.dart';
//
// class FormDropDown extends StatefulWidget {
//   FormDropDown(
//       {Key? key,
//         this.title,
//         required this.items,
//         required this.height,
//         required this.autofocus,
//         required this.focusNode,
//         required this.description,
//         this.width,
//         required this.titleColor,
//         required this.textColor,
//         required this.hintColor,
//         required this.errorColor,
//         required this.helperColor,
//         required this.enabledBorderColor,
//         required this.focusedBorderColor,
//         required this.errorBorderColor,
//         required this.primaryBackgroundColor,
//         required this.secondaryBackgroundColor,
//         required this.cursorColor,
//         required this.validations,
//         this.nextFocus,
//         bool? readOnly,
//       })
//       : this.readOnly = readOnly != null ? readOnly : false,
//         super(key: key);
//   final String? title;
//   final Map<String,dynamic> items;
//   final double height;
//   final double? width;
//   final bool? autofocus;
//   final FocusNode? focusNode;
//   final String description;
//   final Color titleColor;
//   final Color primaryBackgroundColor;
//   final Color secondaryBackgroundColor;
//   final Color textColor;
//   final Color hintColor;
//   final Color errorColor;
//   final Color helperColor;
//   final Color enabledBorderColor;
//   final Color focusedBorderColor;
//   final Color errorBorderColor;
//   final Color cursorColor;
//   final List<Function> validations;
//   final bool? readOnly;
//   final FocusNode? nextFocus;
//
//   @override
//   _FormDropDownState createState() => _FormDropDownState();
// }
//
// class _FormDropDownState extends State<FormDropDown> {
//   String? _currentSelectedValue;
//   bool hasFocus = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if(_currentSelectedValue == null || widget.items.keys.where((element) => element == _currentSelectedValue).toList().length < 1){
//       _currentSelectedValue = widget.items.keys.first;
//     }
//     return Column(
//       children: [
//         if(widget.title!=null)
//           Container(
//             height: widget.height / 2,
//             width: widget.width,
//             // alignment: context.read<LanguageController>().isLeftToRight() ? Alignment.centerLeft : Alignment.centerRight,
//             child: Text(
//               widget.title??'',
//               style: Theme.of(context).textTheme.subtitle1!.apply(color: widget.titleColor).copyWith(fontWeight: FontWeight.w700),
//             ),
//           ),
//         Container(
//           // height: 120,
//           child: FormField<String>(
//             enabled: widget.readOnly!,
//             builder: (FormFieldState<String> state) {
//               return InputDecorator(
//                 isFocused: widget.focusNode!.hasFocus,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: widget.primaryBackgroundColor,
//                   errorStyle: Theme.of(context).textTheme.caption!.apply(color: widget.errorColor).copyWith(fontWeight: FontWeight.normal),
//                   errorMaxLines: 1,
//                   helperText: widget.description,
//                   helperStyle: Theme.of(context).textTheme.caption!.apply(color: widget.helperColor).copyWith(fontWeight: FontWeight.normal),
//                   helperMaxLines: 1,
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: widget.enabledBorderColor, width: 0.4),
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: widget.focusedBorderColor, width: 0.4),
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: widget.errorBorderColor, width: 0.4),
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   errorText: state.errorText,
//                 ),
//                 isEmpty: _currentSelectedValue == widget.items.keys.first,
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     focusNode:widget.focusNode ,
//                     icon: Icon(Icons.arrow_drop_down, color: dark_theme_secondary),
//                     dropdownColor: widget.secondaryBackgroundColor,
//                     elevation: 0,
//                     value: _currentSelectedValue,
//                     isDense: true,
//                     onChanged: (newValue) {
//                       widget.focusNode!.unfocus();
//                       FocusScope.of(context).requestFocus(widget.nextFocus);
//                       setState(() {
//                         _currentSelectedValue = newValue!;
//                         state.didChange(newValue);
//                         state.validate();
//                       });
//                     },
//                     items: widget.items.keys.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(
//                           value,
//                           style: Theme.of(context).textTheme.subtitle2!.apply(color: widget.textColor).copyWith(fontWeight: FontWeight.normal),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               );
//             },
//             validator: (value) {
//               String? message;
//               widget.validations.forEach((validator) {
//                 message = validator(value,widget.items.keys.first);
//               });
//               return message;
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
//

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class FormDropDown extends StatefulWidget {
  const FormDropDown(
      {Key? key,
        this.title,
        required this.items,
        this.height,
        this.autofocus,
        // this.focusNode,
        this.description,
        this.width,
        this.titleColor,
        this.textColor,
        this.hintStyle,
        this.errorColor,
        this.helperColor,
        this.enabledBorderColor,
        this.focusedBorderColor,
        this.errorBorderColor,
        this.primaryBackgroundColor,
        this.secondaryBackgroundColor,
        this.cursorColor,
        required this.validations,
        // this.nextFocus,
        this.readOnly,
        this.alignmentCenterLeft,
        this.titleStyle,
        this.errorStyle,
        this.helperStyle,
        this.dropdownMenuItemStyle,
        this.errorMaxLines,
        this.helperMaxLines,
        this.borderRadiusCircular,
        this.firstItemSelectMessage, required this.onChange, this.defaultValue, this.valueStyle, this.iconColor, required this.readOnlyDropDown, this.labelText,
      })
      :super(key: key);
  final String? title;
  final String? defaultValue;
  final String? firstItemSelectMessage;
  final Map<String,dynamic> items;
  final double? height;
  final double? width;
  final bool? autofocus;
  // final FocusNode? focusNode;
  final String? description;
  final String? labelText;
  final Color? titleColor;
  final Color? primaryBackgroundColor;
  final Color? secondaryBackgroundColor;
  final Color? textColor;
  final TextStyle? hintStyle;
  final Color? errorColor;
  final Color? helperColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? cursorColor;
  final Color? iconColor;
  final List<Function> validations;
  final Function(String value) onChange;
  final bool? readOnly;
  // final FocusNode? nextFocus;
  final bool? alignmentCenterLeft;
  final TextStyle? titleStyle;
  final TextStyle? errorStyle;
  final TextStyle? helperStyle;
  final TextStyle? dropdownMenuItemStyle;
  final int? errorMaxLines;
  final int? helperMaxLines;
  final double? borderRadiusCircular;
  final TextStyle? valueStyle;
  final bool readOnlyDropDown ;


  @override
  _FormDropDownState createState() => _FormDropDownState();
}

class _FormDropDownState extends State<FormDropDown> {
  dynamic? _currentSelectedValue;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
  }

  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    if (_currentSelectedValue == null || widget.items.keys.where((element) => element.toLowerCase() == _currentSelectedValue!.toLowerCase()).toList().isEmpty) {
      if (widget.defaultValue != null) {
        if (widget.items.keys.where((element) => element.toLowerCase() == widget.defaultValue!.toLowerCase()).toList().isNotEmpty) {
          _currentSelectedValue = widget.defaultValue;
        } else {
          _currentSelectedValue = widget.items.keys.first;
        }
      } else {
        if (widget.items.keys.isNotEmpty) {
          _currentSelectedValue = widget.items.keys.first;
        } else {
          _currentSelectedValue = '';
        }
      }
    }
    var itemsList = widget.items.keys.toList().getRange(1, widget.items.keys.length ).toList();

    return Column(
      children: [
        if (widget.title != null)
          Container(
            // height: widget.height??80 / 2,
            width: widget.width ?? double.infinity,
            alignment: widget.alignmentCenterLeft ?? false ? Alignment.centerLeft : Alignment.centerRight,
            child: Text(
              widget.title ?? 'title',
              // style:widget.titleStyle?? TextStyle(color: widget.titleColor ??const Color(0xFFBBBBBB),fontSize: 17,fontWeight: FontWeight.w700),
            ),
          ),
        if(widget.title!=null)
          const SizedBox(height: 8,),
        SizedBox(
          height: 50,
          child: TextDropdownFormField(
            onChanged: (dynamic newValue) {
              setState(() {
                isChanged = true;
                _currentSelectedValue = newValue;
                widget.onChange(_currentSelectedValue!);
                // state.didChange(newValue);
                // state.validate();
              });
            },
            options: itemsList,
            decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.black),
                // contentPadding: EdgeInsets.only(right: 16,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,
                ),
                labelText: widget.items.keys.first,
                isDense: true),
            // dropdownHeight: 400,
          ),
        ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width - 48,
        //   height: 50,
        //   child: InputDecorator(
        //     decoration: InputDecoration(
        //       isDense: false,
        //       contentPadding: EdgeInsets.zero,
        //       labelText:isChanged? widget.items.keys.first:null,
        //       labelStyle: TextStyle(
        //           color:  Colors.black,
        //               ),
        //       border: new OutlineInputBorder(
        //           borderRadius:BorderRadius.circular(8) ,
        //           borderSide: new BorderSide()),
        //     ),
        //     child: DropdownButtonHideUnderline(
        //       child: Theme(
        //         data: Theme.of(context).copyWith(
        //           hoverColor: Colors.transparent,
        //         ),
        //         child: ButtonTheme(
        //           alignedDropdown: true,
        //           child: DropdownButton<String>(
        //             isExpanded: true,
        //             icon: Icon(Icons.arrow_drop_down, color: dark_theme_secondary),
        //
        //             // style: widget.valueStyle ?? TextStyle(color: widget.textColor ?? Colors.red, fontSize: 15, fontWeight: FontWeight.w400),
        //             // focusNode:widget.focusNode ,
        //             itemHeight: kMinInteractiveDimension,
        //             // iconSize: 18,
        //             // icon: Icon(FeatherIcons.chevronDown, size: 25,color: widget.iconColor??Colors.blue),
        //             dropdownColor: widget.secondaryBackgroundColor ?? light_theme_background_light,
        //             elevation: 0,
        //             value: _currentSelectedValue,
        //             isDense: true,
        //             focusColor: Colors.transparent,
        //             onChanged: widget.readOnlyDropDown
        //                 ? null
        //                 : (newValue) {
        //                     // widget.focusNode!.unfocus();
        //                     // FocusScope.of(context).requestFocus(widget.nextFocus);
        //                     setState(() {
        //                       isChanged = true;
        //                       _currentSelectedValue = newValue!;
        //                       widget.onChange(_currentSelectedValue!);
        //                       // state.didChange(newValue);
        //                       // state.validate();
        //                     });
        //                   },
        //             items: widget.items.keys.map((String value) {
        //               return DropdownMenuItem<String>(
        //                 value: value,
        //                 child: Text(
        //                   value,
        //                   style: widget.dropdownMenuItemStyle ?? TextStyle(color: widget.textColor ?? Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),
        //                 ),
        //               );
        //             }).toList(),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}



