# xhs-spoken-workflow 安装包

小红书口播内容全流程自动化工作流（WorkBuddy 技能）。把一篇原始文案一次自动跑完：
**内容诊断 → 口播脚本 → 去 AI 味 → 开头优化 → 标题生成 → 最终口播稿 + 流程记录**，
不用你一个个手动打开子技能。

本仓库是一个**自包含安装包**：编排器 `xhs-spoken-workflow` 及其直接依赖的兄弟技能、账号定位文件，
全部按 `~/.workbuddy/skills/` 的同级结构摆放，克隆下来即可用。

## 包内内容

| 目录 / 文件 | 作用 |
|------------|------|
| `xhs-spoken-workflow/` | 主技能（流程编排器） |
| `dbs-content/` | 内容诊断 |
| `06-script-writing/` | 小红书口播脚本生成 |
| `humanizer-zh/` | 去 AI 味 |
| `dbs-hook/` | 开头优化 |
| `dbs-xhs-title/` | 小红书标题公式 |
| `USER-PROFILE.md` | 账号定位（目标用户 / 风格 / 边界），**必须保留在同层** |

> `xhs-spoken-workflow/agents/openai.yaml` 是 Codex/OpenAI 专用 agent 定义，WorkBuddy 不使用，可忽略。

## 安装方法（二选一）

### 方法 A：安装脚本（推荐）
仓库根目录提供两个脚本，会把本包所有技能目录与 `USER-PROFILE.md` 复制到你的
WorkBuddy 用户级 skills 目录（`~/.workbuddy/skills/`）：

```bash
# Git Bash / macOS / Linux
bash install.sh

# Windows PowerShell
powershell -ExecutionPolicy Bypass -File install.ps1
```

### 方法 B：手动复制
把仓库里所有 `*/` 技能目录和 `USER-PROFILE.md` 复制到 `~/.workbuddy/skills/` 即可（覆盖同名目录）。

## 使用

- 斜杠命令：`/xhs-spoken-workflow`
- 自然语言触发（说任意一句即可）：
  - "小红书口播 workflow"
  - "全流程自动化口播"
  - "从原始文案到标题和口播稿"
  - "不要一个个打开 skill"
  - "帮我跑完整内容链路"

把原始文案贴给它，自动走完链路并输出：5 个标题、推荐标题、完整口播稿、开头说明、结尾 CTA、人工确认清单、流程记录。

> 注意：WorkBuddy 在**会话启动时**加载技能列表。安装后开个**新对话**技能才会出现。

## 依赖说明（重要）

- 上面的 6 个技能 + `USER-PROFILE.md` 已足够跑通主线口播流程。
- `06-script-writing` 还引用了 `my-media-*` 系列（`00-shared-principles`、`02-topic-scoring`、
  `10-master-workflow` 等 00–12 号技能）作为**可选增强**。缺少它们时脚本生成会优雅降级
  （用自身逻辑生成，只是少了共享原则上下文），不影响 xhs 主链路。
- 若想要 `06-script-writing` 的完整能力，把 `my-media-*` 系列（00–12）也装到同层 `skills/` 目录即可。

## 许可证 / 署名

本包整合了多个技能，分属各自作者。用于个人备份 / 安装无碍；若公开发布，请保留各技能内的署名与 LICENSE 说明。
