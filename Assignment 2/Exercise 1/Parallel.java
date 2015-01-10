package pkg2iw15;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class Parallel {

    private static boolean doPrint(final int nrVars, final int initC, final int nrSteps, final int searchVal, final File file) {
        try(PrintWriter pw = new PrintWriter(file)){
            pw.println("(define matrix::(-> int int int))");
            
            pw.println();
            
            final int cLoc = 2 * nrVars;
            
            for(int i = 0; i < nrVars; i++) {
                pw.println("(assert (= (matrix 0 " + i + ") 0))");
            }
            for(int i = 0; i < nrVars; i++) {
                pw.println("(assert (= (matrix 0 " + (i + nrVars) + ") 0))");
            }
            
            pw.println("(assert (= (matrix 0 " + cLoc + ") " + initC + "))");
            
            pw.println();
            pw.println();
            
            for(int i = 1; i <= nrSteps; i++) {
                pw.println("(assert (or");
                for(int j = 0; j < nrVars; j++) {
                    pw.println("(and");
                    for(int k = 0; k < j; k++) {
                        pw.println("(= (matrix " + i + " " + k + ") (matrix " + (i - 1) + " " + k + "))");
                    }
                    pw.println("(= (matrix " + i + " " + j + ") (mod (+ (matrix " + (i - 1) + " " + j + ") 1) 3))");
                    for(int k = j + 1; k < nrVars; k++) {
                        pw.println("(= (matrix " + i + " " + k + ") (matrix " + (i - 1) + " " + k + "))");
                    }
                    for(int k = 0; k < j; k++) {
                        pw.println("(= (matrix " + i + " " + (k + nrVars) + ") (matrix " + (i - 1) + " " + (k + nrVars) + "))");
                    }
                    pw.println("(= (matrix " + i + " " + (j + nrVars) + ") (if (= (matrix " + (i - 1) + " " + j + ") 0)"
                            + "(matrix " + (i - 1) + " " + cLoc + ") (if (= (matrix " + (i - 1) + " " + j + ") 1)"
                            + "(+ (matrix " + (i - 1) + " " + cLoc +") (matrix " + (i - 1) + " " + (j + nrVars) + "))"
                            + "(matrix " + (i - 1) + " " + (j + nrVars) + "))))");
                    for(int k = j + 1; k < nrVars; k++) {
                        pw.println("(= (matrix " + i + " " + (k + nrVars) + ") (matrix " + (i - 1) + " " + (k + nrVars) + "))");
                    }
                    pw.println("(= (matrix " + i + " " + cLoc + ") (if (= (matrix " + (i - 1) + " " + j + ") 2)"
                            + "(matrix " + (i - 1) + " " + (j + nrVars) + ") (matrix " + (i - 1) + " " + cLoc + ")))");
                    pw.println(")");
                }                
                pw.println("))");
                pw.println();
            }
            
            pw.println();
            pw.println("(assert (= (matrix " + nrSteps + " " + cLoc + ")" + searchVal + "))");
            
            pw.println();
            pw.println("(check)");
            
            return true;
        } catch (FileNotFoundException ex) {
            System.out.println("Error in writing.");
            System.out.println(ex.getMessage());
            return false;
        }
    }
    
    public static void main(String[] args) {
//        if(args.length != 1) {
//            throw new IllegalArgumentException("Need exactly 5 arguments.");
//        }
//        if(doPrint(Integer.parseInt(args[0]), Integer.parseInt(args[1]), Integer.parseInt(args[2]), Integer.parseInt(args[3]), new File(args[4]))) {
//            System.out.println("Succes!");
//            System.exit(0);
//        } else {
//            System.exit(1);
//        }
        doPrint(2, 1, 24, 99, new File("C:\\Users\\s105365\\Documents\\GitHub\\2IW15-Automated-Reasoning\\Assignment 2\\Exercise 1\\test.smt2"));
    }
}
