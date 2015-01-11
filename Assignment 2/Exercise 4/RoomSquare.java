package pkg2iw15;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RoomSquare {
    private static boolean doPrint(int size, int numPerCell, File file) {
        try(PrintWriter pw = new PrintWriter(file)){
            pw.println("(define matrix::(-> int int int int))");
            
            pw.println();
            
            for(int i = 0; i < size; i++) {
                for(int j = 0; j < size; j++) {
                    pw.println("(assert (or");
                    pw.println("(and ");
                    for(int k = 0; k < numPerCell; k++) {
                        pw.println("(= (matrix " + i + " " + j + " " + k + ") (- 0 1))");
                    }
                    pw.println(")");
                    pw.println("(and");
                    for(int k = 0; k < numPerCell; k++) {
                        pw.println("(>= (matrix " + i + " " + j + " " + k + ") 0)");
                        pw.println("(<= (matrix " + i + " " + j + " " + k + ") " + size + ")");
                    }
                    pw.println(")");
                    pw.println("))");
                }
            }
            
            pw.println();
            
            for(int n = 0; n <= size; n++) {
                for(int i = 0; i < size; i++) {
                    pw.println("(assert (= (+");
                    for(int j = 0; j < size; j++) {
                        for(int k = 0; k < numPerCell; k++) {
                            pw.println("(if (= (matrix " + i + " " + j + " " + k + ") " + n + ") 1 0)");
                        }
                    }
                    pw.println(") 1))");
                }
                
                pw.println();
                
                for(int j = 0; j < size; j++) {
                    pw.println("(assert (= (+");
                    for(int i = 0; i < size; i++) {
                        for(int k = 0; k < 2; k++) {
                            pw.println("(if (= (matrix " + i + " " + j + " " + k + ") " + n + ") 1 0)");
                        }
                    }
                    pw.println(") 1))");
                }
            }
            
            pw.println();
            
            recursion(pw, size, numPerCell);
            
            pw.println();
            
            pw.println("(check)");
            return true;
        } catch (FileNotFoundException ex) {
            System.out.println("Error in writing.");
            System.out.println(ex.getMessage());
            return false;
        } 
    }
    
    private static void recursion(PrintWriter pw, int size, int depth) {
        int[] vals = new int[0];
        recursion(pw, vals, size, depth);
    }
    
    private static void recursion(PrintWriter pw, int[] vals, int size, int depth) {
        if(depth == 0) {
            pw.println("(assert (= (+");
            for(int i = 0; i < size; i++) {
                for(int j = 0; j < size; j++) {
                    pw.println("(if (and");
                    for(int k = 0; k < vals.length; k++) {
                        pw.println("(or");
                        for(int l = 0; l < vals.length; l++) {
                            pw.println("(= (matrix " + i + " " + j + " " + l + ") " + vals[k] + ")");
                        }
                        pw.println(")");
                    }
                    pw.println(") 1 0)");
                }
            }
            pw.println(") 1))");
        } else {
            int[] k = new int[vals.length + 1];
            System.arraycopy(vals, 0, k, 0, vals.length);
            for(int i = (vals.length > 0 ? vals[vals.length - 1] + 1 : 0); i <= size; i++) {
                k[k.length - 1] = i;
                recursion(pw, k, size, depth - 1);
            }
        }
    }
    
    public static void main(String[] args) {
        int size = 9;
        File file = new File("C:\\Users\\s105365\\Documents\\GitHub\\2IW15-Automated-Reasoning\\Assignment 2\\Exercise 4\\test.smt2");
        
        doPrint(size, 2, file);

        String line;
        if((line = runProgram(file)) != null) {
            printUitkomst(line, size);
        } else {
            System.out.println("unsat");
        }
    }
    
    private static String runProgram(File f) {
        Runtime rt = Runtime.getRuntime();
        Process pr;
        try {
            pr = rt.exec(new String[]{"yices", "-e", f.getPath()});
        } catch (IOException ex) {
            return null;
        }
        BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream()));

        String line = "";
        String t;
        try {
            while((t = input.readLine()) != null) {
                line += t + "\n";
            }
        } catch (IOException ex) {
            return null;
        } finally {
            try {
                input.close();
            } catch (IOException ex) {
                //Do nothing
            }
        }
        
        return line.contains("unsat") ? null : line;
    }
    
    private static void printUitkomst(String s, int size) {
        Pattern mat = Pattern.compile("\\(= \\(matrix (\\d+) (\\d+) (\\d+)\\) (-?\\d+)\\)");
        
        Matcher matM = mat.matcher(s);
        
        int[][][] matMat = new int[size][size][2];
        
        while(matM.find()) {
            matMat[Integer.parseInt(matM.group(1))][Integer.parseInt(matM.group(2))][Integer.parseInt(matM.group(3))] = Integer.parseInt(matM.group(4));
        }
        
        for(int i = 0; i < matMat.length; i++) {
            for(int j = 0; j < matMat.length; j++) {
                Arrays.sort(matMat[i][j]);
            }
        }
        
        printArray(matMat, "Matrix");
    }
    
    private static void printArray(int[][][] matMat, String title) {
        String t;
        
        int[] maxLengths = new int[matMat.length];
        for(int i = 0; i < matMat.length; i++) {
            for(int j = 0; j < matMat[0].length; j++) {
                t = arrayToString(matMat[i][j]);
                maxLengths[j] = Math.max(maxLengths[j], t.length());
            }
        }
        
        int maxLength = String.valueOf(matMat.length).length();
        if(title != null && !title.isEmpty()) {
            System.out.println(title);
        }
        
        for(int i = 0; i < matMat.length; i++) {
            System.out.print("[");
            for(int j = 0; j < matMat[0].length; j++) {
                t = arrayToString(matMat[i][j]);
                while(t.length() < maxLengths[j]) {
                    t = " " + t;
                }
                System.out.print((j == 0 ? "" : " ") + t);
                System.out.print((j == matMat[0].length - 1) ? "" : ",");
            }
            System.out.println("]");
        }
    }
    
    private static String arrayToString(int[] arr) {
        for(int i = 0; i < arr.length; i++) {
            if(arr[i] == -1) {
                return "";
            }
        }
        String s = "{";
        for(int i : arr) {
            s += i + ",";
        }
        s = s.substring(0, s.length() - 1);
        s += "}";
        return s;
    }
}
