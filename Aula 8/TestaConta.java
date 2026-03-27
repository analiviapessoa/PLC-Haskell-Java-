public class TestaConta {
  public static void main(String[] args) {
    // Conta c = new Conta("123-X", 8.0);
    Conta c = new Conta("123-X");
    System.out.println("Conta "+c.getNumero());
    System.out.println(" saldo "+c.getSaldo());
    System.out.println();
    c.creditar(10.0);
    c.debitar(5.0);
    System.out.println("Conta "+c.getNumero());
    System.out.println(" saldo "+c.getSaldo());
  } 
}
