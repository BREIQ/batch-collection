# 🛠️ Windows Batch Utility Collection by Breiq

![Language](https://img.shields.io/badge/Language-Batch-orange?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Windows-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

A high-performance collection of automation scripts designed to optimize system management, network connectivity, and maintenance for power users and sysadmins.

---

## ☕ Support / Donations

If these tools have improved your workflow, saved you time, or helped you manage your servers more efficiently, consider supporting my work!

### [Click here to Donate via PayPal](https://www.paypal.com/paypalme/breiq)

[![Donate via PayPal](https://img.shields.io/badge/Donate-PayPal-003087?style=for-the-badge&logo=paypal&logoColor=white)](https://www.paypal.com/paypalme/breiq)

---

## 📂 Project Architecture

This repository is organized into two specialized categories to keep your workflow clean:

| Category | Folder | Script | Description |
| :--- | :--- | :--- | :--- |
| 🌐 **Network** | `connections/` | `sshc.bat` | Smart SSH manager with auto-port detection. |
| 🌐 **Network** | `connections/` | `statusservers.bat` | Real-time color-coded server monitor. |
| 🖥️ **System** | `system/` | `shutpc.bat` | Advanced power scheduler and task manager. |
| 🖥️ **System** | `system/` | `host.bat` | Instant Hosts editor with auto-elevation. |
| 🖥️ **System** | `system/` | `cachec.bat` | Deep system junk and cache cleaner. |

---

## 📝 Detailed Script Documentation

### 🌐 Connections Tools

#### 🔹 `sshc.bat`
* **Function:** Simplifies SSH connection strings by allowing separate inputs for user and host/port.
* **Why it's better:** Standard SSH windows close immediately on error. This script stays open after a session ends, allowing you to review logs or error messages before closing it manually.

#### 🔹 `statusservers.bat`
* **Function:** Pings a customizable list of servers every 10 seconds.
* **Why it's better:** Uses dynamic **ANSI Escape Codes** for instant visual feedback: **[ ONLINE ]** in Green and **[ OFFLINE ]** in Red.

---

### 🖥️ System Tools

#### 🔹 `shutpc.bat`
* **Function:** Interactive menu to schedule shutdowns or restarts in minutes.
* **Why it's better:** It includes a "Cancel" feature that kills any pending Windows power tasks, saving you from accidental shutdowns.

#### 🔹 `host.bat`
* **Function:** Directly opens the Windows `hosts` file in Notepad.
* **Why it's better:** Features **Auto-UAC Elevation**; it automatically requests Admin privileges so you don't have to "Run as Administrator" manually.

#### 🔹 `cachec.bat`
* **Function:** A maintenance powerhouse to recover disk space.
* **Why it's better:** Wipes Temp files, Prefetch data, flushes the DNS cache, and force-empties the Recycle Bin using PowerShell integration.

---

## 🚀 Installation & Usage

### Setup
```bash
git clone [https://github.com/BREIQ/batch-collection.git](https://github.com/BREIQ/batch-collection.git)