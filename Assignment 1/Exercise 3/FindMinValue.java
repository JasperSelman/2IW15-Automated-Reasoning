package pkg2iw15;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FindMinValue {

    private static List<String> readFile(File f) {
        List<String> ret = new ArrayList<>();

        BufferedReader br;
        try {
            br = new BufferedReader(new FileReader(f));
        } catch (FileNotFoundException ex) {
            return ret;
        }

        try {
            String line;
            while ((line = br.readLine()) != null) {
                ret.add(line);
            }
        } catch (IOException ex) {
            //Do nothing
        } finally {
            try {
                br.close();
            } catch (IOException ex) {
                //Do nothing
            }
        }

        return ret;
    }

    private static void changeFirstLine(List<String> file, int nr) {
        file.set(0, "(define maxTime::int " + nr + ")");
    }
    
    private static void writeFile(File f, List<String> text) {
        PrintWriter pw;
        try {
            pw = new PrintWriter(f);
        } catch (FileNotFoundException ex) {
            return;
        }

        text.stream().forEach((t) -> {
            pw.println(t);
        });

        pw.close();
    }

    private static boolean runProgram(File f) {
        Runtime rt = Runtime.getRuntime();
        Process pr;
        try {
            pr = rt.exec(new String[]{"yices", f.getPath()});
        } catch (IOException ex) {
            return false;
        }
        BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream()));

        String line;
        try {
            line = input.readLine();
        } catch (IOException ex) {
            return false;
        } finally {
            try {
                input.close();
            } catch (IOException ex) {
                //Do nothing
            }
        }
        System.out.println(line);
        
        return !line.equals("unsat");
    }

    public static void main(String[] args) throws FileNotFoundException, IOException {
        File f = new File("D:\\OneDrive\\Documents\\TUe\\Collegejaar 5\\2IW15 - Automated Reasoning\\Set 1\\Opdracht1-3.smt2");
        List<String> file = readFile(f);

        int k = 1;
        
        while(!runProgram(f)) {
            changeFirstLine(file, ++k);
            writeFile(f, file);
        }
        
        System.out.println("Found: " + k);
    }
}
