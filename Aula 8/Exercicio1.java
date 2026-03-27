import java.util.Scanner;

public class Exercicio1 {

    public static void main(String[] args){
        // criando o objeto scanner para ler a entrada
        Scanner scanner = new Scanner(System.in);
        System.out.println("Digite seu nome completo: ");

        // chamando o método nextLine() em scanner pra pegar o nome todo da linha
        String nomeCompleto = scanner.nextLine();

        // trim tira os espaços de antes e depois, split("\\s+") pra dividir a string por um ou mais espaços
        // "\s" = caracter em branco, "+" = 1 ou mais.
        // split(" ") causaria erros se existissem espaços duplos.
        String[] nomes = nomeCompleto.trim().split("\\s+");

        // verifica a condição de pelo menos 2 nomes
        if (nomes.length >= 2){
            String primeiroNome = nomes[0];

            String ultimoNome = nomes[nomes.length - 1];

            System.out.println("Primeiro: " + primeiroNome);
            System.out.println("Último: " + ultimoNome);
        }else{
            System.out.println("O nome deve conter pelo menos 2 nomes");
        }
        scanner.close();
    }
}
