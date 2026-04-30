# AI Helper Resources 🤖

A collection of AI-powered skills, commands, and resources designed to streamline development workflows using Gemini CLI.

## 🛠 Skills

Skills are modular packages that extend Gemini CLI's capabilities with specialized domain knowledge and workflows.

### [Flink OSS Setup](./skills/flink-oss-setup)
Guided setup for Apache Flink OSS locally using Kubernetes Operator. It dynamically fetches version-specific assets from the official Flink Docker repository.

**Installation:**
```bash
gemini skills install https://github.com/spuru9/ai-helper.git --path skills/flink-oss-setup --scope user
```

**Usage:**
After installation, reload your skills:
```bash
/skills reload
```
Then simply ask Gemini: *"Help me setup Flink OSS locally"*

---

## 🚀 Installation & Setup

1. **Prerequisites**: Ensure you have [Gemini CLI](https://github.com/google/gemini-cli) installed.
2. **Install a Skill**: Use the `gemini skills install` command with the `--path` flag pointing to the specific skill directory.
3. **Reload**: Run `/skills reload` in your active Gemini session to enable new skills.

## 📂 Repository Structure

- `skills/`: Specialized agentic workflows and procedural knowledge.
- `commands/`: (Planned) Custom shell scripts and aliases.
- `prompts/`: (Planned) Reusable system and task-specific prompts.

## 🤝 Contributing

Feel free to open issues or submit pull requests to add new skills or improve existing ones.
