package com.hikvision.common.service.impl;

import com.hikvision.common.bean.DiskInfo;
import com.hikvision.common.domain.TComputeMonitorLog;
import com.hikvision.common.domain.TMonitorWarning;
import com.hikvision.common.domain.TServerInfo;
import com.hikvision.common.mapper.TComputeMonitorLogMapper;
import com.hikvision.common.mapper.TMonitorWarningMapper;
import com.hikvision.common.mapper.TServerInfoMapper;
import com.hikvision.common.service.ServerService;
import com.hikvision.common.util.RemoteComputerMonitorUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.*;

/**
 * 服务器-service实现
 * @author yuyanwu
 * @date 2018-3-7
 */
@Service
public class ServerServiceImpl implements ServerService {

    private static Logger logger = LoggerFactory.getLogger(ServerServiceImpl.class);

    @Autowired
    private TComputeMonitorLogMapper tComputeMonitorLogMapper;

    @Autowired
    private TMonitorWarningMapper tMonitorWarningMapper;

    @Autowired
    private TServerInfoMapper tServerInfoMapper;


    /**
     * 服务器监控
     */
    @Override
    public void serverMonitor() {
        logger.info("==========服务器监控==========");
        Timestamp monitorTime = new Timestamp(Calendar.getInstance().getTimeInMillis());
        List<TServerInfo> serverList = tServerInfoMapper.selectRecords();
        for(TServerInfo tServerInfo : serverList){
            RemoteComputerMonitorUtil remoteComputerMonitorUtil = new RemoteComputerMonitorUtil(tServerInfo.getIp(), tServerInfo.getUsername(), tServerInfo.getPassword(), tServerInfo.getNetworkCard());
            int status = remoteComputerMonitorUtil.serverCheck();
            if(status == 1){
                Map<String, String> cpuInfo = remoteComputerMonitorUtil.getCpuUsage();
                Map<String, String> memInfo = remoteComputerMonitorUtil.getMemUsage();
                String diskUsage = remoteComputerMonitorUtil.getDiskUsage();
                Map<String, String> networkFlow = remoteComputerMonitorUtil.getNetworkFlow();
                TComputeMonitorLog tComputeMonitorLog = new TComputeMonitorLog();
                tComputeMonitorLog.setIp(tServerInfo.getIp());
                tComputeMonitorLog.setMonitorTime(monitorTime);
                tComputeMonitorLog.setCpuUser(cpuInfo.get("cpuUser"));
                tComputeMonitorLog.setCpuSys(cpuInfo.get("cpuSys"));
                tComputeMonitorLog.setCpuWait(cpuInfo.get("cpuWait"));
                tComputeMonitorLog.setCpuIdle(cpuInfo.get("cpuIdle"));
                tComputeMonitorLog.setCpuOthers(cpuInfo.get("cpuOthers"));
                tComputeMonitorLog.setMemTotal(memInfo.get("memTotal"));
                tComputeMonitorLog.setMemUsed(memInfo.get("memUsed"));
                tComputeMonitorLog.setMemFree(memInfo.get("memFree"));
                tComputeMonitorLog.setDiskUsage(diskUsage);
                tComputeMonitorLog.setNetworkReceive(networkFlow.get("networkReceive"));
                tComputeMonitorLog.setNetworkSend(networkFlow.get("networkSend"));
                tComputeMonitorLogMapper.insertRecord(tComputeMonitorLog);
            }else{
                TMonitorWarning tMonitorWarning = new TMonitorWarning();
                tMonitorWarning.setMonitorTime(monitorTime);
                tMonitorWarning.setWarningDesc("服务器（"+tServerInfo.getIp()+"）连接失败， 请检查");
                tMonitorWarningMapper.insertRecord(tMonitorWarning);
            }
        }
    }


    /**
     * 获取服务器列表
     * @return
     */
    @Override
    public List<TServerInfo> getServerList() {
        return tServerInfoMapper.selectRecords();
    }


    /**
     * 获取服务器日志
     * @param ip
     * @return
     */
    @Override
    public Map<String, Object> getServerDetail(String ip) {

        List<TComputeMonitorLog> tComputeMonitorLogs = tComputeMonitorLogMapper.selectRecords(ip);
        DecimalFormat df1 = new DecimalFormat("0.00");
        TComputeMonitorLog tComputeMonitorLog = null;
        if(tComputeMonitorLogs != null && tComputeMonitorLogs.size() > 0){
            tComputeMonitorLog = tComputeMonitorLogs.get(0);
        }

        Map<String, Object> serverInfo = new HashMap<>();
        Map<String, Object> cpuInfo = new HashMap<>();
        Map<String, Object> memInfo = new HashMap<>();
        List<DiskInfo> diskInfo = new ArrayList<>();
        Map<String, Object> networkFlow = new HashMap<>();


        if(tComputeMonitorLog != null){
            // 组装CPU信息
            cpuInfo.put("cpuUser", tComputeMonitorLog.getCpuUser());
            cpuInfo.put("cpuSys", tComputeMonitorLog.getCpuSys());
            cpuInfo.put("cpuWait", tComputeMonitorLog.getCpuWait());
            cpuInfo.put("cpuIdle", tComputeMonitorLog.getCpuIdle());
            cpuInfo.put("cpuOthers", tComputeMonitorLog.getCpuOthers());

            //组装内存信息
            String total = tComputeMonitorLog.getMemTotal();
            String use = tComputeMonitorLog.getMemUsed();
            memInfo.put("total",total);
            memInfo.put("use",use);
            memInfo.put("usePercent",df1.format(Double.parseDouble(use)/Double.parseDouble(total)*100));

            //组装磁盘信息
            String[] diskInfos = tComputeMonitorLog.getDiskUsage().split(";");
            for(int i = 0; i< diskInfos.length; i++){
                String[] diskDetail = diskInfos[i].split("\\s+");
                DiskInfo diskInfo1 = new DiskInfo();
                diskInfo1.setFileSystem(diskDetail[0]);
                diskInfo1.setTotalSize(diskDetail[1]);
                diskInfo1.setUsedSize(diskDetail[2]);
                diskInfo1.setFreeSize(diskDetail[3]);
                diskInfo1.setUsedPercent(diskDetail[4]);
                diskInfo1.setMountOn(diskDetail[5]);
                diskInfo.add(diskInfo1);
            }

            //组装网络流量
            networkFlow = tComputeMonitorLogMapper.getLatestNetworkFlow(ip);
        }

        serverInfo.put("cpuInfo",cpuInfo);
        serverInfo.put("memInfo",memInfo);
        serverInfo.put("diskInfo",diskInfo);
        serverInfo.put("networkFlow",networkFlow);

        return serverInfo;
    }

}
