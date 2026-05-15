# AI Helper Resources 🤖

A modular collection of skills and resources for [Gemini CLI](https://github.com/google/gemini-cli) and [Claude Code](https://claude.com/claude-code).

## 🛠 Available Skills

| Skill | Description |
| :--- | :--- |
| **Flink OSS Setup** | Local Flink setup via K8s Operator. |
| **Flink PR Reviewer** | In-depth PR analysis for Flink. |

The `SKILL.md` files use the same `name`/`description` frontmatter for both CLIs, so each skill works in either environment without modification.

## 🚀 Quick Start

### Gemini CLI

Install per-skill, then reload:

| Skill | Installation Command |
| :--- | :--- |
| Flink OSS Setup | `gemini skills install https://github.com/spuru9/ai-helper.git --path skills/flink-oss-setup` |
| Flink PR Reviewer | `gemini skills install https://github.com/spuru9/ai-helper.git --path skills/flink-pr-reviewer` |

1. **Install**: copy the command from the table above.
2. **Reload**: run `/skills reload` in your Gemini CLI session.
3. **Verify**: run `/skills list`.

### Claude Code

Install the whole bundle as one plugin — both skills are auto-discovered from `skills/`:

```
/plugin marketplace add spuru9/ai-helper
/plugin install ai-helper@ai-helper
```

1. **Install**: run the two commands above inside a Claude Code session.
2. **Verify**: run `/plugin` to confirm `ai-helper` is installed and enabled.
3. **Use**: Claude auto-invokes skills based on the `description` frontmatter (e.g., asking to review a Flink PR triggers `flink-pr-reviewer`). Skills are namespaced as `ai-helper:flink-oss-setup` and `ai-helper:flink-pr-reviewer`.

> The plugin manifests live under [`.claude-plugin/`](.claude-plugin/) — `plugin.json` declares the plugin and `marketplace.json` makes this repo installable as a one-plugin marketplace.

---

## 📂 Structure
- `skills/`: Specialized agentic workflows (compatible with both Gemini CLI and Claude Code).
- `.claude-plugin/`: Claude Code plugin and marketplace manifests.
- `commands/`: (Planned) Custom shell scripts.
- `prompts/`: (Planned) Reusable system prompts.

## 🤝 Contributing
Submit a PR to add new skills to the `skills/` directory. Each skill is a directory with a `SKILL.md` (frontmatter `name` + `description`, body describing the workflow). Reference files and scripts can be placed in subdirectories (`references/`, `scripts/`) and read on demand.
