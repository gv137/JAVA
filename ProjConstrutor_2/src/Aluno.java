
import javax.swing.JOptionPane;


public class Aluno {
    
    public int rgm;
    public String curso;
    public String nome;
    
    public Aluno(int ra,String cur,String nm){
        this.rgm=ra;
        this.nome=nm;
        this.curso=cur;
    }
    public void Exibir(){
        JOptionPane.showMessageDialog(null,
                "Rgm do aluno: "+this.rgm+
                "\nCurso: "+this.curso+
                "\nNome do aluno: "+this.nome);
    }
}
