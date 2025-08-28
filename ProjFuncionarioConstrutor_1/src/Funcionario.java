
import javax.swing.JOptionPane;


public class Funcionario {
   
    public String nome;
    public int idade;
    public double salario;
    
    public Funcionario(String nm, int idade, double sal){
      this.nome = nm;
      this.idade = idade;
      this.salario = sal;
      
     }
            
        public void Exibir(){
        JOptionPane.showMessageDialog(null,
                "Nome do funcionário: "+this.nome+
                "\nIdade do funcionário: "+this.idade +
                "\nSalário do funcionário: "+this.salario);
    }
    
    
}
