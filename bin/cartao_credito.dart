class CartaoCredito{
  String numCartao;

  CartaoCredito(this.numCartao);

  bool validaCartao(){
    String numCartaoReplace = numCartao.replaceAll(RegExp(r' '), '');
    var ultimoDigito = numCartaoReplace[15];
    var soma = 0;
    var isValid = false;

    for(var i = 0; i < numCartaoReplace.length; i++){
      var resultMult = 0;
      if(i % 2 == 0){
      //par por 2
        resultMult = int.parse(numCartaoReplace[i]) * 2;
      } else {
      //impar por 1
        resultMult = int.parse(numCartaoReplace[i]) * 1; 
      }
      var resultMultString = resultMult.toString();
      if(resultMultString.length == 2){
        resultMult = int.parse(resultMultString[0]) + int.parse(resultMultString[1]);
      }
      soma += resultMult;
    }

    if(int.parse(ultimoDigito) == (10 - (soma % 10)) % 10){
      isValid = true;
    }

    return isValid;
  }

}
