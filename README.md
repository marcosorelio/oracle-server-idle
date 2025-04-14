# oracle-server-idle
Idle Always Free compute instances may be reclaimed by Oracle.

### Important

#### Reclamation of Idle Compute Instances

    Idle Always Free compute instances may be reclaimed by Oracle. Oracle will deem virtual machine and bare metal compute instances as idle if, during a 7-day period, the following are true:


- CPU utilization for the 95th percentile is less than 20%
- Network utilization is less than 20%
- Memory utilization is less than 20% (applies to A1 shapes only)

#### Reclamation of Idle Compute Instances

| to configure crontab server
```shell
16 04 * * * sh /home/ubuntu/oracle-server-idle/uptime-no-idle.sh
18 05 * * * sh /home/ubuntu/oracle-server-idle/uptime-no-idle.sh
30 03 * * * sh /home/ubuntu/oracle-server-idle/uptime-no-idle.sh
21 06 * * * sh /home/ubuntu/oracle-server-idle/uptime-no-idle.sh
04 07 * * * sh /home/ubuntu/oracle-server-idle/uptime-no-idle.sh
30 08 * * * sh /home/ubuntu/oracle-server-idle/uptime-no-idle.sh
```