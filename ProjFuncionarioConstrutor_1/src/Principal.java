
import javax.swing.JOptionPane;


public class Principal {


    public static void main(String[] args) {
        
        Funcionario funcionario1 = new Funcionario("Gustavo", 25, 6000);
        Funcionario funcionario2 = new Funcionario("Rafael", 30, 12000);
        Funcionario funcionario3 = new Funcionario("Bruno", 40, 200);
        funcionario1.Exibir();
        funcionario2.Exibir();
        funcionario3.Exibir();
        
       double somaSalario = funcionario1.salario + funcionario2.salario + funcionario3.salario;
       
       JOptionPane.showMessageDialog(null,
                "Soma dos salários: "+ somaSalario);
       
       if (funcionario1.salario > funcionario2.salario && funcionario1.salario > funcionario3.salario) {
            JOptionPane.showMessageDialog(null,
                "Maior salário: "+funcionario1.salario);
        } else if (funcionario2.salario > funcionario1.salario && funcionario2.salario > funcionario3.salario){
            JOptionPane.showMessageDialog(null,
                "Maior salário: "+funcionario2.salario);
        } else{
            JOptionPane.showMessageDialog(null,
                "Maior salário: "+funcionario3.salario);
        }
       
        
    }
    
}
