/**
 * Convert radio packet log into useable data file. 
 *
 * Parameters: sensor-log-file node-addr
 */

import java.io.*;
import java.text.*;

public class DS18B20 {

	private static SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd-HHmmss");

	public static void main (String[] arg) throws Exception {

		if (arg.length < 2) {
			usage();
			return;
		}
	
		File inFile = new File(arg[0]);

		String sensorAddr = arg[1];

		if (sensorAddr.startsWith("0x")) {
			sensorAddr = sensorAddr.substring(2);
		}
		sensorAddr = sensorAddr.toUpperCase();

		BufferedReader r = new BufferedReader(new FileReader(inFile));
		String line;
		long lastMessageTime = 0;
		while (  (line = r.readLine()) != null) {
			String[] p = line.split("\\s+");
			if (p.length < 12) {
				continue;
			}

			String node = p[5].toUpperCase();

			// Only interested in sensor node
			if ( ! sensorAddr.equals(node)) {
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
			System.out.println (p[0] + " " + temperature + " " + p[13] + " " + p[14] );
		}
	}

	private static void usage () {
		System.out.println ("parameers: package-log-file node-address");
	}
}
