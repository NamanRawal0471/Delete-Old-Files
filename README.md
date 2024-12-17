### **Project Description: Automated Directory Cleanup Script 🧹**

I developed a **Bash script** that automates the deletion of directories older than a defined retention period, helping to optimize disk space usage and streamline system maintenance.

---

### **What the Script Does**:  
1. **Targeted Directory Cleanup**:  
   - Deletes directories under specific paths that exceed the configured retention period (e.g., 30 days, 10 days, 1 day).  
   - Supports multiple directories like **Jenkins**, **UI deployments**, and **App automation logs**.  

2. **Pre- and Post-Cleanup Metrics**:  
   - Measures disk space usage **before and after** cleanup.  
   - Counts the number of directories deleted and calculates the **freed disk space**.  

3. **Dynamic Reporting**:  
   - Outputs:  
     - Disk usage (before/after cleanup).  
     - Number of directories (before/after cleanup).  
     - **Memory freed** in a readable format.

---

### **Features**:  
✅ **Automated Execution**: Scheduled deletion of old directories reduces manual intervention.  
✅ **Performance Reporting**: Provides **before-and-after stats** to track cleanup efficiency.  
✅ **Configurable Retention Periods**: Supports multiple paths, each with its own custom retention duration.  

---

### **How It Works**:  
1. **Input Paths & Retention Days**:  
   - Define paths and their corresponding retention periods. Example:  
     ```bash
     jenkins_path="/var/lib/jenkins/jobs"
     jenkins_retention_days=30
     ```
2. **Disk Usage & Directory Count**:  
   - Collects pre-cleanup metrics using `du` and `find`.  
3. **Directory Deletion**:  
   - Deletes directories older than specified days using:  
     ```bash
     find "$path" -mindepth 1 -type d -mtime +$days -exec rm -rf {} \;
     ```
4. **Report Summary**:  
   - Outputs cleanup statistics: directories removed, disk space reclaimed, and updated usage.

---

### **Tech Stack**:  
- **Bash Scripting**: For automation and dynamic directory management.  
- **Linux Utilities**:  
   - `find` – For identifying directories older than a retention period.  
   - `du` – To measure disk usage.  
   - `awk` and `wc` – For data parsing and counting.

---

### **Why It’s Useful**:  
- Ensures **efficient disk space management** by removing outdated files and directories.  
- Prevents **storage exhaustion** in systems managing logs, backups, or temporary files.  
- Easy to customize and schedule using **cron jobs**.

---

This script is a simple yet effective solution for maintaining **clean and optimized directories**, especially in environments where data grows rapidly. 🚀  

#Automation #BashScripting #DiskCleanup #SystemMaintenance #Linux #DevOps
