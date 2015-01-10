package pkg2iw15;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TSP2 {
    private static int numCit;
    private static int truckLoad;
    private static int truckLoc;
    
    private static boolean doPrint(int steps, int[][] distances, int[] startSupplies, int[] maxSupplies, int maxTruck, int truckstart, int truckstartweight, File file) {
        try(PrintWriter pw = new PrintWriter(file)){
            numCit = startSupplies.length;
            truckLoad = numCit;
            truckLoc = truckLoad + 1;
            
            int[] nonSuppCit = getNonSupplierCities(startSupplies);
            int[] suppCit = getSupplierCities(startSupplies);
            
            pw.println("(define dist::(-> int int int))");
            pw.println("(define matrix::(-> int int int))");
            
            pw.println();
            
            for(int i = 0; i < distances.length; i++) {
                for(int j = 0; j < distances.length; j++) {
                    pw.println("(assert (= " + dist(i,j) + " " + distances[i][j] + "))");
                }
            }
            
            pw.println();
            
            for(int i = 0; i < numCit; i++) {
                pw.println("(assert (= " + matrix(0,i) + " " + startSupplies[i] + "))");
            }
            pw.println("(assert (= " + matrix(0, truckLoad) + " " + truckstartweight + "))");
            pw.println("(assert (= " + matrix(0, truckLoc) + " " + truckstart + "))");
            
            pw.println();
            
            for(int i = 1; i <= steps; i++) {
                for(int j : suppCit) {
                    pw.println("(assert (= " + matrix(i, j) + " (- 0 1)))");
                }
                for(int j : nonSuppCit) {
                    pw.println("(assert (> " +matrix(i, j) + " " + "0))");
                    pw.println("(assert (>= " + matrix(i, j) + " " + ite("(=" + matrix(i, truckLoc) + " " + j + ")", loadDiff(i - 1, i), "1") + "))");
                    pw.println("(assert (<= " + matrix(i, j) + " " + maxSupplies[j] + "))");
                    pw.println("(assert (= " + matrix(i, j) + " "
                            + "(+ " + matrix(i - 1, j) + " "
                            + negTimeDiff(i - 1, i)
                            + ite("(=" + matrix(i, truckLoc) + " " + j + ")", loadDiff(i - 1, i),"0") + ")))");
                }
                pw.println("(assert (> " + dist(matrix(i - 1, truckLoc), matrix(i, truckLoc)) + " 0))");
                pw.println("(assert (or");
                for(int j = 0; j < numCit; j++) {
                    pw.println("(= " + matrix(i, truckLoc) + " " + j + ")");
                }
                pw.println("))");
                pw.println("(assert (>= " + matrix(i, truckLoad) + " " 
                            + ite("(< " + matrix(String.valueOf(i),matrix(i,truckLoc)) + "0)",
                                    String.valueOf(maxTruck),"0") + "))");
                pw.println("(assert (<= " + matrix(i, truckLoad) + " " 
                            + ite("(< " + matrix(String.valueOf(i),matrix(i,truckLoc)) + "0)",
                                    String.valueOf(maxTruck), matrix(i - 1, truckLoad)) + "))");
                pw.println();
            }
            
//            pw.println("(assert (or");
//            for(int i = 0; i < steps; i++) {
//                pw.println("(and");
//                for(int j : nonSuppCit) {
//                    pw.println("(>= " + matrix(steps, j) + " " + matrix(i, j) + ")");
//                }
//                pw.println("(>= " + matrix(steps, truckLoad) + " " + matrix(i, truckLoad) + ")");
//                pw.println("(= " + matrix(steps, truckLoc) + " " + matrix(i, truckLoc) + ")");
//                pw.println(")");
//            }
//            pw.println("))");
            pw.println("(assert (or");
            for(int i = 0; i < steps; i++) {
                pw.println("(and");
                for(int j : nonSuppCit) {
                    pw.println("(= " + matrix(steps, j) + " " + matrix(i, j) + ")");
                }
                pw.println("(= " + matrix(steps, truckLoad) + " " + matrix(i, truckLoad) + ")");
                pw.println("(= " + matrix(steps, truckLoc) + " " + matrix(i, truckLoc) + ")");
                pw.println(")");
            }
            pw.println("))");
            
            pw.println();
            
            pw.println("(check)");
            return true;
        } catch (FileNotFoundException ex) {
            System.out.println("Error in writing.");
            System.out.println(ex.getMessage());
            return false;
        } 
    }
    
    private static String matrix(int i, int j) {
        return matrix(String.valueOf(i), String.valueOf(j));
    }
    
    private static String matrix(String i, String j) {
        return "(matrix " + i + " " + j + ")";
    }
    
    private static String dist(int i, int j) {
        return dist(String.valueOf(i), String.valueOf(j));
    }
    
    private static String dist(String i, String j) {
        return "(dist " + i + " " + j +")";
    }
    
    private static String loadDiff(int newStep, int oldStep) {
        return "(- (matrix " + newStep + " " + truckLoad + ") (matrix " + oldStep + " " + truckLoad + "))";
    }
    
    private static String posTimeDiff(int newStep, int oldStep) {
        return "(dist (matrix " + newStep + " " + truckLoc + ") (matrix " + oldStep + " " + truckLoc + "))";
    }
    
    private static String negTimeDiff(int newStep, int oldStep) {
        return "(- 0 " + posTimeDiff(newStep, oldStep) + ")";
    }
    
    private static String timeDiff(int s1, int s2) {
        return s1 > s2 ? posTimeDiff(s1, s2) : negTimeDiff(s1, s2);
    }
    
    private static String ite(String ifs, String thens, String elses) {
        return "(if " + ifs + " " + thens + " " + elses + ")";
    }
    
    private static boolean isSquare(int[][] i) {
        return i.length == i[0].length; 
    }
    
    private static int[] getNonSupplierCities(int[] a) {
        List<Integer> t = new ArrayList<>();
        for(int i = 0; i < a.length; i++) {
            if(a[i] != -1) {
                t.add(i);
            }
        }
        int[] ret = new int[t.size()];
        for(int i = 0; i < t.size(); i++) {
            ret[i] = t.get(i);
        }
        return ret;
    }
    
    private static int[] getSupplierCities(int[] a) {
        List<Integer> t = new ArrayList<>();
        for(int i = 0; i < a.length; i++) {
            if(a[i] == -1) {
                t.add(i);
            }
        }
        int[] ret = new int[t.size()];
        for(int i = 0; i < t.size(); i++) {
            ret[i] = t.get(i);
        }
        return ret;
    }
    
    public static void main(String[] args) {
        int steps = 2;
        int[][] dist = new int[][]{{0,29,21,-1},
                {29,0,17,32},
                {21,17,0,37},
                {-1,32,37,0}
        };
        int[] startsup = new int[]{-1,50,40,150};
        int[] maxSup = new int[]{-1,120,120,200};
        int maxTruck = 320;
        int truckStart = 0;
        int truckStartWeight = maxTruck;
        File file = new File("C:\\Users\\s105365\\Documents\\GitHub\\2IW15-Automated-Reasoning\\Assignment 2\\Exercise 2\\testb.smt2");
        
//        doPrint(steps, dist, startsup, maxSup, maxTruck, truckStart, truckStartWeight, file);
        for(int i = steps; i <= 100; i++) {
            doPrint(i, dist, startsup, maxSup, maxTruck, truckStart, truckStartWeight, file);
            
            String line;
            if((line = runProgram(file)) != null) {
                printUitkomst(line, i);
                break;
            }
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
    
    private static void printUitkomst(String s, int steps) {
        Pattern dist = Pattern.compile("\\(= \\(dist (\\d+) (\\d+)\\) (-?\\d+)\\)");
        Pattern mat = Pattern.compile("\\(= \\(matrix (\\d+) (\\d+)\\) (-?\\d+)\\)");
        
        Matcher distM = dist.matcher(s);
        
        int[][] distMat = new int[numCit][numCit];
        
        while(distM.find()) {
            distMat[Integer.parseInt(distM.group(1))][Integer.parseInt(distM.group(2))] = Integer.parseInt(distM.group(3));
        }
        
        Matcher matM = mat.matcher(s);
        
        int[][] matMat = new int[steps + 1][numCit + 2];
        
        while(matM.find()) {
            matMat[Integer.parseInt(matM.group(1))][Integer.parseInt(matM.group(2))] = Integer.parseInt(matM.group(3));
        }
        
        printArray(distMat, "Distance", false);
        
        System.out.println();
        
        printArray(matMat, "Matrix", true);
    }
    
    private static void printArray(int[][] matMat, String title, boolean prepend) {
        String t;
        
        int[] maxLengths = new int[matMat.length];
        for(int i = 0; i < matMat.length; i++) {
            for(int j = 0; j < matMat[0].length; j++) {
                t = String.valueOf(matMat[i][j]);
                maxLengths[j] = Math.max(maxLengths[j], t.length());
            }
        }
        
        int maxLength = String.valueOf(matMat.length).length();
        if(title != null && !title.isEmpty()) {
            System.out.println(title);
        }
        
        for(int i = 0; i < matMat.length; i++) {
            if(prepend) {
                t = String.valueOf(i);
                while(t.length() < maxLength) {
                    t = " " + t;
                }
                System.out.print(t + ": ");
            }
            System.out.print("[");
            for(int j = 0; j < matMat[0].length; j++) {
                t = String.valueOf(matMat[i][j]);
                while(t.length() < maxLengths[j]) {
                    t = " " + t;
                }
                System.out.print((j == 0 ? "" : " ") + t);
                System.out.print((j == matMat[0].length - 1) ? "" : ",");
            }
            System.out.println("]");
        }
    }
}
