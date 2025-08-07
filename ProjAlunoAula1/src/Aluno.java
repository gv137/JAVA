
public class Aluno {
    
    public int rgm;
    public String nome;
    public String curso;
    public double mensalidade;
    
    public void Cadastrar (int rgm, String nm, String cur, double mens){
        this.rgm = rgm;
        this.nome = nm;
        this.curso = cur;
        this.mensalidade = mens;
     }
    
    public void Listar (){
        
        System.out.println("RGM: " + this.rgm);
        System.out.println("Nome do aluno: " + this.nome);
        System.out.println("Curso: " + this.curso);
        System.out.println("Mensalidade: " + this.mensalidade);
    }
    
    public double CalcularMensalidade(double percdesc){
        this.mensalidade = this.mensalidade - (this.mensalidade*(percdesc/100));
        return this.mensalidade;
    }
}
