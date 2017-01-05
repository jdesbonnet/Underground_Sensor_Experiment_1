
/**
 * Convert time format from NUIG weather station data file to format used in 
 * GnuPlots. eg 2016-12-01 22:33:00 to  20161201-223300
 */
import java.io.*;
import java.util.*;
import java.text.*;

public class ConvertTimeFormat {
	public static void main (String[] arg) throws Exception {

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dfout = new SimpleDateFormat("yyyyMMdd-HHmmss");

		File inFile = new File(arg[0]);
		BufferedReader r = new BufferedReader(new FileReader(inFile));
		String line;
		while (  (line = r.readLine()) != null) {
			String[] p = line.split("\\t");
			if (p.length < 2) {
				continue;
			}
			Date timestamp = df.parse(p[0]);
			double precipitation = Double.parseDouble(p[1]);
			System.out.println (dfout.format(timestamp) + " " + precipitation); 
		}
	}
}
