package pkg2iw15;

import java.util.Arrays;

public class IsPossible {
    public static final boolean isPossible(int[] values, int steps, int searchValue) {
        if(values.length < 3) {
            throw new IllegalArgumentException("Values array needs to be at least of length 3");
        }
        if(steps < 0) {
            throw new IllegalArgumentException("Steps needs to be >= 0");
        }
        return isPossibleImpl(values, steps, searchValue);
    }
    
    private static boolean isPossibleImpl(int[] values, int steps, int searchValue) {
        if(containsSearchValue(values, searchValue)) {
            System.out.println(Arrays.toString(values));
            return true;
        } else if(steps == 0) {
            return false;
        } else{
            for(int k = 1; k < values.length - 1; k++) {
                if(isPossibleImpl(update(values, k), steps - 1, searchValue)) {
                    System.out.println(Arrays.toString(values));
                    return true;
                }
            }
            return false;
        }
    }
    
    private static boolean containsSearchValue(int[] values, int searchValue) {
        for(int i : values) {
            if(i == searchValue) {
                return true;
            }
        }
        
        return false;
    }
    
    private static int[] update(int[] orig, int k) {
        int[] ret = new int[orig.length];
        
        System.arraycopy(orig, 0, ret, 0, k);
        ret[k] = orig[k - 1] + orig[k + 1];
        System.arraycopy(orig, k + 1, ret, k + 1, ret.length - k - 1);
        
        return ret;
    }
    
    public static void main(String[] args) {
        final int[] values = new int[]{1,2,3,4,5,6,7,8};
        final int searchValue = 157;
        final int steps = 10;
        System.out.println(isPossible(values, steps, searchValue));
    }
}
