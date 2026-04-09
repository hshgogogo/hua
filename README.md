# series-storytelling-skill

这是一个面向 OpenClaw / ClawHub 的长篇剧集创作技能仓库。它把“单集故事 -> 多线长篇 -> 季终闭环与续季钩子”的创作方法，整理成可安装、可分发的 skill bundle。

真正可安装的技能内容位于 `series-storytelling-skill/`。

## 仓库结构

```text
.
├── series-storytelling-skill/
│   ├── SKILL.md
│   ├── LICENSE
│   ├── examples/
│   ├── images/
│   ├── references/
│   └── templates/
├── install-openclaw-skill.sh
├── .gitignore
└── LICENSE
```

## 安装到 OpenClaw

### 方式 1：从 ClawHub 安装

发布完成后可直接使用：

```bash
openclaw skills install series-storytelling-skill
```

OpenClaw 会把技能安装到当前 workspace 的 `skills/` 目录中。根据官方文档，`openclaw skills install <slug>` 是从 ClawHub 安装技能的原生方式。来源：[Skills](https://docs.openclaw.ai/tools/skills)、[ClawHub](https://docs.openclaw.ai/tools/clawhub)

### 方式 2：从 GitHub 手动安装

```bash
git clone https://github.com/hshgogogo/hua.git
cd hua
./install-openclaw-skill.sh
```

默认会把技能复制到 `~/.openclaw/skills/series-storytelling-skill`。如果你想装到某个具体 workspace，也可以把 `skills/` 目录作为参数传给脚本：

```bash
./install-openclaw-skill.sh /path/to/workspace/skills
```

或者手动复制：

```bash
mkdir -p /path/to/workspace/skills
cp -R series-storytelling-skill /path/to/workspace/skills/
```

官方文档说明，OpenClaw 会从 `<workspace>/skills` 和 `~/.openclaw/skills` 加载技能。来源：[Skills](https://docs.openclaw.ai/tools/skills)、[FAQ](https://docs.openclaw.ai/help/faq)

## 使用方式

安装后，在 OpenClaw 里直接调用这个 skill，或在对话中给出类似请求：

- 把一个单集犯罪故事扩展成 8 集网剧
- 基于人物关系草图生成一季大纲
- 根据视频笔记整理主线、副线、季终钩子和角色弧光

## 核心内容

- 单集 SOP 模板：`series-storytelling-skill/templates/episode-sop.md`
- 全季大纲模板：`series-storytelling-skill/templates/series-outline.md`
- 进阶参考：`series-storytelling-skill/references/advanced.md`
- 结构案例：`series-storytelling-skill/examples/wolf-story/`

## 发布说明

这个仓库按单技能仓库整理，`series-storytelling-skill/` 可直接作为 ClawHub 的发布路径：

```bash
clawhub skill publish ./series-storytelling-skill \
  --slug series-storytelling-skill \
  --name "Series Storytelling Skill" \
  --version 1.0.0 \
  --tags latest,writing,storytelling,screenwriting
```

## 说明

- 本仓库聚焦创作方法论和模板工具，不包含对任何原始剧本或视频内容的逐字转载。
- 发布到 ClawHub 需要单独安装并登录 `clawhub` CLI。官方命令见：[ClawHub](https://docs.openclaw.ai/tools/clawhub)
