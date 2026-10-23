# 技术调研笔记

用 [Quarto](https://quarto.org/) 搭建的个人技术博客，计划发布到 GitHub Pages：<https://mxandre.github.io>。

> 本文件不会出现在网站上（Quarto 自动忽略 README）。

## 本地预览

在项目目录打开终端（PowerShell）：

```powershell
.\quarto.cmd preview --profile dev
```

浏览器会打开预览页，保存文件后页面自动刷新。`--profile dev` 让草稿在本地可见。

**为什么用 `quarto.cmd` 而不是直接用 `quarto`：** 这台电脑的 `AppData\Local` 文件夹带有 Windows 的"加密"属性，Quarto 默认把缓存放在那里，在 Windows 家庭版上会报错 `无法加密指定的文件 (os error 6000)`。`quarto.cmd` 会把缓存改放到 `%USERPROFILE%\.quarto-appdata`。

## 目录结构

```
_quarto.yml          全站配置（标题、导航、主题、公式渲染）
_quarto-dev.yml      本地预览配置（显示草稿）
index.qmd            首页（自动列出 posts/ 下的文章）
about.qmd            "关于"页
styles.css           自定义样式（中文字体、行距）
posts/
  _metadata.yml      所有文章共用的设置（作者、日期格式）
  <文章名>/
    index.qmd        正文
    references.bib   这篇文章的参考文献
    *.png            这篇文章的图片
```

文件或文件夹名以 `_` 开头的不会被发布，适合放笔记和草稿材料。

## 新建一篇文章

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

## 常用写法

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

## 发布

还没配置。
