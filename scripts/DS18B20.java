/**
 * Convert radio packet log into useable data file. 
 *
 * Parameters: sensor-log-file node-addr
 */

import java.io.*;
import java.text.*;
import java.util.Date;
import java.util.TimeZone;

public class DS18B20 {

	private static SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd-HHmmss");

	// ISO 8601 time format
	private static TimeZone utcTz = TimeZone.getTimeZone("UTC");
	private static SimpleDateFormat isodf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");

	static {
		isodf.setTimeZone(utcTz);
	}

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

		double prevTemperature = -99;

		while (  (line = r.readLine()) != null) {
			String[] p = line.split("\\s+");

			if (p.length < 12) {
				continue;
			}

                        if (! "FRAME:".equals(p[2])) {
				continue;
			}

			// Data packets addressed to node 0, ignore others.
			String toNode = p[4].toUpperCase();
			if ( !toNode.equals("0")) {
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
			int temp32 = (msbyte << 8) | (lsbyte&0xff);
			short temp16 = (short)temp32;
			double temperature = (double)temp16/16.0;
			if (temperature > 80 || temperature < -40) {
				continue;
			}

			// Ignore spikes
			if (prevTemperature>-90 && Math.abs(temperature-prevTemperature)>5) {
				continue;
			}

			// Output: timestamp temperature RSSI SNR message-interval
			String timestampStr = p[0];
			Date timestamp;
			if (timestampStr.indexOf("T")>0) {
				timestamp = isodf.parse(timestampStr);
			} else {
				timestamp = df.parse(timestampStr);	
			}
			long t = timestamp.getTime();
			long messageInterval = t - lastMessageTime;
			lastMessageTime = t;

			// Gap in data: add blank line for gnuplot
			if (messageInterval > 3600*12*1000L) {
				System.out.println ("");
				prevTemperature=-99;
			}

			System.out.println (df.format(timestamp) + " " + temperature + " " + p[13] + " " + p[14] );

			prevTemperature = temperature;
		}
	}

	private static void usage () {
		System.out.println ("parameers: package-log-file node-address");
	}
}
