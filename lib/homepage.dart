import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_management/add_article_screen.dart';
import 'package:portfolio_management/add_project_screen.dart';
import 'package:portfolio_management/app_constant.dart';
import 'package:portfolio_management/model/article_model.dart';
import 'package:portfolio_management/model/project_model.dart';
import 'package:portfolio_management/progressHUD.dart';
import 'package:portfolio_management/utils/custom_button.dart';
import 'package:portfolio_management/utils/custom_data_table.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio_management/utils/custom_snackbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<ArticleModel> articleList = [];
  List<ProjectModel> projectList = [];

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
          title: const Text(
            'Portfolio Yönetim Sistemi',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: kRedColor2,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: articleDatatable(),
              ),
              Divider(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: projectDatatable(),
              ),
              Divider(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Makale Ekle",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddOrUpdateArticleScreen(id: -1),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  CustomButton(
                      text: "Proje Ekle",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddProjectScreen(),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget articleDatatable() {
    return CustomDataTable(
      key: const Key("groupDataTable"),
      minWidth: 100,
      height: 250,
      columns: const [
        DataColumn2(
            size: ColumnSize.L,
            label: Text(
              "Makale Adı",
            )),
        DataColumn2(
            size: ColumnSize.L,
            label: Text(
              "Kısa Açıklama",
            )),
        DataColumn2(
            fixedWidth: 100,
            label: Text(
              "",
            )),
       
      ],
      rows: articleList
          .map((article) => DataRow2(
                onTap: () async {
                  print(article.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddOrUpdateArticleScreen(id: article.id),
                    ),
                  );
                },
                cells: <DataCell>[
                  DataCell(
                    Text(article.title),
                  ),
                  DataCell(
                    Text(article.description),
                  ),
                  DataCell(
                    IconButton(
                      onPressed: () {
                        deleteArticleSet(article.id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: kRedColor2,
                      ),
                    ),
                  ),
                ],
              ))
          .toList(),
    );
  }

  Widget projectDatatable() {
    return CustomDataTable(
      key: const Key("groupDataTable"),
      minWidth: 100,
      height: 300,
      columns: const [
        DataColumn2(
            size: ColumnSize.L,
            label: Text(
              "Proje Adı",
            )),
        DataColumn2(
          size: ColumnSize.L,
          label: Text(
            "Kısa Açıklama",
          ),
        ),
      ],
      rows: projectList
          .map((project) => DataRow2(
                onTap: () async {
                  //kursun detay sayfasına gitme yeri
                  // Navigator.pushNamed(
                  //     context, "/weekDetailScreen/${weeks.weekId}");
                },
                cells: <DataCell>[
                  DataCell(
                    Text(project.title!),
                  ),
                  DataCell(
                    Text(project.description!),
                  ),
                ],
              ))
          .toList(),
    );
  }

  Future<void> getMyArticles() async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    final url = Uri.parse("$apiURL/articles/all");
    final response = await http.get(url, headers: headers);
    print(response);
    if (response.statusCode == 200) {
      // JSON içindeki "data" anahtarındaki liste
      List<dynamic> responseData = jsonDecode(utf8.decode(response.bodyBytes));
      print("responseData");
      print(responseData);
      // Veriyi liste üzerine ekle
      List<ArticleModel> articles = responseData.map<ArticleModel>((json) {
        return ArticleModel(
            id: json['id'] as int,
            dateTime:
                DateTime.parse(json['date']), // DateTime parse etme işlemi
            title: json['title'],
            description: json['description'],
            content: json['content']);
      }).toList();

      articleList = articles;
    } else {
      // Hata durumunu ele al
      print('Failed to load articles: ${response.statusCode}');
    }
  }

  Future<void> deleteArticle(int articleId) async {
    final url = Uri.parse("$apiURL/articles/delete/$articleId");

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    final response = await http.delete(
      url,
      headers: headers,
    );

    if ((response.statusCode ~/ 100) == 2) {
      // Başarılı durumda yapılacak işlemler
      customSnackBar.success("İçerik başarıyla silindi.");
    } else {
      // Hata durumunda yapılacak işlemler
      customSnackBar.error("İçerik silme başarısız");
    }
  }

  Future<void> getMyProjects() async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    final url = Uri.parse("$apiURL/projects/all");
    final response = await http.get(url, headers: headers);
    print(response);
    if (response.statusCode == 200) {
      // JSON içindeki "data" anahtarındaki liste
      List<dynamic> responseData = jsonDecode(utf8.decode(response.bodyBytes));

      // Veriyi liste üzerine ekle
      List<ProjectModel> projects = responseData.map<ProjectModel>((json) {
        return ProjectModel(
            id: json['id'] as int,
            title: json['title'],
            description: json['description'],
            body: json['body'],
            logo: json['logo'],
            linkText: json['linkText'],
            link: json['link'],
            isDeployed: json['isDeployed']);
      }).toList();

      projectList = projects;
      // notifyListeners metodunu, veriler eklenen yerde çağır
    } else {
      // Hata durumunu ele al
      print('Failed to load projects: ${response.statusCode}');
    }
  }

  Future<void> deleteArticleSet(int articleId) async {
    setState(() {
      isHUDLoading = true;
    });
    await deleteArticle(articleId);
    await fetchData();

    setState(() {
      isHUDLoading = false;
    });
  }

  Future<void> fetchData() async {
    setState(() {
      isHUDLoading = true;
    });
    await getMyArticles();
    await getMyProjects();
    setState(() {
      isHUDLoading = false;
    });
  }
}
