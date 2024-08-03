#!/bin/bash

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` [TOKEN] [CHAT_ID] [-option] [-arg]"

  echo "-text content"
  echo "-document file_path"
  echo "-photo photo_path"
  echo "-audio audio_path"
  echo "-video video_path"
  echo "-sticker sticker_path"
  echo "-voice voice_path"
  echo "-location latitude longitude"
  exit 0
fi

TOKEN="$1"
CHAT_ID="$2"

if [ "$3" == "-text" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
  -d chat_id="$CHAT_ID" \
  -d text="$4"

  exit 0
fi

if [ "$3" == "-document" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
  -F chat_id="$CHAT_ID" \
  -F document=@"$4"
  exit 0
fi

if [ "$3" == "-photo" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendPhoto" \
  -F chat_id="$CHAT_ID" \
  -F photo=@"$4"

  exit 0
fi

if [ "$3" == "-audio" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendAudio" \
  -F chat_id="$CHAT_ID" \
  -F audio=@"$4"

  exit 0
fi

if [ "$3" == "-document" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
  -F chat_id="$CHAT_ID" \
  -F document=@"$4"
  exit 0
fi

if [ "$3" == "-video" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendVideo" \
  -F chat_id="$CHAT_ID" \
  -F video=@"$4"

  exit 0
fi

if [ "$3" == "-document" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
  -F chat_id="$CHAT_ID" \
  -F document=@"$4"
  exit 0
fi

if [ "$3" == "-sticker" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendSticker" \
  -F chat_id="$CHAT_ID" \
  -F sticker=@"$4"

  exit 0
fi

if [ "$3" == "-voice" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendVoice" \
  -F chat_id="$CHAT_ID" \
  -F voice=@"$4"
  exit 0
fi

if [ "$3" == "-location" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendLocation" \
  -d chat_id="$CHAT_ID" \
  -d latitude="$4" \
  -d longitude="$5"
  exit 0
fi


