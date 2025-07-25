import 'package:book_reader_register/models/book_model.dart';
import 'package:flutter/material.dart';

class RegisterBooksPage extends StatefulWidget {
  const RegisterBooksPage({super.key, this.onRegisterAdd});

  final Function(BookModel)? onRegisterAdd;

  @override
  State<RegisterBooksPage> createState() => _RegisterBooksPageState();
}

class _RegisterBooksPageState extends State<RegisterBooksPage> {
  void onRegisterAdd(BookModel bookModel) {}

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  BookModel bookModel = BookModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1Ef88),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 80),
                width: double.infinity,
                height: 150,

                child: Text(
                  textAlign: TextAlign.center,
                  'Inclua seu novo livro',
                  style: TextStyle(
                    color: Color(0xFF498C9A),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  initialValue: bookModel.title,
                  decoration: InputDecoration(
                    hintText: 'Título',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSaved: (title) => bookModel.title = title!,
                  validator: (value) =>
                      value!.isEmpty ? 'Titulo obrigatório' : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  initialValue: bookModel.description,
                  decoration: InputDecoration(
                    hintText: 'Descrição',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSaved: (title) => bookModel.description = title!,
                  validator: (value) =>
                      value!.isEmpty ? 'Descrição obrigatório' : null,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Row(
                  children: [
                    Text("Já li esse livro"),
                    Checkbox(
                      activeColor: Colors.grey[400],
                      checkColor: Colors.amber,

                      value: bookModel.isRead,
                      onChanged: (isRead) {
                        setState(() {
                          bookModel.isRead = isRead!;
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 80),
                ),

                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                onPressed: () {
                  final form = _formKey.currentState!;
                  form.validate();
                  if (form.validate()) {
                    form.save();
                    debugPrint(bookModel.toString());
                    widget.onRegisterAdd!(bookModel);
                    Navigator.pop(context, bookModel);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
