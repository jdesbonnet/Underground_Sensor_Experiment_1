/**
 * Convert radio packet log into useable data file. 
 */

import java.io.*;
import java.text.*;

public class DS18B20 {
	public static void main (String[] arg) throws Exception {

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd-HHmmss");

		File inFile = new File(arg[0]);
		BufferedReader r = new BufferedReader(new FileReader(inFile));
		String line;
		long lastMessageTime = 0;
		while (  (line = r.readLine()) != null) {
			String[] p = line.split("\\s+");
			if (p.length < 12) {
				continue;
			}

			// Only interested in node 0x53
			if ( ! "53".equals(p[5])) {
				continue;
			}

			// DS18B20 temperature
			int msbyte = Integer.parseInt(p[10],16);
			int lsbyte = Integer.parseInt(p[11],16);
			double temperature = (double)(msbyte*256+lsbyte)/(double)16;
			if (temperature > 80 || temperature < -40) {
				continue;
			}

			// Output: timestamp temperature RSSI SNR message-interval
			long t = df.parse(p[0]).getTime();
			long messageInterval = t - lastMessageTime;
			lastMessageTime = t;
			//System.out.println (p[0] + " " + temperature + " " + p[13] + " " + p[14] + " " + (messageInterval/1000) ); 
			System.out.println (p[0] + " " + temperature + " " + p[13] + " " + p[14] );
		}
	}
}
