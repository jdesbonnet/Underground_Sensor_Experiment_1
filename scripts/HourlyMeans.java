
/**
 * Reduce sensor data into hourly means for temperature, RSSI, SNR.
 */
import java.io.*;
import java.util.*;
import java.text.*;

public class HourlyMeans {
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

		double sigmaRssi = 0;
		double sigmaSnr = 0;
		double sigmaTemperature = 0;
		int nsample=0;
		long lastHour=0;
		long HOUR = 3600000L;

		String line;
		while (  (line = r.readLine()) != null) {
			String[] p = line.split(" ");
			if (p.length < 2) {
				continue;
			}
			try {
				Date timestamp = df.parse(p[0]);
				long hour = (long)(timestamp.getTime()/HOUR);
				if (hour > lastHour) {
					System.out.println (df.format(new Date((lastHour+1)*HOUR)) 
					+ " " + (sigmaTemperature / nsample) 
					+ " " + (sigmaRssi / nsample)
					+ " " + (sigmaSnr / nsample)
					); 
					nsample = 0;
					sigmaTemperature = 0;
					sigmaRssi = 0;
					sigmaSnr = 0;
					lastHour = hour;
				}
				double temperature = Double.parseDouble(p[1]);
				double rssi = Double.parseDouble(p[2]);
				double snr = Double.parseDouble(p[3]);
				sigmaTemperature += temperature;
				sigmaRssi += rssi;
				sigmaSnr += snr;
				nsample++;
		
				
			} catch (ParseException e) {
				// ignore
			}
		}
	}
}
