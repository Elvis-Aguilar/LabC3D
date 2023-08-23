/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sistema.tarealabc3d;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;

/**
 *
 * @author elvis_agui
 */
public class Main {
    
    public static void main(String[] args) throws Exception {
        Reader reader = new InputStreamReader(System.in);
        Lexer lex = new Lexer(reader);
        parser parser = new parser(lex);
        
        parser.parse();
    }
     
} 
