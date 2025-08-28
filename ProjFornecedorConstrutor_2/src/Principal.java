
public class Principal {
    
        public static void main(String[] args) {
              
        Fornecedor fornecedor1 = new Fornecedor("123-0001/01", "Gv Aço", "Mogi das Cruzes", "SP");
        Fornecedor fornecedor2 = new Fornecedor("456-0001/02", "Gv Elétrica", "Suzano", "SP");
        Fornecedor fornecedor3 = new Fornecedor("789-0001/03", "Gv Estofados", "Itaquaquecetuba", "SP");
        fornecedor1.Exibir();
        fornecedor2.Exibir();
        fornecedor3.Exibir();        
    }
    
}
