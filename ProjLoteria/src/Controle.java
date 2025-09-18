
public class Controle {
    
    Loteria loteria = new Loteria();
    
    private int s1, s2, s3; 
    
    public void CadastrarNumeros (int n1, int n2, int n3){
        
        loteria.num1 = n1;
        loteria.num2 = n2;
        loteria.num3 = n3;
       
    }
    
    public int Sortear1 (){
        s1 = (int) (Math.random()*21);
        return s1;       
    }
    
    public int Sortear2 (){
        do {            
            s2 = (int) (Math.random()*21);
        } while (s2 == s1);
        return s2;
    }
    
    public int Sortear3 (){
        do {            
            s3 = (int) (Math.random()*21);
        } while (s3 == s1 || s3 == s2);
        return s3;
    }
    
    public int Resultado (){
        int acertos = 0;
        if(loteria.num1 == s1 || loteria.num1 == s2 || loteria.num1 == s3 ){
            acertos++;
        }
        if(loteria.num2 == s1 || loteria.num2 == s2 || loteria.num2 == s3 ){
            acertos++;
        }
        if(loteria.num3 == s1 || loteria.num3 == s2 || loteria.num3 == s3 ){
            acertos++;
        }
        return acertos;
    }
    
    public double Premiar (){
        double valor;
        int acertos = Resultado();
        valor = acertos * 1000.0;
        return valor;
    }
    
    public int getS1() { return s1; }
    public int getS2() { return s2; }
    public int getS3() { return s3; }
}
