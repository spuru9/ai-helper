# AI Helper Resources 🤖

A modular collection of skills and resources for [Gemini CLI](https://github.com/google/gemini-cli).

## 🛠 Available Skills

| Skill | Description | Installation Command |
| :--- | :--- | :--- |
| **Flink OSS Setup** | Local Flink setup via K8s Operator. | `gemini skills install https://github.com/spuru9/ai-helper.git --path skills/flink-oss-setup` |
| **Flink PR Reviewer**| In-depth PR analysis for Flink. | `gemini skills install https://github.com/spuru9/ai-helper.git --path skills/flink-pr-reviewer` |

## 🚀 Quick Start

1. **Install**: Copy the command from the table above.
2. **Reload**: Run `/skills reload` in your Gemini CLI session.
3. **Verify**: Use `/skills list` to confirm.

---

## 📂 Structure
- `skills/`: Specialized agentic workflows.
- `commands/`: (Planned) Custom shell scripts.
- `prompts/`: (Planned) Reusable system prompts.

## 🤝 Contributing
Submit a PR to add new skills to the `skills/` directory.
