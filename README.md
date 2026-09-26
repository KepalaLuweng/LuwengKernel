<div align="center">
  <img src="assets/hero_banner.svg" width="100%" alt="LuwengKernel Reborn" />

  # 🌀 LuwengKernel Reborn
  **High-Performance Custom Linux Kernel for Android ARM64 Platforms**

  [![Central Releases](https://img.shields.io/badge/DOWNLOAD-LUWENG--RELEASES-00F0FF?style=for-the-badge&logo=github)](https://github.com/KepalaLuweng/Luweng-Releases#-luwengkernel-reborn)
  [![Telegram](https://img.shields.io/badge/TELEGRAM-COMMUNITY-0088cc?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/luwengtechofficial)
  [![Linux](https://img.shields.io/badge/KERNEL-4.14.357-38bdf8?style=for-the-badge&logo=linux&logoColor=white)](https://github.com/KepalaLuweng)
</div>

> [!IMPORTANT]
> ### 🚀 Central Download Center
> All official flashable ZIP packages, changelogs, and release assets are centralized in our single distribution hub:
> 👉 **[Download LuwengKernel Packages on Luweng-Releases](https://github.com/KepalaLuweng/Luweng-Releases#-luwengkernel-reborn)**

---

## ⚡ Overview & Engineering Philosophy

**LuwengKernel Reborn** is a custom Android Linux kernel meticulously engineered for peak gaming stability, fluid UI frame pacing, and sustained daily energy efficiency. 

Built on a modernized upstream Linux foundation, **Reborn** incorporates microsecond-level thread dispatching, custom scheduler calibrations, and direct hardware-level handshake with **LuwengSense Reborn**.

---

## 🌟 Key Architectural Highlights

* **Modern Upstream Linux Foundation:** Rebased on Linux 4.14.357 with essential stability, memory management, and security patches for modern Android versions (Android 11 through Android 16).
* **Compiler & Link-Time Optimization:** Built with Azure Clang toolchain and **ThinLTO (Thin Link-Time Optimization)**, optimizing function inlining, instruction cache locality, and dead-code elimination across the entire kernel image.
* **Low-Latency Packet Scheduling:** Tuned queueing disciplines featuring **BBR (Bottleneck Bandwidth and RTT)** and **FQ-CoDel (Fair Queueing Controlled Delay)** to suppress bufferbloat and network jitter during competitive gaming.
* **Dynamic Memory Compression:** High-throughput memory compression engine (ZSTD / LZ4) maximizing effective RAM capacity and preventing aggressive low-memory app termination.
* **Native Root-Space Cloaking:** Fully integrated with **SuSFS v1.5.5** and native **ReSukiSU / KernelSU** drivers, providing transparent, undetected root capabilities directly from kernel space.
* **Hardware Ecosystem Synergy:** Seamlessly integrates with **LuwengSense Reborn** to dynamically synchronize CPU cluster frequencies, governor tunables, and thermal thresholds based on active user workloads.

---

## 📱 Supported Devices

Specifically calibrated for MediaTek Helio G90T / G95 (MT6785) platforms:

* **Realme 6** (`RMX2001`)
* **Realme 6s** (`RMX2002`)
* **Realme 6i EU** (`RMX2003`)
* **Realme 7** (`RMX2151`)
* **Realme Narzo 20 Pro**
* **Realme Narzo 30 4G**

---

## 📦 Available Flavors

| Flavor | Target Workload | Features |
| :--- | :--- | :--- |
| **ReSukiSU + SuSFS Edition** | Rooted & Gaming Workloads | Native SuSFS v1.5.5, ReSukiSU driver, full root cloaking, gaming scheduler |
| **Normal Edition** | Clean / Stock Workloads | Stock rootless foundation, ThinLTO optimizations, BBR network stack |

---

## 📲 Installation

1. Visit the central download center: **[Luweng-Releases](https://github.com/KepalaLuweng/Luweng-Releases#-luwengkernel-reborn)**.
2. Download your preferred package (`ReSukiSU-SuSFS` or `Normal`).
3. Boot into custom recovery (**TWRP**, **OrangeFox**, **PBRP**).
4. Perform a backup of your current `boot` and `dtbo` partitions.
5. Flash the downloaded `.zip` package.
6. *(Recommended)* Pair with **LuwengSense Reborn** for maximum ecosystem performance.
7. Reboot device.

---

## 🌐 Community & Links

* **Telegram Official Channel:** [t.me/luwengtechofficial](https://t.me/luwengtechofficial)
* **YouTube Tech Channel:** [youtube.com/@LuwengTechID](https://youtube.com/@LuwengTechID)
* **Developer Profile:** [github.com/KepalaLuweng](https://github.com/KepalaLuweng)
