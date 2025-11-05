/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author alunocmc
 */
public class AtividadesTest {
    
    Atividades atv;
    
    public AtividadesTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        atv = new Atividades();
        
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of CalcularMedia method, of class Atividades.
     */
    @Test
    public void testCalcularMedia() {
        
        assertEquals(8, atv.CalcularMedia(9, 9, 8, 7, 7));
        
    }

    /**
     * Test of MaiorNumero method, of class Atividades.
     */
    @Test
    public void testMaiorNumero() {
        
        assertEquals(10, atv.MaiorNumero(8, 5, 7, 10, 3));
        
    }

    /**
     * Test of VerificaMultiplo method, of class Atividades.
     */
    @Test
    public void testVerificaMultiplo() {
        assertEquals(false, atv.VerificaMultiplo(30));
    }

    /**
     * Test of MediaPonderada method, of class Atividades.
     */
    @Test
    public void testMediaPonderada() {
     
        assertEquals(8, atv.MediaPonderada(7, 10, 7));
    }
    
}
