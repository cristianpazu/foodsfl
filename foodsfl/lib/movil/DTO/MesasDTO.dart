class Mesasdto {


   int? idMesas;

  Mesasdto({
    required this.idMesas,
  });

  Map<String, dynamic> toJson() {

    return {
      "idMesas": idMesas,
    };
  }

}