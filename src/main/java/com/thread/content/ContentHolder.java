package com.thread.content;

/**
 * Created by ASUS on 2017-09-03.
 */
public class ContentHolder {

    public static ThreadLocal<Integer> userIdContent = new ThreadLocal<Integer>();

    public static void setUserIdContent(Integer userId){
        userIdContent.set(userId);
    }

    public static Integer getUserIdContent(){
        return userIdContent.get();
    }

}
