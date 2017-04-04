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

		File radioFile = new File(arg[0]);
		File precipFile = new File(arg[1]);
		int offset = Integer.parseInt(arg[2]);



		BufferedReader r = new BufferedReader(new FileReader(radioFile));
		Map<String,String> radioMap = new TreeMap<>();
		Map<String,String> precipMap = new TreeMap<>();

		// radio
		String line;
		while (  (line = r.readLine()) != null) {
			String[] p = line.split(" ");
			if (p.length < 2) {
				continue;
			}
			String ts = p[0];
			String rest = line.substring(ts.length()+1);
			radioMap.put(ts, rest);
		}
		r.close();

		// precip
		r = new BufferedReader(new FileReader(precipFile));
		while (  (line = r.readLine()) != null) {
			String[] p = line.split(" ");
			if (p.length < 2) {
				continue;
			}
			String ts = p[0];
			String rest = line.substring(ts.length()+1);
			precipMap.put(ts,rest);

		}
		r.close();

		List<String>tsList = new ArrayList(radioMap.keySet());

		int start,end;
		if (offset<0) {
			start = -offset;
			end = tsList.size();
		} else {
			start = 0;
			end = tsList.size() - offset;
		}
		for (int i = start; i < end; i++) {
			System.out.println (tsList.get(i) + " " + precipMap.get(tsList.get(i+offset)) + " " + radioMap.get(tsList.get(i)));
		}

	}
}
