import 'package:location/models/type_habitat.dart';

class Habitation {
  int id;
  String image;
  String libelle;
  String adresse;
  int chambres;
  int superficie;
  double prixmois;
  int lits;
  int salleBains;
  List<Option> options;
  List<OptionPayante> optionspayantes;

  Habitation(
      this.id,
      this.typeHabitat,
      this.image,
      this.libelle,
      this.adresse,
      this.nbpersonnes,
      this.chambres,
      this.lits,
      this.salleBains,
      this.superficie,
      this.prixmois,
      {this.options = const [],
      this.optionspayantes = const []});

  Habitation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        typeHabitat = TypeHabitat.fromJson(json['typeHabitat']),
        image = json['image'],
        libelle = json['libelle'],
        adresse = json['adresse'],
        nbpersonnes = json['habitantsmax'],
        chambres = json['chambres'],
        lits = json['lits'],
        salleBains = json['sdb'],
        superficie = json['superficie'],
        prixmois = json['prixmois'],
        options = (json['items'] as List)
            .map((item) => Option.fromJson(item))
            .toList(),
        optionspayantes = (json['optionspayantes'] as List)
            .map((item) => OptionPayante.fromJson(item))
            .toList();
}

class Option {
  int id;
  String libelle;
  String description;

  Option(this.id, this.libelle, {this.description = ""});
}

class OptionPayante extends Option {
  double prix;

  OptionPayante(super.id, super.libelle,
      {super.description = "", this.prix = 0});
}
