package com.hikvision.common.util;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 电脑远程监控工具类
 * @author yuyanwu
 * @date 2018-3-6
 */
public class RemoteComputerMonitorUtil {


    private static Logger logger = LoggerFactory.getLogger(RemoteComputerMonitorUtil.class);
    private String hostname;
    private String username;
    private String password;
    private String networkAdapter;

    public RemoteComputerMonitorUtil(String hostname, String username, String password, String networkAdapter) {
        this.hostname = hostname;
        this.username = username;
        this.password = password;
        this.networkAdapter = networkAdapter;
    }

    /**
     * 服务器状态检查（1：正常  0：异常）
     * @return
     */
    public int serverCheck(){

        int status = 1;

        try{
            Connection conn = new Connection(hostname);
            conn.connect();
        } catch (IOException e) {
            status = 0;
            logger.error(e.getMessage());
        }
        return status;

    }

    /**
     * session检测
     * @return
     */
    public Session getSession(){
        Connection conn = null;
        boolean isAuthenticated = false;
        Session session = null;
        try{
            conn = new Connection(hostname);
            conn.connect();
            isAuthenticated = conn.authenticateWithPassword(username, password);
            if (isAuthenticated == false){
                logger.error("SSH Login  Authentication failed.");
            }
            else {
                session = conn.openSession();
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return session;
    }


    /**
     * 根据获取网卡流量
     * @return
     */
    public Map<String, String> getNetworkFlow(){
        Map<String, String> map = new HashMap<>();
        String command =  "/sbin/ifconfig "+networkAdapter+" |grep bytes | awk '{print $5}'";
        List<String> result = executeCommand(command);
        if(result != null && result.size() > 0){
            long receive = Math.round(Long.parseLong(result.get(0))/1024);
            long send = Math.round(Long.parseLong(result.get(1))/1024);
            map.put("networkReceive",String.valueOf(receive));
            map.put("networkSend",String.valueOf(send));
        }else{
            map.put("networkReceive","0");
            map.put("networkSend","0");
        }
        return map;
    }

    /**
     * 获取CPU使用情况
     * @return
     */
    public  Map<String, String> getCpuUsage(){
        Map<String, String> map = new HashMap<>();
        String command =  "top -bn 1 -i -c|grep Cpu|awk '{print $2,$4,$10, $8}'";
        List result = executeCommand(command);
        if(result != null  && result.size() > 0){
            String[] cpuInfo = result.get(0).toString().split(" ");
            map.put("cpuUser",cpuInfo[0]);
            map.put("cpuSys",cpuInfo[1]);
            map.put("cpuWait",cpuInfo[2]);
            map.put("cpuIdle",cpuInfo[3]);
            double others = 100.00-Double.parseDouble(cpuInfo[0])-Double.parseDouble(cpuInfo[1])-
                    Double.parseDouble(cpuInfo[2])-Double.parseDouble(cpuInfo[3]);
            DecimalFormat df = new DecimalFormat("0.0");
            map.put("cpuOthers",df.format(others));
        }else{
            map.put("cpuUser","0");
            map.put("cpuSys","0");
            map.put("cpuWait","0");
            map.put("cpuIdle","0");
            map.put("cpuOthers","0");
        }
        return map;
    }

    /**
     * 获取内存使用情况
     * @return
     */
    public  Map<String, String> getMemUsage(){
        Map<String, String> map = new HashMap<>();
        DecimalFormat df1 = new DecimalFormat("0.000");
        String command = "cat /proc/meminfo |grep 'MemTotal\\|MemFree'|awk '{print $2}'";
        List result = executeCommand(command);
        if(result != null  && result.size() > 0){

            double memTotal = Double.parseDouble(result.get(0).toString())/1024/1024;
            double memFree = Double.parseDouble(result.get(1).toString())/1024/1024;
            double memUsed = memTotal-memFree;
            map.put("memTotal",df1.format(memTotal));
            map.put("memUsed",df1.format(memUsed));
            map.put("memFree",df1.format(memFree));
        }else{
            map.put("memTotal","0");
            map.put("memUsed","0");
            map.put("memFree","0");
        }
        return map;
    }

    /**
     * 获取磁盘使用情况
     * @return
     */
    public  String getDiskUsage(){
        StringBuffer stringBuffer = new StringBuffer();
        String command =  "df -h|grep -v Filesystem";
        List<String> result = executeCommand(command);
        for(String s : result){
            stringBuffer.append(s+";");
        }
        return stringBuffer.toString();
    }


    /**
     * 计算对应进程名称的进程数
     * @param processName
     * @return
     */
    public String processExist(String processName){

        String exist = "0";
        String command =  "ps -ef|grep "+processName+"|grep -v \"grep\" |wc -l";
        List<String> result = executeCommand(command);
        int i = Integer.parseInt(result.get(0));
        if(i > 0){
            exist = "1";
        }
        return exist;
    }




    /**
     * 执行linux命令并返回结果
     * @param command
     * @return
     */
    public  List<String> executeCommand(String command){
        Session session = getSession();
        BufferedReader input = null;
        List<String> results = new ArrayList<>();
        try {
            session.execCommand(command);
            input = new BufferedReader(new InputStreamReader(session.getStdout()));
            String line = null;
            while( (line = input.readLine()) != null){
                results.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                if(input != null){
                    input.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }finally {
                if(session != null){
                    session.close();
                }
            }
        }
        return results;
    }

}
