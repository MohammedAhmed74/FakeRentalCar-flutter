import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomSheetScreen extends StatelessWidget {
  static final _formkey = GlobalKey<FormState>();

  TextEditingController _datecontroller = TextEditingController();

  TextEditingController _timecontroller = TextEditingController();
  _handleDate(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.parse("2050-03-20")); // DateTime(2050));

    if (date != null) {
      _datecontroller.text = DateFormat.yMMMd().format(date);
    } else {
      _datecontroller.text = DateFormat.yMMMd().format(DateTime.now());
    }
  }

  _handletime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) {
      _timecontroller.text = TimeOfDay.now().format(context);
    } else {
      _timecontroller.text = time.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Color(0XFFFFFFE5),
        ),

        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 15,
        ),
        //width: double.infinity,

        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                keyboardType: TextInputType.phone,

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.white,),
                      // borderRadius: BorderRadius.circular(10),
                      ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  labelText: 'Phone',

                  /*  labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ), */
                ),

                validator: (str) {
                  return str!.trim().isEmpty
                      ? 'Please Enter a Phone number'
                      : null;
                },
                //   onSaved: (input) => _title = input,
              ),
              SizedBox(height: 10),
              TextFormField(
                readOnly: true, //so that the keyboard dissapears
                controller: _datecontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Colors.black,
                  ),
                  labelText: 'Date',
                  /*  labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ), */
                  border: OutlineInputBorder(
                      //borderRadius: BorderRadius.circular(10),
                      ),
                ),
                onTap: () => _handleDate(context),
                validator: (str) {
                  return str!.trim().isEmpty ? 'Please Pick a date' : null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                readOnly: true,
                keyboardType: TextInputType.datetime,
                controller: _timecontroller,
                onTap: () => _handletime(context),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      //  borderRadius: BorderRadius.circular(10),
                      ),
                  prefixIcon: Icon(
                    Icons.access_time,
                    color: Colors.black,
                  ),
                  labelText: 'Time',
                  /* labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ), */
                ),
                validator: (str) {
                  return str!.trim().isEmpty ? 'Please pick a time' : null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Car is Booked Successfully"),
                      backgroundColor: Color(0xffFBB917),
                      //backgroundColor: Colors.green,
                    ));
                    Navigator.pop(context);
                  }
                },
                child: Text('BOOK NOW'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
