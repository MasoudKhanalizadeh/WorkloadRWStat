# WorkloadRWStat

> **Fast insights into I/O behavior of real-world workloads**

---

**WorkloadRWStat** is a lightweight Bash-based CLI tool for analyzing text-based workload trace files.  
It scans each file in a given directory, counts the number of lines containing `Read` and `Write`, and reports their percentages relative to total lines.

This tool is designed to help system architects, researchers, and performance engineers gain quick insights into I/O behavior patterns within **any kind of workload trace**, such as database benchmarks, virtualization logs, synthetic I/O generators, and more.

---

## 📌 Features

- ✅ Supports **any** text-based workload log or trace file
- 📊 Reports for each file:
  - Total number of lines
  - Lines containing `Read`
  - Lines containing `Write`
  - Percentages of `Read` and `Write` operations
- 🕒 Logs start and end timestamps
- ⏱️ Displays total duration of the analysis
- 🧾 Appends results to an output file (`output_analyze_rw`) without overwriting existing data
- 🔧 Implemented in pure Bash using standard Unix tools (`grep`, `awk`, `wc`, `date`, `tee`)

---

## 🚀 How to Use

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/WorkloadRWStat.git
cd WorkloadRWStat
```

### 2. Make the script executable

```bash
chmod +x analyze_rw.sh
```

### 3. Run the script

```bash
./analyze_rw.sh /path/to/your/workload/files
```

> If no path is provided, the script defaults to the current directory.  
> Only regular files (not subdirectories or symlinks) are analyzed.

---

## 📤 Sample Output

On screen and in the `output_analyze_rw` file:

```
=======================
🔰 Start time: 2025-06-26 14:00:01
Target directory: ./my_workloads
=======================

📄 Processing file: ./my_workloads/tpcc_trace.txt
  🔹 Total lines:        20490
  ✍️  Write lines:        8920 (43.54%)
  📖 Read lines:         11230 (54.82%)

📄 Processing file: ./my_workloads/custom_vdi.log
  🔹 Total lines:        175000
  ✍️  Write lines:        129480 (74.27%)
  📖 Read lines:         42000 (24.00%)

=======================
✅ End time: 2025-06-26 14:00:08
⏱️ Duration: 7 seconds
=======================
```

---

## 🧪 Use Cases

WorkloadRWStat works with any workload trace file, such as:

- 📦 Database benchmarks: `TPC-C`, `YCSB`, `RocksDB logs`
- 💾 Storage workloads: `FIO`, `Filebench`, `vdbench`
- 🖥️ VDI workload logs and virtualization traces
- 🔬 Custom or synthetic workloads used in research or simulation
- 📁 Any structured or unstructured text file containing `Read` and `Write` operations

---

## ⚙️ How It Works

Internally, the script uses:

- `grep` to count lines with `Read` and `Write`
- `awk` to calculate percentages
- `wc -l` to count total lines
- `date` to measure time
- `tee` to log output both to terminal and file

---

## 📁 File Structure

```text
WorkloadRWStat/
├── analyze_rw.sh       # Main analysis script
└── README.md           # Documentation file
```

---

## 🔒 License

This project is licensed under the **MIT License**.  
Feel free to use, modify, and redistribute for personal or commercial purposes.

---

## 📬 Contact

If you'd like to contribute, report issues, or further develop **WorkloadRWStat**, I’d be happy to hear from you!

**Masoud Khanalizadeh Imani**  
📧 masoud.khanalizadehimani@gmail.com

---

## ⭐️ Contributing

Pull requests are welcome!  
If you have suggestions for improvements or want to extend functionality (e.g., support for custom keywords, CSV output, etc.), please open an issue or a PR.

---

## 🔗 GitHub Repository Description

> Bash tool for analyzing Read/Write operations in real workload trace files.
