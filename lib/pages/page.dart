import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  final _formKey = GlobalKey<FormState>();

  final charNameController = TextEditingController();
  final oldCharController = TextEditingController();
  String selectedCharType = 'gay';
  DateTime selectedCharDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    charNameController.dispose();
    oldCharController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom:10),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Char',
                  hintText: 'Rajoute ton personnage',
                  border: OutlineInputBorder(),
              ),
              validator: (value){
                  if(value == null || value.isEmpty){
                    return "Tu dois completer ce texte";
                  }
                  return null;
                },
                controller: charNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom:10),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Char',
                  hintText: 'Rajoute son âge',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Tu dois completer ce texte";
                  }
                  return null;
                },
                controller: oldCharController,
              ),
            ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(value: 'gay', child: Text("Gay")),
                  DropdownMenuItem(value: 'lesbien', child: Text("Lesbien")),
                  DropdownMenuItem(value: 'bi', child: Text("Bi")),
                ],
                decoration: const InputDecoration(
                  border : OutlineInputBorder()
                ),
                value: selectedCharType,
                onChanged: (value){
                  setState(() {
                    selectedCharType = value!;
                  });
                },
            ),
          ),
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Choisir une date',
              ),
              mode: DateTimeFieldPickerMode.dateAndTime,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                setState(() {
                  selectedCharDate = value;
                });
              },
            ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()){
                    final charName = charNameController.text;
                    final oldChar = oldCharController.text;

                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Envoie en cours ..."))
                    );
                    FocusScope.of(context).requestFocus(FocusNode());

                    print("Ajout du nom du perso $charName avec son âge $oldChar");
                    print("Type de char $selectedCharType");
                    print("Et la date sera $selectedCharDate");
                  }
                },
                child: const Text("Bouton"),
              ),
            )
          ],
        )
      ),
    );
  }
}
