import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_models/home_view_model.dart';
import '../../customs/colors.dart';

class MyPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Home>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 19),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first input';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "First Input",
                  labelStyle: TextStyle(color: AppColors.secondaryColor),
                ),
                controller: provider.textController1,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "second Input",
                  labelStyle: TextStyle(color: AppColors.secondaryColor),
                ),
                controller: provider.textController2,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    provider.onAddPressed();
                  }
                },
                child:
                    Text(provider.updateSelection == false ? 'Add' : 'Update'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.inputs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Expanded(child: Text(provider.inputs[index].name)),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(provider.inputs[index].description)),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              provider.onEditPressed(index);
                              // number = index;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => provider.onDeletePressed(index),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
