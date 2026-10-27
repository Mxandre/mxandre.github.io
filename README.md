# 技术调研笔记 · Tech Research Notes

网站：<https://mxandre.github.io> ｜ 交流：[GitHub Discussions](https://github.com/Mxandre/mxandre.github.io/discussions)

[中文](#中文) | [English](#english)

## 中文

这里记录我在学习和工作中遇到的、让我好奇的技术问题，以及围绕它们展开的调研过程。

每篇文章会尽量写清楚三件事：

- **起点**：我为什么会关心这个问题；
- **过程**：读了哪些论文，卡在了哪里，又是怎么想通的；
- **收获**：最后理解了什么，还有哪些没想明白。

我发现，把调研过程整理成文章，常常会逼着自己多想几个角度，收获比单纯读论文多得多。也希望这些笔记对你有用。

文中可能会有理解不到位或写错的地方，非常欢迎在文章底部的评论区或 [Discussions](https://github.com/Mxandre/mxandre.github.io/discussions) 里指出，或者聊聊你的想法。

### 文章

| 时间 | 文章 |
|---|---|
| 2026-10 | [让 Attention 更快（1）：Linear Attention 与 FlashAttention](https://mxandre.github.io/posts/attention-01/) |

## English

This site collects my notes on technical questions that caught my interest in study and work, and the research I did to answer them.

Each post tries to cover three things:

- **Why**: what made me curious about the question;
- **How**: the papers I read, where I got stuck, and how I worked through it;
- **What I learned**: what finally made sense, and what is still open.

I've found that writing up a research process makes me look at a problem from more angles than reading papers alone. I hope these notes are useful to you too.

Posts are mainly written in Chinese; some have English versions. If you spot a mistake or want to discuss anything, you're very welcome to leave a comment under a post or start a thread in [Discussions](https://github.com/Mxandre/mxandre.github.io/discussions).

### Posts

| Date | Post |
|---|---|
| 2026-10 | [Making Attention Faster (1): Linear Attention and FlashAttention](https://mxandre.github.io/posts/attention-01/en.html) |

<details>
<summary>写作说明（写给自己）</summary>

用 [Quarto](https://quarto.org/) 搭建，发布到 GitHub Pages。本文件不会出现在网站上（Quarto 自动忽略 README）。

### 本地预览

在项目目录打开终端（PowerShell）：

```powershell
.\quarto.cmd preview --profile dev
```

浏览器会打开预览页，保存文件后页面自动刷新。`--profile dev` 让草稿在本地可见。

**为什么用 `quarto.cmd` 而不是直接用 `quarto`：** 这台电脑的 `AppData\Local` 文件夹带有 Windows 的"加密"属性，Quarto 默认把缓存放在那里，在 Windows 家庭版上会报错 `无法加密指定的文件 (os error 6000)`。`quarto.cmd` 会把缓存改放到 `%USERPROFILE%\.quarto-appdata`。

### 目录结构

```
_quarto.yml          全站配置（标题、导航、主题、公式渲染）
_quarto-dev.yml      本地预览配置（显示草稿）
index.qmd            首页（自动列出 posts/ 下的文章）
about.qmd            "关于"页
styles.css           自定义样式（中文字体、行距）
posts/
  _metadata.yml      所有文章共用的设置（作者、日期格式、giscus 评论区）
  <文章名>/
    index.qmd        正文
    en.qmd           英文版（可选；首页只列出 index.qmd）
    references.bib   这篇文章的参考文献
    _fig-*.qmd       这篇文章的图（内嵌 SVG，跟随亮暗主题）
    *.png            这篇文章的图片
```

文件或文件夹名以 `_` 开头的不会被发布，适合放笔记和草稿材料。

### 新建一篇文章

1. 在 `posts/` 下新建一个文件夹，文件夹名就是网址，比如 `posts/mamba-ssm/` → `https://mxandre.github.io/posts/mamba-ssm/`。
2. 在文件夹里新建 `index.qmd`，开头写：

   ```yaml
   ---
   title: "标题"
   subtitle: "副标题（可选）"
   date: "2026-10-23"
   categories: [linear-attention, 序列建模]
   bibliography: references.bib
   draft: true
   ---
   ```

3. 写完以后删掉 `draft: true`，文章才会出现在正式网站上。

`posts/linear-attention-history/` 是一篇示例草稿，演示了下面这些写法，可以直接在里面改写。

### 常用写法

| 想要 | 写法 |
|---|---|
| 行内公式 | `$O(T^2)$` |
| 独立公式 | `$$ S_t = S_{t-1} + v_t k_t^\top $$` |
| 带编号的公式 | `$$ ... $$ {#eq-update}`，正文中引用：`@eq-update` |
| 引用文献 | `[@katharopoulos2020transformers]`，对应 `references.bib` 里的 key |
| 带编号的图 | `![图注](fig.png){#fig-timeline}`，正文中引用：`@fig-timeline` |
| 页边注 | `^[这段文字会显示在页面右侧边栏]` |
| 提示框 | `::: {.callout-note}` …… `:::`（还有 `callout-tip`、`callout-warning`） |
| 可折叠的推导 | `::: {.callout-note collapse="true"}` 加上 `## 推导` 小标题 |
| 代码块 | 用三个反引号加语言名，例如 ` ```python ` |

BibTeX 条目可以从 Google Scholar（点"引用"→ BibTeX）或 arXiv 页面（"Export BibTeX Citation"）复制。参考文献列表会自动生成在 `::: {#refs}` 所在位置。

### 评论区

每篇文章底部的评论区由 [giscus](https://giscus.app) 提供，评论存放在本仓库 Discussions 的 Comment 分类里（Announcement 格式：只有仓库管理员和 giscus 能开新帖，读者只能回复），配置在 `posts/_metadata.yml`。

### 发布

推送到 `main` 分支后，GitHub Actions（`.github/workflows/publish.yml`）会自动构建网站并发布到 GitHub Pages，一两分钟后生效。进度可以在仓库的 [Actions](https://github.com/Mxandre/mxandre.github.io/actions) 页面查看。

本地参考资料（比如论文 PDF）放在 `linear attention/` 里，已经在 `.gitignore` 中排除，不会上传。

</details>
