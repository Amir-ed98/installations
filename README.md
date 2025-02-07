### 📜 **README.md**  

```
# 🚀 Automated Installations for Python, R, and RStudio on Ubuntu 24.04

This repository contains **Bash scripts** to automate the installation of **Python**, **R**, and **RStudio** on **Ubuntu 24.04**. These scripts handle dependency installation, version management, and setup configurations for seamless use.

---

## 📌 Available Scripts

### 1️⃣ Install Python (Multiple Versions)
📄 **Script:** [`python_installation.sh`](python_installation.sh)  
📦 Installs **Python** versions (`3.8 → 3.12`) with **pip** and **virtual environments**.  

#### 🔧 **How to Use**
```bash
chmod +x python_installation.sh
./python_installation.sh
```
#### 🛠 **Features**
✅ Installs multiple Python versions  
✅ Configures **update-alternatives** to switch between versions  
✅ Installs `pip` and `venv` for each version  
✅ Creates virtual environments for each version  

---

### 2️⃣ Install R and RStudio  
📄 **Script:** [`r_installation.sh`](r_installation.sh)  
📦 Installs the latest **R** and **RStudio** with required dependencies.  

#### 🔧 **How to Use**
```bash
chmod +x r_installation.sh
./r_installation.sh
```
#### 🛠 **Features**
✅ Installs **R** from CRAN  
✅ Installs **RStudio** from the official source  
✅ Fixes **RStudio sandboxing issues**  
✅ Installs essential **development libraries**  

---

## 🔥 **How to Switch Python Versions**
After running `python_installation.sh`, you can switch Python versions manually:  
```bash
sudo update-alternatives --config python
```
Choose the version you need.

---

## 📌 **System Requirements**
- Ubuntu **24.04 LTS**
- **Internet connection** (to download packages)
- **Sudo privileges**

---

## 👨‍💻 **Contributions**
Feel free to **fork**, **modify**, and **contribute**! If you find any issues, submit a pull request or open an issue.


🚀 Happy Coding! 🔥  
```

---

### **📢 What This README Covers**
✅ **Installation instructions** for Python, R, and RStudio  
✅ **How to run scripts** with executable permissions  
✅ **Python version switching** guide  
✅ **System requirements & contribution details**  

Would you like any modifications or additional details? 🚀
