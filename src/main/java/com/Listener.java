package com;

import com.dao.TraceLogMapper;
import com.trace.TraceLogFactory;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * Created by ASUS on 2017-09-04.
 */
@Component
public class Listener implements ApplicationListener<ContextRefreshedEvent> {

        public void onApplicationEvent(ContextRefreshedEvent event) {
            //防止重复执行。
            if(event.getApplicationContext().getParent() == null){
                TraceLogFactory.init((TraceLogMapper)event.getApplicationContext().getBean("traceLogMapper"));
            }
        }

}
