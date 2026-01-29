#!/bin/sh

set -euo pipefail

exists() {
  command -v "$1" >/dev/null 2>&1
}

install_qqs() {
  echo "正在下载 QQS, QQSC, NVPQQS..."
  curl -fsSL https://starsky919.xyz/qqs12/QQS -o $PREFIX/bin/QQS
  curl -fsSL https://starsky919.xyz/qqs12/QQSC -o $PREFIX/bin/QQSC
  curl -fsSL https://starsky919.xyz/qqs12/NVPQQS -o $PREFIX/bin/NVPQQS
  chmod 0755 $PREFIX/bin/QQS
  chmod 0755 $PREFIX/bin/QQSC
  chmod 0755 $PREFIX/bin/NVPQQS
}

if exists ffmpeg; then
  echo "FFmpeg 已安装"
elif exists pkg; then
  echo "未检测到 FFmpeg, 正在安装...'"
  pkg install ffmpeg
else
  echo "未检测到 FFmpeg, 正在下载..."
  curl -fsSL https://starsky919.xyz/ffmpeg -o $PREFIX/bin/ffmpeg
  chmod 0755 $PREFIX/bin/ffmpeg
fi

install_qqs

echo "安装完成"

QQS