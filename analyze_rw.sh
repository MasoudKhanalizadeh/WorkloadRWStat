#!/bin/bash

# Use the provided directory as input, or default to the current directory
DIR=${1:-.}

# Output file
OUT_FILE="output_analyze_rw"

# Record start time (epoch seconds)
start_time=$(date +%s)
start_human=$(date "+%Y-%m-%d %H:%M:%S")

echo "=======================" | tee -a "$OUT_FILE"
echo "🔰 Start time: $start_human" | tee -a "$OUT_FILE"
echo "Target directory: $DIR" | tee -a "$OUT_FILE"
echo "=======================" | tee -a "$OUT_FILE"
echo | tee -a "$OUT_FILE"

# Loop through each file in the given directory
for file in "$DIR"/*; do
    if [[ -f "$file" ]]; then
        echo "📄 Processing file: $file" | tee -a "$OUT_FILE"

        total_lines=$(wc -l < "$file")
        write_lines=$(grep -i -c 'Write' "$file")
        read_lines=$(grep -i -c 'Read' "$file")

        write_percent=$(awk -v w=$write_lines -v t=$total_lines 'BEGIN { if (t==0) print 0; else printf "%.2f", (w/t)*100 }')
        read_percent=$(awk -v r=$read_lines -v t=$total_lines 'BEGIN { if (t==0) print 0; else printf "%.2f", (r/t)*100 }')

        {
            echo "  🔹 Total lines:        $total_lines"
            echo "  ✍️  Write lines:        $write_lines ($write_percent%)"
            echo "  📖 Read lines:         $read_lines ($read_percent%)"
            echo
        } | tee -a "$OUT_FILE"
    fi
done

# Record end time and calculate duration
end_time=$(date +%s)
end_human=$(date "+%Y-%m-%d %H:%M:%S")
duration=$((end_time - start_time))

echo "=======================" | tee -a "$OUT_FILE"
echo "✅ End time: $end_human" | tee -a "$OUT_FILE"
echo "⏱️ Duration: $duration seconds" | tee -a "$OUT_FILE"
echo "=======================" | tee -a "$OUT_FILE"
