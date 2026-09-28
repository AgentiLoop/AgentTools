# AgentTools

A Swift package that provides shared system prompts, tool definitions, and API provider management for macOS AI agents. Single source of truth for tool schemas across 10 LLM providers.

## Requirements

- macOS 14+
- Swift 6.4+
- No external dependencies (Foundation only)

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/AgentiLoop/AgentTools.git", from: "2.53.19")
]
```

## Usage

```swift
import AgentTools

// Get system prompt for an agent session
let prompt = AgentTools.systemPrompt(
    userName: "you",
    userHome: "/Users/you",
    projectFolder: "/Users/you/MyProject"
)

// Get tool definitions for a specific provider
let tools = AgentTools.tools(for: .claude)

// Generate Ollama/OpenAI-format tool schemas
let ollamaTools = AgentTools.ollamaTools(
    isEnabled: { _ in true },
    mcpTools: [],
    compact: false
)

// Check provider info
let name = APIProvider.claude.displayName  // "Claude"
```

## Supported Providers

| Provider | Enum Case |
|---|---|
| Claude (Anthropic) | `.claude` |
| OpenAI | `.openAI` |
| DeepSeek | `.deepSeek` |
| Z.ai | `.zAI` |
| Hugging Face | `.huggingFace` |
| Ollama Cloud | `.ollama` |
| Local Ollama | `.localOllama` |
| vLLM | `.vLLM` |
| LM Studio | `.lmStudio` |
| Apple Intelligence | `.foundationModel` |

## Tool Categories

The package defines 86+ tools across these categories:

| Category | Tools | Examples |
|---|---|---|
| File Operations | `file_manager` | read, write, edit, list, search, diff, undo |
| Version Control | `git` | status, diff, log, commit, branch |
| Xcode | `xcode` | build, run, analyze, snippet, add/remove files |
| Scripting | `agent`, `applescript_tool`, `javascript_tool` | create, run, list, delete scripts |
| Shell | `execute_agent_command`, `execute_daemon_command` | user and root command execution |
| Accessibility | `accessibility` | list_windows, click, type_text, find_element, screenshot |
| Web | `safari`, `web_search`, `selenium` | open, click, type, read_content, google_search |
| Conversation | `conversation`, `plan_mode`, `memory` | text generation, planning, persistent memory |

## Public API

### APIProvider

```swift
public enum APIProvider: String, CaseIterable, Codable, Sendable
```

- `displayName` -- Human-readable provider name
- `selectableProviders` -- Providers available in the settings UI

### AgentTools

| Method | Description |
|---|---|
| `systemPrompt(userName:userHome:projectFolder:)` | Full system prompt for desktop agents |
| `compactSystemPrompt(userName:userHome:projectFolder:)` | Compact version for small context windows |
| `codingModePrompt(projectFolder:)` | Minimal prompt for coding iterations |
| `tools(for:)` | Tool definitions for a given provider |
| `ollamaTools(isEnabled:mcpTools:compact:)` | Ollama/OpenAI-format tool schemas |
| `claudeTool(name:description:properties:required:)` | Anthropic-format tool schema |
| `commonTools` | All standard tool definitions |
| `toolNames` | All tool name strings |
| `textFormat` | Plain-text tool reference for text-based models |

### ToolDef

```swift
public struct ToolDef
```

Generic tool definition with name, description, properties dictionary, and required parameter list.

## Part of AgentiLoop Agent!

AgentTools is one of the open-source building blocks of **[AgentiLoop Agent!](https://github.com/AgentiLoop/Agent)**, the native AI agent for macOS 14.6+ on Apple Silicon and Intel. Agent! codes in Xcode, drives any Mac app, runs shell as you or as root, and works with 23 LLM providers plus on-device Apple Intelligence.

🌐 [agentiloop.ai](https://agentiloop.ai/) · ⬇️ [Download Agent!](https://github.com/AgentiLoop/Agent/releases/latest) · 🍺 `brew install --cask agentiloop-agent` · 💻 CLIs: [Rust](https://github.com/AgentiLoop/AgentiLoopCLI) / [Go](https://github.com/AgentiLoop/AgentiLoopGo)

**More Agent! packages:** [AgentAccess](https://github.com/AgentiLoop/AgentAccess) · [AgentAudit](https://github.com/AgentiLoop/AgentAudit) · [AgentColorSyntax](https://github.com/AgentiLoop/AgentColorSyntax) · [AgentD1F](https://github.com/AgentiLoop/AgentD1F) · [AgentEventBridges](https://github.com/AgentiLoop/AgentEventBridges) · [AgentLLM](https://github.com/AgentiLoop/AgentLLM) · [AgentMCP](https://github.com/AgentiLoop/AgentMCP) · [AgentSwift](https://github.com/AgentiLoop/AgentSwift) · [AgentTerminalNeo](https://github.com/AgentiLoop/AgentTerminalNeo) · [AgentScripts](https://github.com/AgentiLoop/AgentScripts)

## License

MIT
