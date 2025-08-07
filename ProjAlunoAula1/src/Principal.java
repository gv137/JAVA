
public class Principal {

    
    public static void main(String[] args) {
        
        //criando a instância da classe Aluno
        Aluno aluno = new Aluno();
        aluno.Cadastrar(1234, "Gustavo", "ADS", 1000);  
        aluno.Listar();
        double novamens = aluno.CalcularMensalidade(10);
        System.out.println("Nova mensalidade: " + novamens);
    }
    
}
