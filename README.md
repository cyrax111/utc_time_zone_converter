If you have [DateTime] local time and time zone was changed on a device then
timeZoneOffset would be corrected automatically but toLocal() still returned old value.
To avoid this issue, one can use toUpdatedLocal(), which converts local time with updated
time zone.

## Ideas

If you have any ideas on how to enhance this package or have any concern, feel free to make an [issue](https://github.com/cyrax111/utc_time_zone_converter/issues).