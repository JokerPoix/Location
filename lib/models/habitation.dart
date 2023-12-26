class Habitation {
  int id;
  String image;
  String libelle;
  String adresse;
  int chambres;
  int superficie;
  double prixmois;

  Habitation(this.id, this.image, this.libelle, this.adresse, this.chambres,
      this.superficie, this.prixmois);
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
