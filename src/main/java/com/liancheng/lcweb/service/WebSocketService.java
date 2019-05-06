package com.liancheng.lcweb.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

@Component
@ServerEndpoint("/webSocket/{id}")
@Slf4j
public class WebSocketService {
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    private static CopyOnWriteArraySet<WebSocketService> webSocketSet = new CopyOnWriteArraySet<>();

    //和lineId对应，于是将其从string变为integer
    private Integer id= -1 ;

    @OnOpen
    public void onOpen(Session session,@PathParam("id") Integer id){
        this.session = session;
        this.id=id;
        webSocketSet.add(this);
        addOnlineCount();
        log.info("【websocket消息】有新的连接,总数：{},在线人数{}",webSocketSet.size(),getOnlineCount());

    }

    @OnClose
    public void onClose(){
        webSocketSet.remove(this);
        subOnlineCount();
        log.info("【websocket消息】连接断开 ,总数：{},在线人数{}",webSocketSet.size(),getOnlineCount());
    }

    @OnMessage
    public void onMessage(String message,Session session){
        log.info("【websocket消息】收到客户端发来的消息 :{}",message);
        //此处有响应，如果转发就try-catch一下

    }

    @OnError
    public void onError(Session session, Throwable error){
        log.error("【websocket消息】发生错误");
        error.printStackTrace();
    }

    //以广播的形式发送,服务器主动推送
    public void sendMessage(String message){

        try {
            this.session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //群发自定义消息，手机部分推送部分考量,manager则全收
    public static void sendInfo(String message,@PathParam("id") Integer id) throws IOException {

        for (WebSocketService webSocket : webSocketSet) {
            //只推送给uid，为null则全部推送
            if(id==-1) {
                log.info("【websocket消息】广播消息,message = {}",message);
                webSocket.sendMessage(message);
            }else if(webSocket.id.equals(id)){
                log.info("【websocket消息】自定义推送消息到窗口"+id+"，推送内容:"+message);
                webSocket.sendMessage(message);
            }
        }
    }


    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        WebSocketService.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        WebSocketService.onlineCount--;
    }


}
