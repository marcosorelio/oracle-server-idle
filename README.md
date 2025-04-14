# oracle-server-idle
Idle Always Free compute instances may be reclaimed by Oracle.

### Important

#### Reclamation of Idle Compute Instances

    Idle Always Free compute instances may be reclaimed by Oracle. Oracle will deem virtual machine and bare metal compute instances as idle if, during a 7-day period, the following are true: 

- CPU utilization for the 95th percentile is less than 20%
- Network utilization is less than 20%
- Memory utilization is less than 20% (applies to A1 shapes only)

