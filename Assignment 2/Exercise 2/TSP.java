package pkg2iw15;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class TSP {
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
                                    String.valueOf(truckstartweight),"0") + "))");
                pw.println("(assert (<= " + matrix(i, truckLoad) + " " 
                            + ite("(< " + matrix(String.valueOf(i),matrix(i,truckLoc)) + "0)",
                                    String.valueOf(truckstartweight), matrix(i - 1, truckLoad)) + "))");
                pw.println();
            }
            
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
        int steps = 21;
        int[][] dist = new int[][]{{0,29,21,-1},
                {29,0,17,32},
                {21,17,0,37},
                {-1,32,37,0}
        };
        int[] startsup = new int[]{-1,50,40,150};
        int[] maxSup = new int[]{-1,120,120,200};
        int maxTruck = 300;
        int truckStart = 0;
        int truckStartWeight = maxTruck;
        File file = new File("C:\\Users\\s105365\\Documents\\GitHub\\2IW15-Automated-Reasoning\\Assignment 2\\Exercise 2\\test.smt2");
        doPrint(steps, dist, startsup, maxSup, maxTruck, truckStart, truckStartWeight, file);
    }
}
