# Underground_Sensor_Experiment_1

Data from an experiment I'm conducting using low power LoRa (433MHz) radio buried under ground to relay soil temperature, humidity etc.

The sensor is buried about 0.5m underground in my garden. The receiver is located about 10m away in my home office overlooking the garden. The sensor measures temperature using a Maxim DS18B20 sensor and relays that every 143 seconds.

![temperature and precipitation chart](./charts/temperature-precipitation.png)

The hardware is based on my LPC812/RFMxx experimentation board [1]  with a RFM95W [2] LoRa [3] transceiver module powered by a 18650 sized lithium iron phosphate cell (LiFePO4). LiFePO4 is more suitable for directly powering 3.3V electronics because it has a discharge curve ranging from 3.4V to 2.8V compared to regular LiPo which runs from about 4.2V to 3.4V (the voltage is too high for most of the discharge cycle).

The precipitation data is taken from a weather station about 6km away located at NUIG university. The precipitation data is available here [4].

![radio RSSI, SNR, precipitation chart](./charts/radio-rssi-snr.png)


The power configuration for this experiment is not optimized for battery live. The radio is set at maximum transmission power and the LoRa parameters are such that a message requires about 1 second on air to transmit. The radio module consumes 100mA while transitting. So each message consumes (0.1/3600) amp-hours (Ah) of charge. The battery capacity is approx 1.5Ah. So a total of about 54000 messages, or 90 days of operation. The data so far shows that temperature 0.5m under ground varies slowly, so one message per hour is more than sufficient. Also I envisag an order of magnitude improvement in radio efficiency by tweeking the LoRa parameters. Together these improvements that can extend battery life of this device to years.

![burried sensor, red string to help retrieve](./doc/buried_sensor.jpg)

## References

[1] https://github.com/jdesbonnet/RFM69_LPC812_firmware

[2] http://www.hoperf.com/upload/rf/RFM95_96_97_98W.pdf

[3] https://www.lora-alliance.org/

[4] https://github.com/jdesbonnet/NUIG_weather_station_data

