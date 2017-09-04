package com.trace;

import com.dao.TraceLogMapper;
import com.model.TraceLog;

import java.util.Date;
import java.util.concurrent.*;

/**
 * Created by ASUS on 2017-09-04.
 */
public class TraceLogFactory {

    public static final BlockingQueue<TraceLog> queue = new LinkedBlockingQueue<TraceLog>(1024);

    public static TraceLogMapper traceLogMapper;

    public static ExecutorService executor = Executors.newFixedThreadPool(30);

    public static void init(TraceLogMapper traceLogMapperII){
        traceLogMapper = traceLogMapperII;
        try {
            while(!Thread.interrupted()){
                final TraceLog traceLog = queue.take();
                executor.submit(new Runnable() {
                    @Override
                    public void run() {
                        traceLogMapper.insert(traceLog);
                    }
                });

            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void pushTraceLog(String traceType, Date actionDate, Integer userId, String userType, String content){
        try {
            queue.put(new TraceLog(traceType, actionDate, userId, userType, content));
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
