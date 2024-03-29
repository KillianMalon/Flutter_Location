import 'package:location/models/type_habitat.dart';

class Habitation {
  int id;
  TypeHabitat typeHabitat;
  String image;
  String libelle;
  String adresse;
  int nbpersonnes;
  int chambres;
  int superficie;
  double prixomis;
  int lits;
  int salleBains;
  List<Option> options;
  List<OptionPayante> optionsPayantes;

  Habitation(this.id, this.typeHabitat, this.image, this.libelle, this.adresse,
      this.nbpersonnes, this.chambres, this.lits, this.salleBains,
      this.superficie, this.prixomis,
      {this.options = const [], this.optionsPayantes = const []}
  );
  Habitation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
  typeHabitat = TypeHabitat.fromJson(json['typehabitat']),
  image =json['image'],
  libelle = json['libelle'],
  adresse = json['adresse'],
  nbpersonnes = json['habitantsmax'],
  chambres = json['chambres'],
  lits = json['lits'],
  salleBains = json['sdb'],
  superficie = json['superficie'],
  prixomis = json['prixmois'],
  options = (json['items'] as List)
      .map((item) => Option.fromJson(item))
      .toList(),
  optionsPayantes = (json['optionpayantes'] as List)
      .map((item) => OptionPayante.fromJson(item))
      .toList();
}
class Option {
  int id;
  String libelle;
  String description;
  Option(this.id, this.libelle, {this.description = ""});

  Option.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        libelle = json ['libelle'],
        description = json['description'];
}

class OptionPayante extends Option{
  double prix;

  OptionPayante(super.id, super.libelle, {super.description ="", this.prix = 0});

  OptionPayante.fromJson(Map<String, dynamic> json)
      : prix = json['prix'],
        super.fromJson(json['optionpayante']);

}