class CPF {
  String numCPF;

  CPF(this.numCPF);

  bool validaCPF() {
    var isValid = true;

    if (!RegExp(r'\d{3}\.\d{3}\.\d{3}\-\d{2}').hasMatch(numCPF)) {
      isValid = false;
    } 
    else 
    {
      var numCPFReplace = numCPF.replaceAll(RegExp(r'[.-]'), '');
      
      //primeiro digito verificador
      var mult = 0;
      var soma = 0;
      var div = 0;
      var multiplicador = 2;
      for (var i = 8; i >= 0; i--) {
        mult = int.parse(numCPFReplace[i]) * multiplicador;
        multiplicador++;
        soma += mult;
      }
      div = soma % 11;
      if (div < 2) {
        if (!(int.parse(numCPFReplace[9]) == 0)) {
          isValid = false;
        }
      }
      if (div >= 2) {
        var onze = (11 - div);
        if (!(onze == int.parse(numCPFReplace[9]))) {
          isValid = false;
        }
      }

      //segundo digito verificador
      var mult2 = 0;
      var soma2 = 0;
      var div2 = 0;
      var multiplicador2 = 2;
      for (var i = 9; i >= 0; i--) {
        mult2 = int.parse(numCPFReplace[i]) * multiplicador2;
        multiplicador2++;
        soma2 += mult2;
      }
      div2 = soma2 % 11;
      if (div2 < 2) {
        if (!(int.parse(numCPFReplace[10]) == 0)) {
          isValid = false;
        }
      }
      if (div2 >= 2) {
        var onze = (11 - div2);
        if (!(onze == int.parse(numCPFReplace[10]))) {
          isValid = false;
        }
      }
    }

    return isValid;
  }
}
