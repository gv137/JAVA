
import javax.swing.JOptionPane;


public class Aluno {
    
    public int rgm;
    public String curso;
    public String nome;
    
    public Aluno(){
        this(112,"Info","ALexandre");
    }
    public Aluno(int ra,String cur,String nm){
        this.rgm=ra;
        this.curso=cur;
        this.nome=nm;
    }
    public void Exibir(){
        JOptionPane.showMessageDialog(null,
                "Rgm do aluno: "+this.rgm+
                "\nCurso: "+this.curso+
                "\nNome do aluno: "+this.nome);
    }
    
}
