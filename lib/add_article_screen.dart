import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portfolio_management/app_constant.dart';
import 'package:portfolio_management/model/article_model.dart';
import 'package:portfolio_management/model/article_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio_management/progressHUD.dart';
import 'package:portfolio_management/utils/custom_snackbar.dart';
import 'package:portfolio_management/utils/custom_text_form_field.dart';

class AddOrUpdateArticleScreen extends StatefulWidget {
  int id;
  AddOrUpdateArticleScreen({super.key, required this.id});

  @override
  State<AddOrUpdateArticleScreen> createState() => _AddArticleScreenState();
}

class _AddArticleScreenState extends State<AddOrUpdateArticleScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  late ArticleModel myArticleById;

  bool isHUDLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isHUDLoading,
      child: Scaffold(
        appBar: AppBar(
          title: widget.id == -1
              ? const Text('Makale Ekle')
              : const Text("Makale Güncelle"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormField(
                  labelText: "Title", controller: titleController),
              CustomTextFormField(
                labelText: "Description",
                controller: descriptionController,
                minLines: 3,
                maxLines: 7,
              ),
              CustomTextFormField(
                labelText: "Content",
                controller: contentController,
                minLines: 8,
                maxLines: 12,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  widget.id == -1 ? addArticles() : updateArticles(widget.id);
                },
                child: widget.id == -1
                    ? const Text('Ekle')
                    : const Text("Güncelle"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addArticle(ArticleRequestModel articleRequestModel) async {
    final url = Uri.parse("$apiURL/articles/create");

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    final Map<String, dynamic> requestBody = {
      "title": articleRequestModel.title,
      "description": articleRequestModel.description,
      "content": articleRequestModel.content,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(requestBody),
    );
    customSnackBar.success("Makale Oluşturuldu");
    if ((response.statusCode ~/ 100) == 2) {
      // Başarılı durumda yapılacak işlemler
      customSnackBar.success("Makale Oluşturuldu");
    } else {
      // Hata durumunda yapılacak işlemler
      customSnackBar.error("Makale Oluşturulamadı");
    }
  }

  Future<void> updateArticle(int articleId) async {
    final url = Uri.parse("$apiURL/articles/update/$articleId");

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    final Map<String, dynamic> requestBody = {
      "title": titleController.text,
      "description": descriptionController.text,
      "content": contentController.text,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(requestBody),
    );
    customSnackBar.success("Makale Güncellendi");
    if ((response.statusCode ~/ 100) == 2) {
      // Başarılı durumda yapılacak işlemler
      customSnackBar.success("Makale Güncellendi");
    } else {
      // Hata durumunda yapılacak işlemler
      customSnackBar.error("Makale Güncellenemedi");
    }
  }

  Future<void> getArticleById(int articleId) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    final url = Uri.parse("$apiURL/articles/$articleId");
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      // JSON içindeki "data" anahtarındaki nesne
      Map<String, dynamic> responseData =
          jsonDecode(utf8.decode(response.bodyBytes));

      // Kurs modeli oluştur
      ArticleModel article = ArticleModel(
          id: responseData['id'] as int,
          title: responseData['title'],
          description: responseData['description'],
          content: responseData['content']);

      // Kursu sakla
      myArticleById = article;

      titleController.text = myArticleById.title;
      descriptionController.text = myArticleById.description;
      contentController.text = myArticleById.content;

      // notifyListeners metodunu, veriler eklenen yerde çağır
    } else {
      // Hata durumunu ele al
    }
  }

  Future<void> addArticles() async {
    setState(() {
      isHUDLoading = true;
    });
    await addArticle(ArticleRequestModel(
      title: titleController.text,
      description: descriptionController.text,
      content: contentController.text,
    ));
    Navigator.pop(context);

    setState(() {
      isHUDLoading = false;
    });
  }

  Future<void> updateArticles(int articleId) async {
    setState(() {
      isHUDLoading = true;
    });
    await updateArticle(articleId);

    setState(() {
      isHUDLoading = false;
    });
  }

  Future<void> fetchData() async {
    setState(() {
      isHUDLoading = true;
    });
    widget.id != -1 ? await getArticleById(widget.id) : null;

    setState(() {
      isHUDLoading = false;
    });
  }
}
