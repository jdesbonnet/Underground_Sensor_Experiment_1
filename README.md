# Underground_Sensor_Experiment_1

Data from an experiment I'm conducting using low power LoRa radio buried under ground to relay soil temperature, humidity etc.

The sensor is buried about 0.5m underground in my garden. The receiver is located about 10m away in my home office overlooking the garden. The sensor measures temperature using a DS18B20 and relays that every 3 minutes or so.

The hardware is based on my LPC812/RFMxx experimentation board [1] powered by a 18650 Lithium iron phosphate cell (the chemistry is more suitable for directly powering 3.3V electronics compared to regular LiPo).

The precipitation data is taken from a weather station about 6km away located at NUIG university.
and the precipitation data is available here [2].

![temperature and precipitation chart](./charts/temperature-precipitation.png)


## References

[1] https://github.com/jdesbonnet/RFM69_LPC812_firmware

[2] https://github.com/jdesbonnet/NUIG_weather_station_data

