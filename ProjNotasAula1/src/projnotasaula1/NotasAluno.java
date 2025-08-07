
package projnotasaula1;

public class NotasAluno {
    
    public int rgm;
    public String nome;
    public double nota1;
    public double nota2;
    public double nota3;
    public double nota4;
 
    
    public void Cadastrar(int rgm, String nm, double n1, double n2, double n3, double n4){
        
        this.rgm = rgm;
        this.nome = nm;
        this.nota1 = n1;
        this.nota2 = n2;
        this.nota3 = n3;
        this.nota4 = n4;
    }
    
    public void Listar(){
        System.out.println("RGM: " + this.rgm);
        System.out.println("Nome: " + this.nome);
        System.out.println("Nota 1: " + this.nota1);
        System.out.println("Nota 2: " + this.nota2);
        System.out.println("Nota 3: " + this.nota3);
        System.out.println("Nota 4: " + this.nota4);
    }
    
    public double CalcularMedia (){
       return (this.nota1 + this.nota2 + this.nota3 + this.nota4) / 4;
    }
    
}
