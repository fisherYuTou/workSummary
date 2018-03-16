
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">cpu监控
                        <a href="#" style="float:right;text-decoration:none">>></a>
                    </h3>
                </div>
                <div class="panel-body" style="overflow:auto" >
                    <div id="cpuInfo" style="height: 300px;"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">内存监控
                        <a href="#" style="float:right;text-decoration:none">>></a>
                    </h3>
                </div>
                <div class="panel-body" style="overflow:auto" >
                    <div id="cpuInfo1" style="height: 300px;"></div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">磁盘监控
                        <a href="#" style="float:right;text-decoration:none">>></a>
                    </h3>
                </div>
                <div class="panel-body" style="overflow:auto" >
                    <table class="table table-bordered table-striped" >
                        <thead>
                        <tr>
                            <td>文件系统</td>
                            <td>容量</td>
                            <td>已使</td>
                            <td>可用</td>
                            <td>已用%</td>
                            <td>挂载点</td>
                            <#--<td>部署节点</td>-->
                        </tr>
                        </thead>
                        <tbody>
                        <#list serverDetail.diskInfo as disk>
                            <tr>
                                <td>${disk.fileSystem}</td>
                                <td>${disk.totalSize}</td>
                                <td>${disk.usedSize}</td>
                                <td>${disk.freeSize}</td>
                                <td>${disk.usedPercent}</td>
                                <td>${disk.mountOn}</td>
                                <#--<td>该功能暂未实现</td>-->
                            </tr>
                        </#list>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">网络监控
                        <a href="#" style="float:right;text-decoration:none">>></a>
                    </h3>
                </div>
                <div class="panel-body" style="overflow:auto" >
                    <div id="network-flow" style="height: 300px;"></div>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript">
    option = {
        backgroundColor: '#1b1b1b',
        tooltip: {
            formatter: "{a} <br/>{c} {b} %"
        },
        series: [{
            name: '使用率',
            type: 'gauge',
            min: 0,
            max: 100,
            center: ['50%', '45%'],
            splitNumber: 10,
            radius: '80%',
            axisLine: { // 坐标轴线
                lineStyle: { // 属性lineStyle控制线条样式
                    color: [
                        [0.09, 'lime'],
                        [0.82, '#1e90ff'],
                        [1, '#ff4500']
                    ],
                    width: 3,
                    shadowColor: '#fff', //默认透明
                    shadowBlur: 10
                }
            },
            axisLabel: { // 坐标轴小标记
                textStyle: { // 属性lineStyle控制线条样式
                    fontWeight: 'bolder',
                    color: '#fff',
                    shadowColor: '#fff', //默认透明
                    shadowBlur: 10
                }
            },
            axisTick: { // 坐标轴小标记
                length: 15, // 属性length控制线长
                lineStyle: { // 属性lineStyle控制线条样式
                    color: 'auto',
                    shadowColor: '#fff', //默认透明
                    shadowBlur: 10
                }
            },
            splitLine: { // 分隔线
                length: 25, // 属性length控制线长
                lineStyle: { // 属性lineStyle（详见lineStyle）控制线条样式
                    width: 3,
                    color: '#fff',
                    shadowColor: '#fff', //默认透明
                    shadowBlur: 10
                }
            },
            pointer: { // 分隔线
                shadowColor: '#fff', //默认透明
                shadowBlur: 5
            },
            title: {
                textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                    fontWeight: 'bolder',
                    fontSize: 20,
                    fontStyle: 'italic',
                    color: '#fff',
                    shadowColor: '#fff', //默认透明
                    shadowBlur: 10
                }
            },
            detail: {
                backgroundColor: 'rgba(228, 216, 216, 0)',
                shadowBlur: 5,
                offsetCenter: ['0%', '100%'], // x, y，单位px
                textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                    fontWeight: 'bolder',
                    color: '#fff',
                },
                formatter: '内存总量:${serverDetail.memInfo.total}GB,已使用:${serverDetail.memInfo.use}GB,使用率:${serverDetail.memInfo.usePercent}%',
                fontSize:16
            },
            data: [{
                value: ${serverDetail.memInfo.usePercent}
            }]
        },

        ]
    };

    option1 = {
        title : {
            text: '',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['用户进程','系统进程','等待进程','空闲进程','其它进程']
        },
        series : [
            {
                name: '',
                type: 'pie',
                radius : '55%',
                center: ['50%', '50%'],
                data:[
                    {value:${serverDetail.cpuInfo.cpuUser}, name:'用户进程'},
                    {value:${serverDetail.cpuInfo.cpuSys}, name:'系统进程'},
                    {value:${serverDetail.cpuInfo.cpuWait}, name:'等待进程'},
                    {value:${serverDetail.cpuInfo.cpuIdle}, name:'空闲进程'},
                    {value:${serverDetail.cpuInfo.cpuOthers}, name:'其它进程'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    option2 = {
        title: {
            text: ''
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['已发送','已接收']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: [${serverDetail.networkFlow.monitor_time}]
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'已发送',
                type:'line',
                stack: '总量',
                data:[${serverDetail.networkFlow.network_send}]
            },
            {
                name:'已接收',
                type:'line',
                stack: '总量',
                data:[${serverDetail.networkFlow.network_receive}]
            }
        ]
    };



    var myChart1= echarts.init(document.getElementById('cpuInfo'));
    myChart1.setOption(option1);
    var myChart2= echarts.init(document.getElementById('cpuInfo1'));
    myChart2.setOption(option);
    var myChart3= echarts.init(document.getElementById('network-flow'));
    myChart3.setOption(option2);


</script>
