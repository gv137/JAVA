/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author alunocmc
 */
public class CalculoTest {
    
    Calculo calc;
    
    public CalculoTest() {
    }
    
    @BeforeAll
    public static void setUpClass() {
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @BeforeEach
    public void setUp() {
        calc = new Calculo();
    }
    
    @AfterEach
    public void tearDown() {
    }

    /**
     * Test of CalcularMedia method, of class Calculo.
     */
    @Test
    public void testCalcularMedia() {
        assertEquals(7, calc.CalcularMedia(8, 6));
        
    }

    /**
     * Test of MaiorNumero method, of class Calculo.
     */
    @Test
    public void testMaiorNumero() {
        
    }

    /**
     * Test of VerificaPar method, of class Calculo.
     */
    @Test
    public void testVerificaPar() {
        
    }
    
}
