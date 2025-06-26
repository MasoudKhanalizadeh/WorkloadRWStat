# WorkloadRWStat

**WorkloadRWStat** is a lightweight Bash-based CLI tool for analyzing text-based workload trace files. It scans each file in a given directory, counts the number of lines containing the keywords `Read` and `Write`, and reports their percentages relative to total lines.

This tool is designed to help system architects, researchers, and performance engineers gain quick insights into I/O behavior patterns within **any kind of workload trace**, such as database benchmarks, virtual desktop infrastructure logs, synthetic I/O generators, and more.

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
- 🔧 Implemented in pure Bash using standard Unix tools (`grep`, `awk`, `wc`, `date`)

---

## 🚀 How to Use

### 1. Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/WorkloadRWStat.git
cd WorkloadRWStat
2. Make the script executable:
bash
Copy
Edit
chmod +x analyze_rw.sh
3. Run the script:
bash
Copy
Edit
./analyze_rw.sh /path/to/your/workload/files
If no path is provided, the script defaults to the current directory.

Only regular files (not subdirectories or symlinks) are analyzed.

📤 Sample Output
Both on-screen and in the output_analyze_rw file, you’ll see output like this:

yaml
Copy
Edit
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
🧪 Use Cases
WorkloadRWStat is not limited to any specific workload type. It works with:

Database traces (e.g., TPC-C, YCSB, RocksDB logs)

Storage benchmarks (e.g., FIO, Filebench, vdbench)

Virtualization logs (e.g., VDI workload traces)

Custom or synthetic workload generators

Any structured or unstructured text file where Read and Write operations appear line-by-line

⚙️ How It Works
The script uses:

grep to count the number of lines containing the keywords Read and Write

awk to calculate percentages with floating-point precision

wc -l to determine total line count

date to record timing

tee to write to both terminal and output file simultaneously

📁 File Structure
text
Copy
Edit
WorkloadRWStat/
├── analyze_rw.sh       # Main script
└── README.md           # This documentation
🔒 License
MIT License — feel free to use, modify, and redistribute.

🤝 Contributing
Contributions are welcome! If you have suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

📬 Contact
If you'd like to contribute, report issues, or further develop WorkloadRWStat, I’d be happy to hear from you!

Masoud Khanalizadeh Imani
📧 masoud.khanalizadehimani@gmail.com

Feel free to reach out with ideas, suggestions, or collaborations.
