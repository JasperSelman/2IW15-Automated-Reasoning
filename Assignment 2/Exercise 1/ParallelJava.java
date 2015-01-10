package pkg2iw15;

import java.util.Arrays;

public class ParallelJava {
    private static boolean isPossible(int nVar, int initC, int searchVal, int steps) {
        int[] vals = new int[2 * nVar + 1];
        vals[vals.length - 1] = initC;
        return isPossible(vals, nVar, searchVal, steps);
    }
    
    private static boolean isPossible(int[] vals, final int nVar, final int searchVal, int step) {
        if(step == 0) {
            if(vals[vals.length - 1] == searchVal) {
                System.out.println(Arrays.toString(vals));
                return true;
            }
            return false;
        }
        final int sMin1 = step - 1;
        for(int i = 0; i < nVar; i++) {
            if(isPossible(doCalc(vals, nVar, i), nVar, searchVal, sMin1)) {
                System.out.println(Arrays.toString(vals) + " - " + i);
                return true;
            }
        }
        return false;
    }
    
    private static int[] doCalc(int[] vals, final int nVar, int index) {
        int[] ret = new int[vals.length];
        System.arraycopy(vals, 0, ret, 0, index);
        ret[index] = (vals[index] + 1) % 3;
        System.arraycopy(vals, index + 1, ret, index + 1, nVar - (index + 1));
        System.arraycopy(vals, nVar, ret, nVar, index);
        switch(vals[index]) {
            case 0:
                ret[nVar + index] = vals[vals.length - 1];
                break;
            case 1:
                ret[nVar + index] = vals[nVar + index] + vals[vals.length - 1];
                break;
            default:
                ret[nVar + index] = vals[nVar + index];
        }
        System.arraycopy(vals, nVar + index + 1, ret, nVar + index + 1, nVar - index - 1);
        switch(vals[index]) {
            case 2:
                ret[ret.length - 1] = vals[nVar + index];
                break;
            default:
                ret[ret.length - 1] = vals[ret.length - 1];
        }
        return ret;
    }
    
    public static void main(String[] args) {
        System.out.println(isPossible(2, 1, 99, 24));
    }
}
