
public class Atividades {
    
    public int MaiorNumero(int num1, int num2, int num3, int num4, int num5) {
        return Math.max(num1, Math.max(num2, Math.max(num3, Math.max(num4, num5))));
    }
    
    public boolean VerificaMultiplo(int numero) {
        return numero % 10 == 0;
    }
    
    public int CalcularMedia(int n1, int n2, int n3, int n4, int n5) {
        return (n1 + n2 + n3 + n4 + n5) / 5;
    }

    public int MediaPonderada(int n1, int n2, int n3){
        
        return ((n1*1) + (n2*2) + (n3*3)) / 6;
        
    }
    
    
}
