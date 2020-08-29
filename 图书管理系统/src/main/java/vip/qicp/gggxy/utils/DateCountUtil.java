package vip.qicp.gggxy.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateCountUtil {
    /**
     * 日期减法 逾期计算
     * @param date
     * @return
     */
    public static long overdueDate(String date) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        //将时间转换为毫秒
        long nowSecond = new Date().getTime();
        long borrowSecond = df.parse(date).getTime();
        //时间相减
        long second = nowSecond-borrowSecond;
        //System.out.println(second);
        //将时间进行格式转换，转换成日
        //System.out.println(second/1000/60/60/24);
        long day=second/1000/60/60/24;
        return day;
    }


    /**
     * 日期加法 归还日期计算
     * @param date
     * @return
     */
    public static Date addDate(Date date){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);//设置起时间
        //System.out.println("111111111::::"+cal.getTime());
        //cal.add(Calendar.YEAR, 1);//增加一年
        //cd.add(Calendar.DATE, 1);//增加一天
        //cd.add(Calendar.DATE, -10);//减10天
        cal.add(Calendar.MONTH, 3);//增加一个月
        //System.out.println("输出::"+cal.getTime());
        return cal.getTime();
    }

    /**
     * 日期字符串
     * @param date
     * @return
     */
    public static String getStringDate(Date date){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        return df.format(date);
    }

}
