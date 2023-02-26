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
}

double calcularIMC(double peso, double altura){
  return peso / (altura * altura);
}

List<int> fib(int qtd){
 int ultimo = 0;
  int penultimo = 1;
  int atual = 0;
  List<int> arm = []; 
    arm.add(ultimo);
    arm.add(penultimo);
  for(var i = 2; i < qtd; i++){
    atual = penultimo + ultimo;
    ultimo = penultimo;
    penultimo = atual;
    arm.add(atual);
  } 
  return arm;
}

int fibRec (int n){
    if(n < 1){
      return 0;
    } else if (n < 3){
      return n - 1;
    } else {
      return fibRec(n - 1) + fibRec(n - 2);
    }
}
