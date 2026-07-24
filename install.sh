#!/usr/bin/env bash
# 把本安装包的所有技能目录与 USER-PROFILE.md 安装到 WorkBuddy 用户级 skills 目录
set -e

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${HOME}/.workbuddy/skills"

mkdir -p "$DEST"

for dir in "$SRC"/*/; do
  name="$(basename "$dir")"
  cp -r "$dir" "$DEST/$name"
  echo "已安装 $name"
done

if [ -f "$SRC/USER-PROFILE.md" ]; then
  cp "$SRC/USER-PROFILE.md" "$DEST/USER-PROFILE.md"
  echo "已安装 USER-PROFILE.md"
fi

echo "完成：技能已安装到 $DEST"
