/**
 * Reduce sensor data into periodic bins for precipitation.
 */
import java.io.*;
import java.util.*;
import java.text.*;

/**
 * Command line parameters:
 * 1. Input file or  "-" for stdin
 * 2. Bin period in seconds
 */
public class PrecipMeans {
	public static void main (String[] arg) throws Exception {

		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd-HHmmss");


		BufferedReader r;
		if ("-".equals(arg[0])) {
			r = new BufferedReader(new InputStreamReader(System.in));
		} else {
			File inFile = new File(arg[0]);
			r = new BufferedReader(new FileReader(inFile));
		}

		long binPeriod = Integer.parseInt(arg[1]) * 1000L;

		double sigmaPrecip = 0;
		int nsample=0;
		long lastPeriod=0;


		String line;
		while (  (line = r.readLine()) != null) {
			String[] p = line.split(" ");
			if (p.length < 2) {
				continue;
			}
			try {
				Date timestamp = df.parse(p[0]);
				long period = (long)(timestamp.getTime()/binPeriod);
				if (period > lastPeriod) {
					System.out.println (df.format(new Date((lastPeriod+1)*binPeriod)) 
					+ " " + sigmaPrecip 
					); 
					nsample = 0;
					sigmaPrecip = 0;
					lastPeriod = period;
				}
				double precip = Double.parseDouble(p[1]);
				sigmaPrecip += precip;
				nsample++;		
			} catch (ParseException e) {
				// ignore
			}
		}
	}
}
