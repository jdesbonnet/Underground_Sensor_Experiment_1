/**
 * Join hourly sensor means with hourly precipitation to arrive
 * at data for precip vs snr chart.
 */
import java.io.*;
import java.util.*;
import java.text.*;

/**
 * Command line parameters:
 * 1. Sensor hourly summary file
 * 2. Hourly precipitation records
 */
public class Join {
	public static void main (String[] arg) throws Exception {

		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd-HHmmss");



		BufferedReader r = new BufferedReader(new FileReader(arg[0]));
		Map<String,String> map = new HashMap<>();

		// radio
		String line;
		while (  (line = r.readLine()) != null) {
			String[] p = line.split(" ");
			if (p.length < 2) {
				continue;
			}
			map.put(p[0], line.substring(p[0].length()+1) );
		}
		r.close();

		// precip
		r = new BufferedReader(new FileReader(arg[1]));
		while (  (line = r.readLine()) != null) {
			String[] p = line.split(" ");
			if (p.length < 2) {
				continue;
			}
			System.out.println("" + p[0] + " " + line.substring(p[0].length()+1) 
				+ " " + map.get(p[0]) );
		}
		r.close();

	}
}
