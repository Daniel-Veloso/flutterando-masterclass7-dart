void main(List<String> arguments) {
  //Calculo IMC
  double altura = 1.67;
  double peso = 56.0;
  double? result;

  result = calcularIMC(peso, altura);

  print("IMC: ${result}");

  //fibonacci exibindo os 10 primeiros termos
  print("Os 10 primeiros termos de fibonacci são: ${fib(10)}");

  //fibonacci com função recursiva
  print("Termo 10 de fibonacci: ${fibRec(10)}");

  //regra de tres
  // a / b = c / d
  print("Regra 3: ${regraDeTres(a: 1000, b: 500, d: 50)}");

  //Valida CPF
  print('Valida CPF');
  if(CPF('675.761.150-33').validaCPF()){
    print('CPF válido');
  } else {
    print('CPF inválido');
  }

}

double calcularIMC(double peso, double altura) {
  return peso / (altura * altura);
}

List<int> fib(int qtd) {
  int ultimo = 0;
  int penultimo = 1;
  int atual = 0;
  List<int> arm = [];
  arm.add(ultimo);
  arm.add(penultimo);
  for (var i = 2; i < qtd; i++) {
    atual = penultimo + ultimo;
    ultimo = penultimo;
    penultimo = atual;
    arm.add(atual);
  }
  return arm;
}

int fibRec(int n) {
  if (n < 1) {
    return 0;
  } else if (n < 3) {
    return n - 1;
  } else {
    return fibRec(n - 1) + fibRec(n - 2);
  }
}

double regraDeTres({double a = 0, double b = 0, double c = 0, double d = 0}) {
  if (a == 0) {
    a = (b * c) / d;
    return a;
  } else if (b == 0) {
    b = (a * d) / c;
    return b;
  } else if (c == 0) {
    c = (a * d) / b;
    return c;
  } else {
    d = (b * c) / a;
    return d;
  }
}

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
