#!/bin/bash

# TEMP_FILE save cmd, OUTPUT_FILE save output when exec cmd
TEMP_FILE="cmd.txt"
OUTPUT_FILE="output.txt"

echo "cmd and its output will be telegram. Its only stop when input \"end\""
# Khởi tạo file log tạm thời
echo "" > "$TEMP_FILE"
echo "" > "$OUTPUT_FILE"

# Theo dõi nội dung mới của file log và gửi nội dung đó đến Telegram
tail -n 0 -f "$TEMP_FILE" | while read CMD; do
  # Ghi lệnh vào file đầu ra và gửi nó đến Telegram
  echo "$CMD" >> "$OUTPUT_FILE"
  ./send.sh "Command executed: $CMD"
  
  # Thực thi lệnh và ghi kết quả vào file đầu ra
  RESULT=$(eval "$CMD" 2>&1)
  echo "$RESULT" >> "$OUTPUT_FILE"
  ./send.sh "Output: $RESULT"
done &

# Vòng lặp chính để nhập lệnh
while true; do
  read -p "$ " CMD
  echo "$CMD" >> "$TEMP_FILE"
  if [ "$CMD" == "end" ]; then
    break
  fi
done

pkill -f "tail"
