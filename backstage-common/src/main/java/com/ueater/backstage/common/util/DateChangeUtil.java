package com.ueater.backstage.common.util;

import lombok.extern.slf4j.Slf4j;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

@Slf4j
public class DateChangeUtil {

    private DateChangeUtil(){};

    /**
     * 月日转换date
     * @param date
     * @return
     */
    public static Long monthAndDayChangeDate(String date){
        Calendar c = Calendar.getInstance();
        String[] dateArray = date.split("-");
        c.set(Calendar.YEAR,2017);
        c.set(Calendar.MONTH, Integer.parseInt(dateArray[0])-1);
        c.set(Calendar.DAY_OF_MONTH,Integer.parseInt(dateArray[1]));
        return c.getTime().getTime();
    }

    /**
     * 年月日转换date
     * @param date
     * @return
     */
    public static Long specificDateChangeDate(String date) {
        try {
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Date now= sdf.parse(date);
            return now.getTime();
        }catch (Exception e){
            log.error("specificDateChangeDate error",e);
        }
        return null;
    }

    /**
     * 年月日时分秒转换date
     * @param dateTime
     * @return
     */
    public static Long dateTimeChangeDate(String dateTime) throws ParseException {
        try {
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date now= sdf.parse(dateTime);
            return now.getTime();
        }catch (Exception e){
            log.error("dateTimeChangeDate error",e);
        }
        return null;
    }

}
