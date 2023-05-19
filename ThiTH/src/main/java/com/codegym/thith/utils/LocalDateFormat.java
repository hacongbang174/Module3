package com.codegym.thith.utils;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class LocalDateFormat {
    private static DateTimeFormatter formatter  = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public static LocalDate parseLocalDate(String strDate) {
        DateFormat outputFormatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = Date.valueOf(strDate);
        String formattedDate = outputFormatter.format(date);
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.parse(formattedDate, inputFormatter);
        return localDate;
    }
    public static String convertDateToString(LocalDate localDate) {
        return localDate.format(formatter);
    }
    public static Date parseLocalDateToDate(LocalDate localDate) {
        Date date = Date.valueOf(localDate);
        return date;
    }

}
