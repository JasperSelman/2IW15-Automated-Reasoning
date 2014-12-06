package pkg2iw15;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class GenSol {
    
    private static boolean doPrint(final int steps, final int size, final int searchVal, final File f) {
        try (PrintWriter pw = new PrintWriter(f)){
            pw.println("(define matrix::(-> int int int))");
            
            pw.println();
            
            for(int i = 1; i <= size; i++) {
                pw.println(getAssertEquals(0, i, i));
            }
            
            pw.println();
            
            for(int r = 1; r <= steps; r++) {
                pw.println("(assert (or");
                for(int a = 2; a < size; a++) {
                    pw.println(getChange(r, a, size));
                }
                pw.println("))");
            }
            
            pw.println();
            
            pw.println("(assert (or");
            for(int i = 1; i <= size; i++) {
                pw.println(getEquals(steps, i, searchVal));
            }
            pw.println("))");
            
            pw.println();
            
            pw.println("(check)");
            
            return true;
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    private static String getAssertEquals(final int row, final int index, final int value) {
        return "(assert " + getEquals(row, index, value) + ")";
    }
    
    private static String getEquals(final int row, final int index, final int value) {
        return "(= (matrix " + row + " " + index + ") " + value + ")";
    }
    
    private static String getMatrixEquals(final int r1, final int i1, final int r2, final int i2) {
        return "(= (matrix " + r1 + " " + i1 + ") (matrix " + r2 + " " + i2 + "))";
    }
    
    private static String getCalc(final int r1, final int i1, final int r2) {
        return "(= (matrix " + r1 + " " + i1 + ") (+ (matrix " + r2 + " " + (i1 - 1) + ") (matrix " + r2 + " " + (i1 + 1) + ")))";
    }
    
    private static String getChange(final int row, final int index, final int size) {
        StringBuilder s = new StringBuilder();
        final int minRow = row - 1;
        
        s.append("(and\n");
        for(int i = 1; i < index; i++) {
            s.append(getMatrixEquals(row, i, minRow, i));
            s.append("\n");
        }
        s.append(getCalc(row, index, minRow));
        s.append("\n");
        for(int i = index + 1; i <= size; i++) {
            s.append(getMatrixEquals(row, i, minRow, i));
            s.append("\n");
        }
        s.append(")");
        
        return s.toString();
    }
    
    public static void main(String[] args) {
//        if(args.length != 1) {
//            throw new IllegalArgumentException("Need exactly 4 arguments.");
//        }
        File f = new File("C:\\Users\\s105365\\Documents\\GitHub\\2IW15-Automated-Reasoning\\Assignment 1\\Exercise 4\\Temp.smt2");
//        if(doPrint(Integer.parseInt(args[0]), Integer.parseInt(args[1]), Integer.parseInt(args[2]), new File(args[3]))) {
        if(doPrint(10, 8, 157, f)) {
            System.out.println("Succes!");
            System.exit(0);
        } else {
            System.exit(1);
        }
    }
}
