
package projnotasaula1;

import javax.swing.JOptionPane;


public class Principal {

    public static void main(String[] args) {
       
        NotasAluno notasAluno = new NotasAluno();
        int num_rgm = Integer.parseInt(JOptionPane.showInputDialog("Digite o número do RGM: "));
        String nme = (JOptionPane.showInputDialog("Digite o nome do aluno: "));   
        double nt1 = Double.parseDouble(JOptionPane.showInputDialog("Digite a nota 1: "));
        double nt2 = Double.parseDouble(JOptionPane.showInputDialog("Digite a nota 2: "));
        double nt3 = Double.parseDouble(JOptionPane.showInputDialog("Digite a nota 3: "));
        double nt4 = Double.parseDouble(JOptionPane.showInputDialog("Digite a nota 4: "));
        notasAluno.Cadastrar(num_rgm, nme, nt1, nt2, nt3, nt4);
        notasAluno.Listar();
        double mediaTotal = notasAluno.CalcularMedia();
        System.out.println("A media do aluno foi: " + mediaTotal);
    }
    
}
