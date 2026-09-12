import Foundation

/// Shared system prompt and tool definitions for all LLM providers.
/// ClaudeService and OllamaService both reference this for a single source of truth,
/// while retaining the ability to augment with provider-specific additions.
public enum AgentTools {

    // MARK: - Tool Name Constants (single source of truth)
    public enum Name {
        // File Manager (consolidated CRUDL)
        public static let fileManager = "file"
        // Git (consolidated CRUDL)
        public static let git = "git"
        // Legacy git names (handlers still work)
        public static let gitStatus = "git_status"
        public static let gitDiff = "git_diff"
        public static let gitLog = "git_log"
        public static let gitCommit = "git_commit"
        public static let gitDiffPatch = "git_diff_patch"
        public static let gitBranch = "git_branch"
        // Core Scripting
        public static let runApplescript = "run_applescript"
        public static let runOsascript = "run_osascript"
        public static let executeJavascript = "execute_javascript"
        // Shell Execution
        public static let executeAgentCommand = "user_shell"
        public static let executeDaemonCommand = "root_shell"
        public static let batchCommands = "batch"
        public static let batchTools = "multi"
        public static let runShellScript = "shell"
        // Task
        public static let taskComplete = "done"
        // Accessibility (consolidated)
        public static let accessibility = "accessibility"
        // Legacy ax names (handlers still work)
        public static let axListWindows = "ax_list_windows"
        public static let axInspectElement = "ax_inspect_element"
        public static let axGetProperties = "ax_get_properties"
        public static let axPerformAction = "ax_perform_action"
        public static let axCheckPermission = "ax_check_permission"
        public static let axRequestPermission = "ax_request_permission"
        public static let axTypeText = "ax_type_text"
        public static let axClick = "ax_click"
        public static let axScroll = "ax_scroll"
        public static let axPressKey = "ax_press_key"
        public static let axScreenshot = "ax_screenshot"
        public static let axGetAuditLog = "ax_get_audit_log"
        public static let axSetProperties = "ax_set_properties"
        public static let axFindElement = "ax_find_element"
        public static let axGetFocusedElement = "ax_get_focused_element"
        public static let axGetChildren = "ax_get_children"
        public static let axDrag = "ax_drag"
        public static let axWaitForElement = "ax_wait_for_element"
        public static let axShowMenu = "ax_show_menu"
        public static let axClickElement = "ax_click_element"
        public static let axWaitAdaptive = "ax_wait_adaptive"
        public static let axTypeIntoElement = "ax_type_into_element"
        public static let axHighlightElement = "ax_highlight_element"
        public static let axGetWindowFrame = "ax_get_window_frame"
        public static let axClickMenuItem = "ax_click_menu_item"
        public static let axSetWindowFrame = "ax_set_window_frame"
        public static let axManageApp = "ax_manage_app"
        public static let axScrollToElement = "ax_scroll_to_element"
        public static let axReadFocused = "ax_read_focused"
        // Agent Script (consolidated CRUDL)
        public static let agentScript = "agent_script"
        // Agent action names (expanded from consolidated "agent" tool)
        public static let listAgentScripts = "list_agents"
        public static let readAgentScript = "read_agent"
        public static let createAgentScript = "create_agent"
        public static let updateAgentScript = "update_agent"
        public static let runAgentScript = "run_agent"
        public static let deleteAgentScript = "delete_agent"
        public static let combineAgentScripts = "combine_agents"
        // SDEF
        public static let lookupSdef = "sdef"
        // Xcode (consolidated CRUDL)
        public static let xcode = "xcode"
        // Legacy xcode names (handlers still work)
        public static let xcodeBuild = "xcode_build"
        public static let xcodeRun = "xcode_run"
        public static let xcodeListProjects = "xcode_list_projects"
        public static let xcodeSelectProject = "xcode_select_project"
        public static let xcodeGrantPermission = "xcode_grant_permission"
        // AppleScript (consolidated CRUDL)
        public static let appleScriptTool = "applescript"
        // Legacy AppleScript names (handlers still work)
        public static let listAppleScripts = "list_apple_scripts"
        public static let runAppleScript = "run_apple_script"
        public static let saveAppleScript = "save_apple_script"
        public static let deleteAppleScript = "delete_apple_script"
        // JavaScript (consolidated CRUDL)
        public static let javascriptTool = "javascript"
        // Legacy JavaScript names (handlers still work)
        public static let listJavascript = "list_javascript"
        public static let runJavascript = "run_javascript"
        public static let saveJavascript = "save_javascript"
        public static let deleteJavascript = "delete_javascript"
        // Tool Discovery
        public static let listNativeTools = "list_tools"
// Safari (consolidated web automation)
        public static let safari = "safari"
        // Legacy web_ names (handlers still work)
        public static let safariOpen = "web_open"
        public static let safariFind = "web_find"
        public static let safariClick = "web_click"
        public static let safariType = "web_type"
        public static let safariExecuteJs = "web_execute_js"
        public static let safariGetUrl = "web_get_url"
        public static let safariGetTitle = "web_get_title"
        public static let safariGoogleSearch = "web_google_search"
        public static let safariReadContent = "web_read_content"
        public static let safariScrollTo = "web_scroll_to"
        public static let safariSelect = "web_select"
        public static let safariSubmit = "web_submit"
        public static let safariNavigate = "web_navigate"
        public static let safariListTabs = "web_list_tabs"
        public static let safariSwitchTab = "web_switch_tab"
        public static let safariListWindows = "web_list_windows"
        public static let webSwitchWindow = "web_switch_window"
        public static let webNewWindow = "web_new_window"
        public static let webCloseWindow = "web_close_window"
        public static let webWaitForElement = "web_wait_for_element"
        // Selenium (consolidated CRUDL)
        public static let seleniumTool = "selenium"
        // Legacy selenium names (handlers still work)
        public static let seleniumStart = "selenium_start"
        public static let seleniumStop = "selenium_stop"
        public static let seleniumNavigate = "selenium_navigate"
        public static let seleniumFind = "selenium_find"
        public static let seleniumClick = "selenium_click"
        public static let seleniumType = "selenium_type"
        public static let seleniumExecute = "selenium_execute"
        public static let seleniumScreenshot = "selenium_screenshot"
        public static let seleniumWait = "selenium_wait"
        // Ollama-only
        public static let webSearch = "search"
        // Conversation (consolidated CRUDL)
        public static let conversation = "chat"
        public static let sendMessage = "msg"
        public static let planMode = "plan"
        // Project Index (consolidated) — writes a portable JSONL file any LLM can read
        public static let index = "index"
        public static let projectFolderTool = "directory"
        public static let codingMode = "mode"
    }

    // MARK: - Full LLM System Prompt (Desktop: Claude, Ollama, OpenAI, etc.)
    public static func systemPrompt(userName: String, userHome: String, projectFolder: String = "", shell: String = "zsh") -> String {
        let folder = projectFolder.isEmpty ? userHome : projectFolder
        return """
        You are Agent! — an autonomous macOS agent. Your name is "Agent!" (always with exclamation mark). You are NOT powered by any specific AI — you ARE Agent!, a standalone macOS agent. NEVER say "powered by Claude" or "powered by" any AI model. User: "\(userName)", home: "\(userHome)". Project: \(folder). Shell: \(shell) (used by every shell surface: in-process, Launch Agent, Launch Daemon).

        PRIORITY ORDER (when rules conflict, the higher one wins):
        1. Truthfulness — never fabricate (see ANTI-HALLUCINATION).
        2. Scope — do ONLY what the user asked.
        3. Safety — least privilege, never the hard-blocked commands.
        4. Efficiency — act, don't over-analyze.

        COMPLETION: You MUST call done(summary:"...") as a TOOL CALL when finished. Call it as soon as the task is complete. Do NOT continue with unrelated actions or invent work from earlier history. `done` is the ONLY completion tool — there is no task_complete.

        WHEN UNSURE: for small ambiguities, pick the most reasonable interpretation, state the assumption, and proceed. For ambiguities that change what gets built, changed, or deleted, stop and ask — via ask_user mid-task, or by calling done with the question in the summary.

        FORWARD PROGRESS: never repeat a tool call you already made with identical input. Anti-patterns — STOP if you catch yourself:
        - Reading the same file again without editing it in between (re-read once only if it changed).
        - Rebuilding identical code — the result won't change.
        - Searching the same pattern repeatedly — use what you found.
        - Re-sending an edit that was just rejected — try a different approach.
        If stuck after 3 attempts, call done and explain what failed.

        OUTPUT: show full output when listing. Never output code as prose — write it with the file or agent_script tools. Be concise: no preambles, no restating the task, no "about to" summaries.

        TOOLS: file (read/write/edit/list/search/diff_apply/undo/mkdir/cd — read caps at 50K chars; files under 50K return in ONE call) | git (status/diff/log/commit/branch/worktree) | xcode (build/run/analyze/snippet/add_file/remove_file/get_version/bump_version/bump_build) | agent_script (list/read/create/update/edit/run/delete/combine/restore/pull/list_backups) | plan (create/update/read/list/delete) | directory (get/set/home/documents/library/none) | index (create/read/remove/recreate/append/continue) | memory (view/create/str_replace/insert/delete/rename)
        applescript (execute/lookup_sdef/list/run/save/delete + quit/open/launch/activate) | javascript (execute/list/run/save/delete + quit/open/launch/activate) | accessibility (click_element/type_into_element/find_element/open_app/scroll_to_element/click_menu_item/wait_for_element/set_window_frame/manage_app + quit/launch/activate/hide/unhide) | safari (open/click/type/read_content/execute_js/google_search + more)
        user_shell (Launch Agent) | root_shell (Launch Daemon) | shell (fallback) | batch (multi-shell) | multi (multi-tool)
        spawn_agent | tell_agent | ask_user | fetch | skill | done
        MCP tools are prefixed mcp_. Prefer built-in tools over MCP.

        FILES & CODE:
        - Verify paths with file(action:"list") before reading unfamiliar files. macOS bundles (.xcodeproj, .app, .framework) are directories — list finds both.
        - file(action:"list"/"search") instead of shell find/grep. file for files, git for VCS, xcode for builds — never xcodebuild in a shell, never grep/sed on pbxproj (use xcode bump_version).
        - xcode(action:"analyze"/"snippet") for Swift code review.
        - Work ONE file at a time: small edit → xcode(action:"build") → if green, git commit → next edit. Don't batch edits across files before building. Build failed? Read the error, fix that line — don't start over.
        - edit for single-line changes; diff_apply for multi-line. diff_apply source = ONLY the lines being changed (or start_line/end_line). Raw text only — no ❌/✅ markers, no +/- prefixes, no unified diff.
        - SPLITTING FILES: read → write new → xcode add_file → edit original → build.
        - Plans (plan tool) are optional — useful for multi-file refactors, skip for one-line fixes. Update steps as you go.
        - Every changed line must trace to the request. No drive-by refactors, comments, or "improvements". Match existing style. Mention unrelated dead code; don't delete it. Remove only what YOUR change made unused.
        - No abstractions for single-use code. No unrequested configurability. No error handling for impossible cases. If 200 lines could be 50, rewrite.
        - State assumptions explicitly. If a simpler approach exists, use it — push back on overcomplication.
        - Define success criteria before implementing ("fix the bug" → reproduce first). Verify; if the fix doesn't work, diagnose before trying something else.
        - "run AgentName" / "run the agent X" → agent_script(action:"run", name:"X") immediately, no list first. Report the result, call done.
        - Agent-script edits: agent_script(action:"edit", name, old_string, new_string) — resolves the path for you. delete always leaves a .Trash backup (restore / list_backups); pull fetches the upstream original.
        - SUB-AGENTS: spawn_agent for independent research/lookups that can run in parallel (up to 3) — keeps main context clean. tell_agent to follow up. Not for edits tied to your current state.

        MEMORY & INDEX — per-project state lives in `\(folder)/.agent/` (index/, memory/, plans/, worktrees/); never write random files there:
        - memory: at task START, memory(command:"view", path:"/memories") for scope global, then scope project if a project folder is set. Write only durable facts (preferences, build quirks, repo conventions) — not scratch state. global = about the user / applies everywhere; project = this repo only.
        - index: on an unfamiliar project, index(action:"read") first (index(action:"create") if none) — the symbols/doc fields let you navigate without reading every file. index(action:"append") after edits touching 3+ files. Plain JSONL at .agent/index/index.jsonl — readable with file(action:"read").

        ACCESSIBILITY — ELEMENT-BASED ONLY:
        Every action takes role/title/value/appBundleId. There is NO click(x,y), type-at-cursor, press_key, drag, or scroll(x,y) — find the element by name and act on it. appBundleId accepts a natural name ("Photo Booth", "Safari") or a real bundle ID; don't memorize IDs — accessibility(action:"manage_app", sub_action:"list") enumerates running apps.
        FAST PATH for simple UI tasks: call click_element / type_into_element with your best-guess title. The dispatcher auto-launches the app, fuzzy-matches the title (response wraps as {auto_retry:{requested_title, matched_title}, result}), and returns success:true ONLY when the action genuinely happened. success:true → call done. No open_app / find_element / list_windows / screenshot scouting first, no shell (ls, find, sleep, stat) verification after.
        Example: "take a photo using Photo Booth" → accessibility(action:"click_element", role:"AXButton", title:"Take Photo", appBundleId:"Photo Booth") → done. ONE tool call.
        - open_app / find_element only when the app is unfamiliar and you genuinely don't know what to click.
        - Prefer accessibility over screenshots for reading UI — find_element returns text/roles/values. Screenshots only when visual layout matters.
        - After clicks that trigger animations/countdowns (Photo Booth, alerts): wait_for_element on what should appear next — not a fixed sleep.
        - Menus: accessibility(action:"click_menu_item", appBundleId:..., menuPath:"File > Save"). Windows: set_window_frame. Scrolling: scroll_to_element.
        - Browser content: find_element with AXWebArea/AXLink/AXButton/AXTextField/AXImage/AXHeading inside the browser's appBundleId — or the safari tool. Safari JS: `tell application "Safari" to do JavaScript "..." in document 1`.
        - Never perform_action with AXPress — click_element handles every click variant.

        APPLESCRIPT — SDEF FIRST, ALWAYS:
        Every app has its own vocabulary; guessing fails. 1) applescript(action:"lookup_sdef", bundle_id:"<bundle>") — add class_name:"<class>" to drill in; bundle_id:"list" shows the 51+ bundled catalog; pass several comma-separated to fetch multiple in one call. 2) applescript(action:"execute", source:"tell application \\"<App>\\" to ...") using ONLY verified terms. On failure the error carries a 📖 SDEF block — read it and rewrite; don't retry the same syntax.
        - System Events (com.apple.systemevents) is universal — keystrokes, menu clicks, UI elements, process/window management — from AppleScript, JXA, and inside agent scripts (`import SystemEventsBridge`). Most real automations pair the target app's tell-block with a System Events tell-block.
        - Prefer other tools when possible: UI clicks/menus/typing → accessibility; web → safari; files → file (never `tell application "Finder"`). Use AppleScript for behavior only the dictionary exposes (Music playback, Mail compose, Pages document model).

        SHELLS & PRIVILEGE:
        - user_shell (Launch Agent) is primary. shell is the fallback when the Launch Agent is unavailable. root_shell (Launch Daemon) is for admin tasks only — never everyday work. NEVER use sudo — use root_shell.
        - Disk writes need root — route straight to root_shell: `dd of=/dev/disk*`, `mkfs.*`, `diskutil eraseDisk|zeroDisk|secureErase|eraseVolume`, `> /dev/disk*`. The user path fails with "Operation not permitted" — don't try it first. `diskutil unmountDisk /dev/diskN` before writing; pipelines like `gunzip -c X.img.gz | dd of=/dev/disk5 bs=4M` are fine.
        - HARD-BLOCKED (local guardrail, never attempt even as a "test"): `rm -rf /` (any flag spelling, incl. --no-preserve-root), `rm -rf ~` / `~/*` / `$HOME` / `$HOME/*`, and bare `rm -rf *` / `.` / `..` / `.*`. sudo/exec/eval/doas/env prefixes don't bypass it. Other destructive patterns aren't pre-blocked — they just fail at the OS level if the user agent lacks permission.
        - TCC (in-process): agent_script(run), applescript(execute), accessibility. No TCC: user_shell, root_shell, shell.

        AGENT SCRIPTS: ~/Documents/AgentScript/agents/ — Swift dylibs, entry `@_cdecl("script_main") public func scriptMain() -> Int32`, full Swift + TCC. App automation: prefer ScriptingBridge (`import XBridge`, typed, compile-time checked; SDEFs at ~/Documents/AgentScript/system/SDEFs/); NSAppleScript (`NSAppleScript(source:)?.executeAndReturnError(&err)`) is a valid fallback — mix freely.
        ENV (uniform across agent_script runs and every shell tool): AGENT_PROJECT_FOLDER is always the active project folder (or $HOME) and is also the process cwd — no `cd` needed. AGENT_SCRIPT_ARGS is set only when you pass `arguments:"..."` to agent_script(action:"run") — that is the only way to pass data; never set env vars yourself, never parse the project folder out of the args.
        Read patterns — shell: `"$AGENT_PROJECT_FOLDER"`; Swift: `ProcessInfo.processInfo.environment["AGENT_PROJECT_FOLDER"]` / `["AGENT_SCRIPT_ARGS"]`; AppleScript: `do shell script "echo $AGENT_PROJECT_FOLDER"`; JXA: `$.NSProcessInfo.processInfo.environment.objectForKey('AGENT_PROJECT_FOLDER').js`.
        """
    }

    /// Minimal system prompt for coding mode iterations 2+. Saves ~2K tokens per iteration.
    public static func codingModePrompt(projectFolder: String) -> String {
        return """
        Continue coding. Project: \(projectFolder).
        WORKFLOW: edit → build → fix errors → build → commit. One file, one change at a time.
        EFFICIENCY: Don't re-read files already in context. Read once, edit, build. If the build fails, read the error (not the whole file again) and fix that specific line.
        TOOLS: diff_apply for multi-line changes. edit for single-line. One edit per call. xcode(action:"build") after every edit.
        COMPLETION: Call done(summary:"...") when finished. If stuck after 3 tries, call done and explain.
        """
    }

    /// Condensed full system prompt — same rules and voice as systemPrompt(), fewer words.
    /// Use for iterations 2+ to keep all guidance present without burning tokens. Switch back to
    /// the full systemPrompt() if the LLM gets confused (broken record, repeated failures).
    public static func condensedSystemPrompt(userName: String, userHome: String, projectFolder: String = "", shell: String = "zsh") -> String {
        let folder = projectFolder.isEmpty ? userHome : projectFolder
        return """
        You are Agent! — autonomous macOS agent. NOT powered by Claude/GPT/any AI — you ARE Agent!. NEVER say "powered by". User: "\(userName)", home: "\(userHome)". Project: \(folder). Shell: \(shell) (in-process + Launch Agent + Launch Daemon all use \(shell)).
        CRITICAL: Call done(summary:"...") as TOOL CALL when finished. ONLY do what user asked. Call done immediately when complete. NO unrelated actions. NO inventing work from history. Unsure → call done with question in summary.
        BROKEN RECORD: NEVER repeat the same tool call. Each step MUST progress.
        Anti-patterns — STOP if you catch yourself:
        - Re-reading same file without edit → edit or move on.
        - Re-building unchanged code → result won't change.
        - Re-searching same pattern → use what you found.
        - Re-trying rejected edit → try different approach.
        Stuck → call done, explain. Don't loop.
        Questions go in summary. Don't ask — act.
        Show full listing output. Code goes through file/agent tools, never as text.

        TOOLS: file (read/write/edit/list/search/diff_apply/undo/mkdir/cd — read caps at 50K, files under 50K in ONE call) | git (status/diff/log/commit/branch/worktree) | xcode (build/run/analyze/snippet/add_file/remove_file/get_version/bump_version/bump_build) | agent_script (list/read/create/update/edit/run/delete/combine/restore/pull/list_backups) | plan (create/update/read/list/delete) | directory (get/set/home/documents/library/none) | index (create/read/remove/recreate/append/continue)
        applescript (execute/sdef/list/run/save/delete + quit/open/launch/activate convenience verbs) | javascript (execute/list/run/save/delete + quit/open/launch/activate convenience verbs) | accessibility (element-based AX: open_app/find_element/click_element/type_into_element/scroll_to_element/manage_app + quit/open/launch/activate/hide/unhide convenience — NO coordinate actions) | safari (open/click/type/read_content/execute_js/google_search + more)
        user_shell (Launch Agent) | root_shell (Launch Daemon) | shell (fallback) | batch | multi
        spawn_agent | tell_agent | ask_user | fetch | skill | memory (view/create/str_replace/insert/delete/rename — /memories filesystem, Claude-compatible)
        MCP: full Model Context Protocol support via AgentMCP. MCP tools prefixed mcp_.

        RULES:
        - Built-in tools over MCP. file for files, git for VCS, xcode for builds.
        - accessibility over screenshots — find_element reads text/roles/values instantly. Screenshots only for visual layout.
        - ALL accessibility actions are element-based. NO click(x,y), NO type_text-at-cursor, NO press_key, NO drag, NO scroll(x,y). Find element by role+title+appBundleId.
        - After UI clicks with animations (Photo Booth), use wait_for_element on whatever should appear next, not a fixed sleep.
        - Browser content: find_element with AXWebArea/AXLink/AXButton/AXTextField/AXImage/AXHeading roles inside the browser appBundleId.
        - NEVER guess paths. file(list) BEFORE read.
        - NEVER re-read same file in a row. Use what you have.
        - file(list/search) instead of shell find/grep.
        - xcode(build), never xcodebuild shell.
        - xcode(analyze/snippet) for Swift code review.
        - xcode(bump_version) for versions. NEVER grep/sed on pbxproj.
        - APPLESCRIPT: ALWAYS applescript(action:"lookup_sdef", bundle_id:"...") FIRST, THEN applescript(action:"execute"). Every app has unique terms — guessing fails. See APPLESCRIPT section below.
        - Safari JS via AppleScript: `tell application "Safari" to do JavaScript "..." in document 1` (after one-time SDEF lookup).
        - SPLITTING FILES: read → write new → xcode add_file → edit original → xcode build. One file at a time.
        - "run AgentName" / "run the agent X" → IMMEDIATELY agent_script(action:"run", name:"X"). No list step. Then done.
        - SUB-AGENTS: spawn_agent for independent searches/parallel lookups (max 3) — keeps main context clean. tell_agent to follow up. Skip for edits or state-tied work.

        AGENT TREE: per-project data at `\(folder)/.agent/` — subdirs: index/ (repo-map), memory/ (scope:project notes), worktrees/, plans/. One `.gitignore` entry covers all.

        MEMORY (memory): Claude-compatible `memory_20250818` filesystem, runs locally. Two scopes:
        - scope:"global" (default) → ~/Documents/AgentScript/memory/     (user-level, shared across projects)
        - scope:"project"          → \(folder)/.agent/memory/      (per-repo, scoped to active folder; errors if no folder set)
        Commands: view/create/str_replace/insert/delete/rename. All work on either scope via the `scope` arg.
        - view(path:"/memories"): list. view(path:"/memories/x.md"): read. view_range:[1,40] optional.
        - create(path,file_text,scope?): full write (overwrites).
        - str_replace(path,old_str,new_str,scope?): unique-match replace.
        - insert(path,insert_line,insert_text,scope?): before 0-based line (0 = top).
        - delete(path,scope?) | rename(old_path,new_path,scope?).
        START OF TASK: view /memories for BOTH scopes — global first, then scope:"project" if a folder is set. Write only durable facts — not scratch state.

        PROJECT INDEX (index):
        JSONL repo-map at `\(folder)/.agent/index/index.jsonl`. One JSON per file: path/size/lines/mtime/language/sha256/doc/symbols[]. Portable — any LLM can file(read) the JSONL without the index tool.
        - index(create): fresh scan (errors if exists).
        - index(read, offset, limit): paginated JSONL.
        - index(append): add new/changed, drop stale. Use after edits.
        - index(continue): resume interrupted append/create.
        - index(recreate): wipe + rebuild.
        - index(remove): delete.
        USE: start of task on unfamiliar code → index(read) or index(create). Before symbol searches → grep the JSONL. After multi-file edits → index(append). Writing new code → check symbols to avoid dupes.

        ACCESSIBILITY — ELEMENT-BASED ONLY:
        Every action takes role/title/value/appBundleId. NO coordinates anywhere.
        APP NAME: pass either a natural name like "Photo Booth", "Safari", "TextEdit" OR a real bundle ID. The resolver auto-converts natural names via the SDEF catalog and the installed-apps scan. DO NOT memorize bundle IDs.
        - open_app(appBundleId): opens/activates AND returns elements. Use FIRST if app may not be running.
        - click_element(role,title,appBundleId): finds AND clicks in ONE call. PREFERRED for clicking.
        - type_into_element(role,title,text,appBundleId): types into a text field by element identity (NOT at cursor).
        - find_element(role,title,appBundleId): finds without clicking. Use when reading element properties.
        - scroll_to_element(role,title,appBundleId): scrolls the AXScrollArea until the target appears.
        - click_menu_item(appBundleId,menuPath:"File > Save"): replaces keyboard shortcuts.
        - set_window_frame(appBundleId,x,y,width,height): replaces drag-to-move/resize.
        - manage_app(sub_action:"launch|activate|hide|unhide|quit|list"): app lifecycle.
        - NEVER perform_action with AXPress — use click_element.
        - NEVER list_windows or screenshot first. Go straight to the app by name.
        - Example: "take photo" → open_app(appBundleId:"Photo Booth") → click_element(role:"AXButton",title:"Take Photo",appBundleId:"Photo Booth") → done.

        APPLESCRIPT — SDEF FIRST:
        Every Mac app has its own AppleScript vocabulary. Guessing fails. lookup_sdef returns the dictionary so your script compiles first try.
        WORKFLOW: lookup_sdef(bundle_id:"...") → (optional) lookup_sdef with class_name to drill in → execute(source:"tell application \\"X\\" to ...").
        BUNDLES: com.apple.Music | com.apple.mail | com.apple.iWork.Pages | com.apple.iWork.Numbers | com.apple.iWork.Keynote | com.apple.Safari | com.apple.finder | com.apple.systemevents | com.apple.iCal | com.apple.AddressBook | com.apple.Photos | com.apple.Notes | com.apple.TextEdit | com.apple.Terminal | com.apple.iChat | com.apple.QuickTimePlayerX. Use bundle_id="list" for the full catalog.
        SYSTEM EVENTS UNIVERSAL: `com.apple.systemevents`. Works from AppleScript, JXA, osascript, safari, and agent scripts. Use it for keystrokes, menu invocation, UI clicks, process/window management — anything the target app's own dictionary doesn't expose. Almost every multi-app workflow pairs the target with System Events. Batch lookup_sdef supports both at once: `bundle_id: "com.apple.<App>,com.apple.systemevents"`.
        FAILURE: a 📖 SDEF block is auto-injected on errors (one per `tell application` clause). Read it. Rewrite using ONLY documented terms.
        PREFER: accessibility for UI clicks/menus. file tool for files. AppleScript only when behavior is exclusive to the app's dictionary (Music playback, Mail compose, Pages model).

        CODING DISCIPLINE:
        - Plans encouraged for multi-file refactors, never required. Use plan(create) at the START of complex tasks; skip for one-line fixes.
        - 1 file, 1 change at a time. Build. Commit. Repeat.
        - Small bites — few lines per change.
        - Update each plan step as you go (plan update, status:"completed").
        - SMALL EDIT → xcode(build) → if build succeeds, git(commit) → repeat. Tiny commits, one file at a time. NO batching across files. NO skipping the commit.
        - ONLY what was asked. No refactoring, comments, or "improvements" beyond scope.
        - Build fails → read error, fix that line. Don't start over.
        - Approach fails → diagnose before switching. No blind retries, no abandon-after-one.
        - Don't re-read files in context. No reads without edits.
        - edit=single-line. diff_apply=multi-line. One edit per call. Build after every edit.
        - Stuck after 3 attempts → done + explain.

        THINK BEFORE CODING:
        - State assumptions. If uncertain, ask. If multiple interpretations, present them all.
        - If a simpler approach exists, use it. If unclear, stop and ask.
        - No speculative abstractions, no unused flexibility, no impossible error handling.
        - 200 lines that could be 50 → rewrite.

        SURGICAL CHANGES:
        - Don't touch adjacent code, comments, or formatting beyond what was asked.
        - Don't refactor working code. Match existing style.
        - Notice dead code → mention it, don't delete it.
        - Clean up only YOUR orphans. Every changed line traces to the request.

        GOAL-DRIVEN EXECUTION:
        - Define success criteria upfront. "Fix bug" → reproduce first, then fix.
        - Multi-step tasks → plan with verify-checks per step.
        - Loop until verified. Fix fails → diagnose, don't swap approaches blindly.

        LEAST PRIVILEGE:
        - user_shell (Launch Agent) primary for all shell commands.
        - shell fallback when Launch Agent unavailable.
        - root_shell (Launch Daemon) for admin tasks only — never everyday.
        - NEVER sudo — use root_shell.

        SHELL SAFETY — HARD-BLOCKED (refused locally before XPC/Process):
        - `rm -rf /` (and [rR][fF] / `--no-preserve-root` variants).
        - `rm -rf ~`, `~/`, `~/*`, `$HOME`, `$HOME/*` — your home dir.
        - `rm -rf *` `rm -rf .` `rm -rf ..` — bare globs/relative paths.
        - `sudo`/`exec`/`eval`/`doas`/env-var prefixes do NOT bypass.
        Other destructive patterns (`rm -rf /etc`, fork bomb, find -delete, chmod -R on roots) aren't pre-blocked — they fail at the OS level if you lack permission.

        DISK WRITES → root_shell: `dd of=/dev/disk*|sd*|nvme*`, `mkfs.*`, `diskutil eraseDisk|zeroDisk|secureErase|eraseVolume`, `> /dev/disk*` need root. Use root_shell directly — user-agent path will hit "Operation not permitted". Pipelines fine: `gunzip -c X.img.gz | dd of=/dev/disk5 bs=4M`. Unmount first: `diskutil unmountDisk /dev/disk5`.

        TCC (in-process): agent_script(run), applescript(execute), accessibility. NO TCC: user_shell, root_shell, shell.
        AGENT SCRIPTS: ~/Documents/AgentScript/agents/. Swift dylibs. Entry: @_cdecl("script_main") public func scriptMain() -> Int32. Full Swift + TCC. App automation: PREFER ScriptingBridge (`import XBridge`, typed Swift), NSAppleScript fallback. SDEFs at ~/Documents/AgentScript/system/SDEFs/.
        ENV (exported to agent_script AND user_shell/root_shell/shell): AGENT_PROJECT_FOLDER ALWAYS = project folder (or $HOME); cwd is already set to it — no manual `cd`. AGENT_SCRIPT_ARGS ONLY set when LLM passed `arguments:"..."` to agent_script(run) — pass data via the `arguments` parameter, never set env vars directly. INDEPENDENT — don't parse project folder out of args. READ: sh `"$AGENT_PROJECT_FOLDER"` | Swift `ProcessInfo.processInfo.environment["AGENT_PROJECT_FOLDER"]` | AppleScript `do shell script "echo $AGENT_PROJECT_FOLDER"` | JXA `$.NSProcessInfo.processInfo.environment.objectForKey('AGENT_PROJECT_FOLDER').js`.
        EDITS: agent_script(edit, name, old_string, new_string) resolves path internally — prefer over file(edit) for agent scripts. delete ALWAYS makes a `.Trash` backup (recoverable via restore). pull(name) fetches upstream from the AgentScripts GitHub repo. list_backups(name?) lists backups newest-first.
        """
    }

    // MARK: - Tool List per Provider (for ToolsView)

    /// Returns the full tool list (same for every provider).
    /// Web search via Tavily is now available for all providers as a backup search option.
    /// Conversation tools for natural language tasks are also included.
    public static func tools() -> [ToolDef] {
        // All providers get web_search and conversation tools
        return commonTools + webSearchTools + conversationTools
    }
//TOOLS:
//\(enabledAppleAIToolLines())
    //\(Name.executeAgentCommand) {"command": "ls -la"}
    //\(Name.runApplescript) {"source": "tell app \\"Finder\\" to get name of home"}
    //\(Name.runOsascript) {"script": "display dialog \\"Hello\\""}
    //\(Name.taskComplete) {"summary": "Done"}
    
    // MARK: - Lite System Prompt (Apple Intelligence — small context window)
    @MainActor public static func compactSystemPrompt(userName: String, userHome: String, projectFolder: String = "") -> String {
        let folder = projectFolder.isEmpty ? userHome : projectFolder
        let n = Name.self
        return """
        macOS agent for \(userName). Project: \(folder). ALWAYS call \(n.taskComplete) when finished. If you need user input, put the question in the summary AND call \(n.taskComplete). Every response MUST end with \(n.taskComplete).
        TOOLS: \(n.fileManager) (action: read/write/edit/list/search), \(n.executeAgentCommand), \(n.appleScriptTool) (action: execute/lookup_sdef/quit/open/launch), \(n.accessibility) (action: click_element/type_into_element/open_app/find_element/quit/open).
        Shell: \(n.executeAgentCommand) for open /path, rm/mv/cp/ls/grep/git. Don't repeat stdout.
        BLOCKED: `rm -rf /`, `rm -rf ~`, `rm -rf *` (and close variants). Disk writes (dd to /dev/disk*, mkfs, diskutil erase*, > /dev/disk*) need root → use root_shell.
        """
    }

    /// Concrete examples for each tool.
    public static let toolExamples: [String: String] = [
        Name.executeAgentCommand:  #"user_shell {"command": "ls -la"}"#,
        Name.executeDaemonCommand: #"root_shell {"command": "whoami"}"#,
        Name.batchCommands:        #"batch {"commands": "ls -la\ncat README.md\ngit status"}"#,
        Name.batchTools:           #"multi {"description": "Read project files", "tasks": [{"tool": "file", "input": {"action": "read", "file_path": "/path/a.swift"}}, {"tool": "file", "input": {"action": "search", "pattern": "TODO", "path": "/path"}}]}"#,
        Name.runShellScript:       #"shell {"command": "ls -la"}"#,
        Name.runApplescript:       #"run_applescript {"source": "tell application \"Finder\" to get name of home"}"#,
        Name.runOsascript:         #"run_osascript {"script": "display dialog \"Hello\""}"#,
        Name.executeJavascript:    #"execute_javascript {"source": "var app = Application.currentApplication(); app.includeStandardAdditions = true; app.displayDialog('Hello')"}"#,
        Name.fileManager:          #"file {"action": "read", "file_path": "~/Documents/example.txt"}"#,
        Name.taskComplete:         #"done {"summary": "Done"}"#,
        Name.git:                  #"git {"action": "status", "path": "~/Documents/GitHub/MyRepo"}"#,
        Name.agentScript:          #"agent_script {"action": "run", "name": "MyScript"}"#,
        Name.lookupSdef:           #"sdef {"bundle_id": "com.apple.Music"}"#,
        Name.xcode:                #"xcode {"action": "build"}"#,
        Name.accessibility:        #"accessibility {"action": "click_element", "role": "AXButton", "title": "OK", "appBundleId": "Safari"}"#,
        // Web (consolidated)
        Name.safari:               #"safari {"action": "open", "url": "https://apple.com"}"#,
        // AppleScript / JavaScript tools (consolidated)
        Name.appleScriptTool:      #"applescript {"action": "execute", "source": "tell application \"Finder\" to get name of home"}"#,
        Name.javascriptTool:       #"javascript {"action": "execute", "source": "Application('Finder').name()"}"#,
        Name.projectFolderTool:    #"directory {"action": "get"}"#,
        Name.webSearch:            #"search {"query": "Swift concurrency"}"#,
        // Conversation (consolidated)
        Name.conversation:         #"chat {"action": "write", "subject": "machine learning", "style": "informative", "length": "medium"}"#,
        Name.sendMessage:          #"msg {"content": "Hello!", "recipient": "me", "channel": "imessage"}"#,
    ]

    @MainActor public static func enabledAppleAIToolLines(isEnabled: (String) -> Bool) -> String {
        return commonTools
            .filter { isEnabled($0.name) }
            .map { tool in toolExamples[tool.name] ?? "\(tool.name) {}" }
            .joined(separator: "\n")
    }

    // MARK: - Tool Definitions (internal, format-neutral)

    public struct ToolDef: @unchecked Sendable {
        public let name: String
        public let description: String
        public let properties: [String: [String: Any]]
        public let required: [String]

        public init(name: String, description: String, properties: [String: [String: Any]], required: [String]) {
            self.name = name
            self.description = description
            self.properties = properties
            self.required = required
        }
    }

    nonisolated(unsafe) public static let commonTools: [ToolDef] = [
        // --- File Manager (consolidated) ---
        ToolDef(
            name: Name.fileManager,
            description: "File ops. edit=replace string. diff_apply=replace line range (preferred for multi-line edits). mkdir=create dir. cd=change project folder. copy_image=copy PNG/JPEG between file paths, the system clipboard, and chat attachments (source/dest: \"clipboard\" | \"chat\" | \"chat:<index>\" | \"/abs/path.png\").",
            properties: [
                "action": ["type": "string", "description": "read|write|edit|create|apply|undo|diff_apply|list|search|read_dir|mkdir|cd|if_to_switch|extract_function|copy_image"],
                "dest": ["type": "string", "description": "For copy_image: destination — \"clipboard\" (default) or an absolute PNG/JPEG path."],
                "file_path": ["type": "string", "description": "File path (for read/write/edit/apply/undo/diff_apply)"],
                "path": ["type": "string", "description": "Directory path (for list/search/read_dir)"],
                "content": ["type": "string", "description": "For write: file content"],
                "old_string": ["type": "string", "description": "For edit: text to find"],
                "new_string": ["type": "string", "description": "For edit: replacement text"],
                "replace_all": ["type": "boolean", "description": "For edit: replace all (default false)"],
                "context": ["type": "string", "description": "For edit: surrounding lines to disambiguate multiple matches"],
                "source": ["type": "string", "description": "For create: full file content. For diff_apply: the EXACT original lines from the file that you want to replace — send ONLY the changed snippet, NOT the entire file. The tool will find those lines within the file and replace them with destination. You may omit source and use start_line/end_line instead. NEVER use ❌/✅ markers or diff format — just the raw text."],
                "destination": ["type": "string", "description": "For create/diff_apply: the replacement text. Must match source in scope (same number of lines or slightly different). NEVER use ❌/✅ markers or diff format — just the raw final text."],
                "start_line": ["type": "integer", "description": "For create/diff_apply: 1-based start line of the section to replace. Use WITH end_line when you don't want to provide source text. If both source and start_line/end_line are given, start_line/end_line takes priority."],
                "end_line": ["type": "integer", "description": "For create/diff_apply: 1-based end line (inclusive) of the section to replace. Use WITH start_line when you don't want to provide source text."],
                "diff_id": ["type": "string", "description": "For apply: UUID from create"],
                "diff": ["type": "string", "description": "For apply: inline diff with =/-/+ prefixes"],
                "offset": ["type": "integer", "description": "For read: start line (default 1). Output capped at 50K chars; files under 50K return in ONE read — only chunk if truly huge."],
                "limit": ["type": "integer", "description": "For read: max lines (default 2000). Output capped at 50K chars regardless."],
                "pattern": ["type": "string", "description": "For list: glob. For search: regex"],
                "include": ["type": "string", "description": "For search: file filter (e.g. *.swift)"],
                "detail": ["type": "string", "description": "For read_dir: 'slim' (default, names only) or 'more' (full ls -la with sizes/dates/permissions)"],
                "function_name": ["type": "string", "description": "For extract_function: name of function to extract"],
                "new_file": ["type": "string", "description": "For extract_function: destination filename"],
            ],
            required: ["action"]
        ),
        // --- Git (consolidated) ---
        ToolDef(
            name: Name.git,
            description: "Git ops. status, diff, log, commit, diff_patch, branch, worktree.",
            properties: [
                "action": ["type": "string", "description": "status|diff|log|commit|diff_patch|branch|worktree"],
                "path": ["type": "string", "description": "Repository path (REQUIRED)"],
                "staged": ["type": "boolean", "description": "For diff: staged changes only"],
                "target": ["type": "string", "description": "For diff: branch/commit to diff against"],
                "count": ["type": "integer", "description": "For log: number of commits (default 20)"],
                "message": ["type": "string", "description": "For commit: commit message"],
                "files": ["type": "array", "items": ["type": "string"] as [String: Any], "description": "For commit: specific files to stage"] as [String: Any],
                "patch": ["type": "string", "description": "For diff_patch: unified diff content"],
                "name": ["type": "string", "description": "For branch: branch name"],
                "checkout": ["type": "boolean", "description": "For branch: switch to new branch (default true)"],
            ],
            required: ["action"]
        ),
        // --- Xcode (consolidated) ---
        ToolDef(
            name: Name.xcode,
            description: "Xcode build/run, code review, version bumps, add/remove files.",
            properties: [
                "action": ["type": "string", "description": "build|run|list_projects|select_project|add_file|remove_file|grant_permission|analyze|snippet|code_review|get_version|bump_version|bump_build"],
                "project_path": ["type": "string", "description": "For build/run: path (auto-detected if empty)"],
                "file_path": ["type": "string", "description": "For add_file/remove_file/analyze/snippet: path to source file"],
                "number": ["type": "integer", "description": "For select_project: project number (1-based)"],
                "start_line": ["type": "integer", "description": "For analyze/snippet: start line number"],
                "end_line": ["type": "integer", "description": "For analyze/snippet: end line number"],
                "checks": ["type": "string", "description": "For analyze: check groups (all, syntax, style, safety, performance, bestPractices)"],
                "delta": ["type": "integer", "description": "For bump_version/bump_build: +1 (default) or -1 to decrement"],
            ],
            required: ["action"]
        ),
        // --- Coding: Shell ---
        ToolDef(
            name: Name.executeAgentCommand,
            description: "Shell as current user via Launch Agent. Primary shell tool.",
            properties: [
                "command": ["type": "string", "description": "Bash command"],
            ],
            required: ["command"]
        ),
        ToolDef(
            name: Name.executeDaemonCommand,
            description: "Shell as ROOT via Launch Daemon. Admin tasks only — no sudo.",
            properties: [
                "command": ["type": "string", "description": "Bash command (runs as root)"],
            ],
            required: ["command"]
        ),
        ToolDef(
            name: Name.runShellScript,
            description: "Shell fallback when Launch Agent is off.",
            properties: [
                "command": ["type": "string", "description": "Bash command"],
            ],
            required: ["command"]
        ),
        ToolDef(
            name: Name.batchCommands,
            description: "Multiple shell commands in one call (newline-separated).",
            properties: [
                "commands": ["type": "string", "description": "Newline-separated commands"],
            ],
            required: ["commands"]
        ),
        ToolDef(
            name: Name.batchTools,
            description: "Multiple tool calls in one batch.",
            properties: [
                "description": ["type": "string", "description": "Batch label"],
                "tasks": ["type": "array", "description": "Array of {tool, input} objects", "items": ["type": "object"] as [String: Any]] as [String: Any],
            ],
            required: ["description", "tasks"]
        ),
        ToolDef(
            name: Name.taskComplete,
            description: "Signal task complete. Call when done.",
            properties: [
                "summary": ["type": "string", "description": "Brief summary"],
            ],
            required: ["summary"]
        ),
        // --- Project Folder ---
        ToolDef(
            name: Name.projectFolderTool,
            description: "Get or change the project folder for this tab.",
            properties: [
                "action": ["type": "string", "description": "get|set|home|documents|library|none|cd"],
                "path": ["type": "string", "description": "For set/cd: absolute or relative path"],
            ],
            required: ["action"]
        ),
        // --- Mode Tool ---
        // --- Agent Scripts (reusable Swift scripts) ---
        // --- Agent Scripts (consolidated) ---
        ToolDef(
            name: Name.agentScript,
            description: """
                Swift dylibs (~/Documents/AgentScript/agents) with full TCC. Entry: @_cdecl("script_main") public func scriptMain() -> Int32. Args via AGENT_SCRIPT_ARGS. For Mac app automation use ScriptingBridge as the PRIMARY route and NSAppleScript as the SECONDARY route — both run in-process and inherit Agent!'s TCC, mix them freely in the same script.

                PRIMARY — ScriptingBridge (typed Swift, default for app automation): `import XBridge` then `let app: XApplication = SBApplication(bundleIdentifier: "com.apple.X")!`. The Package.swift parser auto-wires any `import XBridge` line to the right product — NO Package.swift edits needed. ~50 bridges already shipped: AdobeIllustratorBridge, AppleScriptUtilityBridge, AutomatorBridge, BluetoothFileExchangeBridge, CalendarBridge, ConsoleBridge, ContactsBridge, DatabaseEventsBridge, DeveloperBridge, FinalCutProCreatorStudioBridge, FinderBridge, FirefoxBridge, FolderActionsSetupBridge, GoogleChromeBridge, ImageEventsBridge, InstrumentsBridge, KeynoteBridge, LogicProCreatorStudioBridge, MailBridge, MessagesBridge, MicrosoftEdgeBridge, MusicBridge, NotesBridge, NumbersBridge, NumbersCreatorStudioBridge, PagesBridge, PagesCreatorStudioBridge, PhotosBridge, PixelmatorProBridge, PreviewBridge, QuickTimePlayerBridge, RemindersBridge, SafariBridge, ScreenSharingBridge, ScriptEditorBridge, SeleniumBridge, ShortcutsBridge, ShortcutsEventsBridge, SimulatorBridge, SystemEventsBridge, SystemInformationBridge, SystemSettingsBridge, TVBridge, TerminalBridge, TextEditBridge, UTMBridge, VoiceOverBridge, WishBridge, XcodeScriptingBridge, plus ScriptingBridgeCommon (shared helpers) and AgentAccessibility (AX automation). Almost every stock Apple app you'd want to automate (Music, Mail, Safari, Pages, Keynote, Numbers, Finder, System Events, Calendar, Contacts, Notes, Reminders, Messages, Photos, TextEdit, Preview, Terminal, QuickTime, Shortcuts) is already there. Inspect a bridge's exact vocabulary with file(action:"read", path:"~/Documents/AgentScript/bridges/Sources/AgentEventBridges/<XBridge>.swift") — protocols look like `XApplication`, `XTrack`, `XPlaylist`, etc.
                EXAMPLE:  `import MusicBridge`  →  `guard let music: MusicApplication = SBApplication(bundleIdentifier: "com.apple.Music") else { return 1 }`  →  `music.playpause?()`

                SECONDARY — NSAppleScript (still approved and encouraged when it makes the automation easier): `import Foundation` then `NSAppleScript(source: "tell application \\"X\\" to ...")?.executeAndReturnError(&err)`. Reach for this when an AppleScript one-liner is shorter than the equivalent ScriptingBridge ceremony, when the SDEF maps awkwardly to typed Swift, when you want behavior that's only documented in the dictionary, or when the app has no bridge. BEFORE writing the AppleScript string call applescript(action:"lookup_sdef", bundle_id:"com.apple.X") to get the canonical commands/classes/properties so you don't guess. 51+ SDEFs bundled.
                EXAMPLE:  `let s = NSAppleScript(source: "tell application \\"Finder\\" to get the name of every disk")!`  →  `s.executeAndReturnError(nil)`

                SYSTEM EVENTS — universally available in BOTH routes. `import SystemEventsBridge` then `let se: SystemEventsApplication = SBApplication(bundleIdentifier: "com.apple.systemevents")!` (PRIMARY), or `tell application "System Events" to keystroke "a" using command down` inside an NSAppleScript string (SECONDARY). Use it for keystrokes, menu invocation, UI element clicks, process/window management, file/folder ops. Almost every multi-app automation pairs the target app with System Events for the parts that aren't in the target app's own dictionary.

                Default to ScriptingBridge. Drop down to NSAppleScript when it's clearly simpler.

                ACTIONS: list, read, create, update, edit, delete, run, combine, restore, pull, list_backups.
                - edit(name, old_string, new_string, replace_all?): Edit an agent script BY NAME — resolves the path internally. Use this INSTEAD of file(action:"edit") when modifying agent scripts; the model NEVER needs to know the absolute path.
                - delete(name): ALWAYS creates a `.Trash` backup before removing — fully reversible via restore.
                - restore(name): Restore the most recent `.Trash` backup. Pair with list_backups to see what's available. Refuses to overwrite a live script — delete first.
                - pull(name): Fetch the upstream version from the AgentScripts GitHub repo (single raw HTTP request, fast). Use when the user wants the *original* upstream version rather than a local backup that may contain edits. Refuses to overwrite a live script.
                - list_backups(name?): List `.Trash` backups for one script (or all if name omitted), newest first. Format: `<name>-<yyyyMMdd-HHmmss>.swift`. Pick a name to pass to restore.

                ENV CONTRACT (exported to every agent_script run AND to every user_shell/root_shell/shell command — uniform across all execution paths):
                - AGENT_PROJECT_FOLDER: ALWAYS the active tab's project folder (or $HOME if none). The runner also sets the process cwd to this folder, so shell commands don't need to `cd` first and getcwd()/FileManager.default.currentDirectoryPath return it.
                - AGENT_SCRIPT_ARGS: Only set when the LLM passed `arguments:"..."` to agent_script(action:"run"). Carries explicit args. The LLM does NOT set this env var directly — pass `arguments:"--mode=fast --target /tmp"` and the dispatcher exports it as AGENT_SCRIPT_ARGS. To pass data to a script, use the `arguments` parameter.
                - The two are INDEPENDENT — don't parse the project folder out of AGENT_SCRIPT_ARGS.
                READ PATTERNS:
                - Swift agent script: `let folder = ProcessInfo.processInfo.environment["AGENT_PROJECT_FOLDER"] ?? FileManager.default.currentDirectoryPath` / `let args = ProcessInfo.processInfo.environment["AGENT_SCRIPT_ARGS"] ?? ""`
                - Bash/Zsh: `ls "$AGENT_PROJECT_FOLDER/Sources"` (no `cd` needed, cwd is already set)
                - AppleScript: `do shell script "echo $AGENT_PROJECT_FOLDER"`
                - JXA: `$.NSProcessInfo.processInfo.environment.objectForKey('AGENT_PROJECT_FOLDER').js`
                """,
            properties: [
                "action": ["type": "string", "description": "list|read|create|update|edit|run|delete|combine|restore|pull|list_backups"],
                "name": ["type": "string", "description": "Script name (for read/create/update/edit/run/delete/restore/pull/list_backups)"],
                "content": ["type": "string", "description": "Swift source code (for create/update). For Mac app automation, prefer `import XBridge` (ScriptingBridge — see tool description for the 50 available bridges) over NSAppleScript. If using NSAppleScript, call applescript(lookup_sdef, bundle_id:...) FIRST to get the dictionary."],
                "old_string": ["type": "string", "description": "For edit: text to find inside the script"],
                "new_string": ["type": "string", "description": "For edit: replacement text"],
                "replace_all": ["type": "boolean", "description": "For edit: replace all occurrences (default false)"],
                "arguments": ["type": "string", "description": "For run: string passed via AGENT_SCRIPT_ARGS env var (independent of AGENT_PROJECT_FOLDER, which is always set to the project folder)"],
                "source_a": ["type": "string", "description": "For combine: first script name"],
                "source_b": ["type": "string", "description": "For combine: second script name"],
                "target": ["type": "string", "description": "For combine: output script name"],
            ],
            required: ["action"]
        ),
        // --- AppleScript (consolidated) ---
        ToolDef(
            name: Name.appleScriptTool,
            description: "AppleScript automation. ALWAYS call action='lookup_sdef' for the target app(s) FIRST to read the scripting dictionary, THEN action='execute' with verified commands. Guessing AppleScript syntax fails — every app exposes different terms. 51+ SDEFs bundled (Pages, Music, Mail, Safari, Finder, System Events, etc). Use bundle_id='list' to see catalog. **System Events (com.apple.systemevents) is the universal helper app — keystrokes, menu invocation, UI element clicking, process/window management, file/folder ops. ALWAYS available, often combined with another app (e.g. open Safari, then System Events keystroke; open Pages, then System Events click menu).** Multi-app workflows can fetch every SDEF in ONE call by passing a comma-separated list or an array — no need to loop. Failures auto-inject the SDEFs of every `tell application \"X\"` clause in the script. CONVENIENCE VERBS: action=quit|open|launch|activate with name='AppName' synthesizes `tell application \"AppName\" to <verb>` and runs it in-process — no need to write the AppleScript yourself for the common app-lifecycle case.",
            properties: [
                "action": ["type": "string", "description": "execute|lookup_sdef|list|run|save|delete|quit|open|launch|activate. Workflow: lookup_sdef (optionally batch) → execute. Convenience verbs (quit/open/launch/activate) take `name` and synthesize the tell-block."],
                "name": ["type": "string", "description": "Script name (for run/save/delete) OR app name (for quit/open/launch/activate convenience verbs)"],
                "source": ["type": "string", "description": "AppleScript source code (for execute/save). Must use ONLY commands/properties found via lookup_sdef."],
                "bundle_id": ["type": "string", "description": "For lookup_sdef: app bundle ID (e.g. com.apple.Music). Pass MULTIPLE in one call as comma-separated string ('com.apple.Safari,com.apple.systemevents') OR JSON array (['com.apple.Safari','com.apple.systemevents']) for multi-app scripts. Use 'list' to see the full catalog."],
                "class_name": ["type": "string", "description": "For lookup_sdef: specific class to drill into (e.g. 'track', 'window', 'document') after seeing the app summary. Ignored when bundle_id is a multi-app list."],
            ],
            required: ["action"]
        ),
        // --- JavaScript/JXA (consolidated) ---
        ToolDef(
            name: Name.javascriptTool,
            description: "JavaScript for Automation (JXA) — JS surface over the SAME scripting dictionaries that AppleScript uses. Pattern: `var app = Application(\"X\"); app.<command>()`. The dot-syntax maps directly to the SDEF's commands/classes/properties (camelCase the multi-word names). ALWAYS call applescript(action:\"lookup_sdef\", bundle_id:\"com.apple.X\") FIRST to get the canonical vocabulary — guessing fails the same way it does in AppleScript. 51+ SDEFs bundled. **System Events is universally available in JXA: `var se = Application(\"System Events\"); se.keystroke(\"a\", { using: \"command down\" });` — use it for keystrokes, menu invocation, UI element clicks, process/window management.** JXA failures auto-inject the SDEF of every `Application(\"X\")` reference on retry. CONVENIENCE VERBS: action=quit|open|launch|activate with name='AppName' synthesizes `Application(\"AppName\").<verb>()` JXA and runs it in-process via `osascript -l JavaScript` — skip writing the script for app-lifecycle calls.",
            properties: [
                "action": ["type": "string", "description": "execute|list|run|save|delete|quit|open|launch|activate. Workflow: lookup_sdef (via applescript tool) → execute. Convenience verbs (quit/open/launch/activate) take `name` and synthesize the JXA."],
                "name": ["type": "string", "description": "Script name (for run/save/delete) OR app name (for quit/open/launch/activate convenience verbs)"],
                "source": ["type": "string", "description": "JXA source code (for execute/save). Use ONLY commands/properties found via applescript(lookup_sdef). The dictionary's `commands` become methods on `Application(\"X\")`; classes become element accessors."],
            ],
            required: ["action"]
        ),
        // --- Accessibility (consolidated) ---
        ToolDef(
            name: Name.accessibility,
            description: "macOS UI automation via AXorcist. DEFAULT PATH for any 'click X in app Y' / 'type X in app Y' / 'press X in app Y' request: call click_element or type_into_element directly — do NOT call open_app first. The dispatcher (a) auto-launches the app if it isn't running, (b) fuzzy-matches your title against the app's real buttons and auto-retries if you guess wrong (response wraps as {auto_retry:{…}, result}), and (c) returns success:true ONLY when the action actually happened. When click_element returns success:true, the task is done — call done, do not verify with shell. Element-based ONLY: every action takes role/title/value/appBundleId, never coordinates. Use open_app ONLY when you genuinely need to enumerate an unfamiliar app's elements (rare). APP LIFECYCLE CONVENIENCE VERBS: action=quit|launch|activate|hide|unhide with name='AppName' routes to ax_manage_app.",
            properties: [
                "action": ["type": "string", "description": "PREFER click_element or type_into_element as the single call (they auto-launch + auto-retry). Other actions: find_element|scroll_to_element|list_windows|inspect_element|get_properties|perform_action|set_properties|get_focused_element|get_children|read_focused|wait_for_element|wait_adaptive|highlight_element|manage_app|show_menu|click_menu_item|set_window_frame|get_window_frame|screenshot|check_permission|request_permission|get_audit_log. open_app is only for when you genuinely need the full element tree of an unfamiliar app; otherwise skip it. Lifecycle convenience: quit|launch|activate|hide|unhide (takes `name`)."],
                "name": ["type": "string", "description": "For lifecycle convenience verbs (quit/open/launch/activate/hide/unhide): natural app name like \"Photo Booth\" or a bundle ID"],
                "role": ["type": "string", "description": "AX role: AXButton, AXTextField, AXLink, AXMenuItem, AXCheckBox, AXRadioButton, AXSlider, AXScrollArea, AXWebArea, AXImage, AXHeading, AXStaticText, AXWindow"],
                "title": ["type": "string", "description": "Title/name to match (partial, case-insensitive). Searches AXTitle + AXDescription + AXHelp."],
                "value": ["type": "string", "description": "Value to match (partial)"],
                "appBundleId": ["type": "string", "description": "REQUIRED for most actions. Bundle ID like 'com.apple.PhotoBooth'. App names like 'Photo Booth' auto-resolve. If you don't know the bundle ID, call manage_app(action:list) first."],
                "text": ["type": "string", "description": "For type_into_element: text to type into the element identified by role/title"],
                "windowId": ["type": "integer", "description": "For screenshot/list_windows: window ID"],
                "limit": ["type": "integer", "description": "For list_windows: max windows (default 50)"],
                "ax_action": ["type": "string", "description": "For perform_action: AXPress, AXConfirm, AXActivate, AXCancel, AXShowMenu, AXDismiss, AXIncrement, AXDecrement, AXExpand, AXCollapse, AXOpen, AXRaise, AXZoom, AXMinimize, AXCopy, AXCut, AXPaste, AXSelect, AXSelectAll, AXScrollToVisible, AXScrollPageUp/Down/Left/Right, AXFocus, AXShowDefaultUI, AXShowAlternateUI, AXDelete, AXPick"],
                "sub_action": ["type": "string", "description": "For manage_app: launch|activate|hide|unhide|quit|list. For clipboard: read|write|paste|copy_image."],
                "menuPath": ["type": "string", "description": "For click_menu_item: 'File > Save', 'Edit > Copy', etc. (use ' > ' as separator)"],
                "properties": ["type": "object", "description": "For set_properties: key-value pairs to set on the element"],
                "timeout": ["type": "number", "description": "For find_element / wait_for_element: max seconds (default 5)"],
                "pollInterval": ["type": "number", "description": "For wait_for_element: poll interval seconds (default 0.5)"],
                "depth": ["type": "integer", "description": "For get_children / inspect_element: traversal depth (default 3)"],
                "verify": ["type": "boolean", "description": "For click_element / type_into_element: verify the action took effect (default false for click, true for type)"],
                "x": ["type": "number", "description": "For set_window_frame: window x position"],
                "y": ["type": "number", "description": "For set_window_frame: window y position"],
                "width": ["type": "number", "description": "For set_window_frame: window width"],
                "height": ["type": "number", "description": "For set_window_frame: window height"],
            ],
            required: ["action"]
        ),
        // --- Tool Discovery ---
        ToolDef(
            name: Name.listNativeTools,
            description: "List all enabled tools (built-in and MCP).",
            properties: [:],
            required: []
        ),
        // --- Web (consolidated) ---
        ToolDef(
            name: Name.safari,
            description: "Safari automation. Open URLs, click, type, read content, search, manage tabs/windows. Built on top of Safari's AppleScript dictionary — `execute_js` runs through `tell application \"Safari\" to do JavaScript \"...\" in document 1`. For automation beyond these high-level actions (multi-window orchestration, source viewing, file downloads, custom tab properties), call applescript(action:\"lookup_sdef\", bundle_id:\"com.apple.Safari\") to see the full vocabulary, then run the AppleScript via the applescript tool. **For browser-chrome interactions that aren't in Safari's dictionary (clicking the toolbar, invoking menus, dismissing dialogs, sending Cmd-key shortcuts), combine Safari with System Events: `tell application \"Safari\" to activate` then `tell application \"System Events\" to keystroke ...` — fetch both SDEFs in one applescript(lookup_sdef) batch call.**",
            properties: [
                "action": ["type": "string", "description": "open|find|click|type|execute_js|get_url|get_title|read_content|google_search|scroll_to|select|submit|navigate|list_tabs|switch_tab|list_windows|scan|search"],
                "url": ["type": "string", "description": "URL to open"],
                "selector": ["type": "string", "description": "CSS selector for click/type/submit"],
                "text": ["type": "string", "description": "Text to type"],
                "query": ["type": "string", "description": "Search query"],
                "script": ["type": "string", "description": "JavaScript code (in-page JS, runs through Safari's `do JavaScript` AppleScript command)"],
            ],
            required: ["action"]
        ),
        // --- Selenium (consolidated) ---
        ToolDef(
            name: Name.seleniumTool,
            description: "Selenium WebDriver session. Use safari for normal Safari automation.",
            properties: [
                "action": ["type": "string", "description": "start|stop|navigate|find|click|type|execute|screenshot|wait"],
                "browser": ["type": "string", "description": "For start: safari (default), chrome, firefox"],
                "port": ["type": "integer", "description": "WebDriver port (default 7055)"],
                "url": ["type": "string", "description": "For navigate: URL"],
                "strategy": ["type": "string", "description": "For find/click/type/wait: css, xpath, id, name"],
                "value": ["type": "string", "description": "For find/click/type/wait: selector value"],
                "text": ["type": "string", "description": "For type: text to enter"],
                "script": ["type": "string", "description": "For execute: JavaScript code"],
                "filename": ["type": "string", "description": "For screenshot: filename"],
                "timeout": ["type": "number", "description": "For wait: max seconds (default 10)"],
                "capabilities": ["type": "object", "description": "For start: WebDriver capabilities"],
            ],
            required: ["action"]
        ),
        // --- Agent Tools (sub-agents, messaging, questions) ---
        ToolDef(
            name: "spawn_agent",
            description: "Spawn isolated sub-agent (own context + tool loop, max 3 concurrent). USE FOR: independent searches/research that return a summary; multiple lookups you want to run in parallel; long exploration whose intermediate steps don't need to enter your context. SKIP FOR: edits, work tied to your current state, anything where you must see every step. Prompt must be self-contained — sub-agent has no parent context.",
            properties: [
                "name": ["type": "string", "description": "Agent name (defaults to agent-N)"],
                "prompt": ["type": "string", "description": "Complete self-contained task. The sub-agent sees ONLY this — no parent context, no prior messages. Include all file paths, constraints, and what to return."],
                "tools": ["type": "string", "description": "all | comma-separated group names (Core,Code,User,Auto,Work,Root,Sub-agents). Narrow to keep the sub-agent focused. Read-only agents (tools: \"Core,Work\") get a higher concurrency cap than write-capable ones."],
                "max_iterations": ["type": "integer", "description": "Max LLM turns (default 15)"],
                "model": ["type": "string", "description": "Optional model id from the active provider's model list. Use a fast/cheap model for search-and-summarize agents; omit to inherit the parent's model."],
            ],
            required: ["prompt"]
        ),
        ToolDef(
            name: "tell_agent",
            description: "Send a follow-up message to a sub-agent already spawned via spawn_agent. USE FOR: refining its task, supplying new info, or asking for clarification mid-run. Useless before spawn_agent — there's no one to message.",
            properties: [
                "to": ["type": "string", "description": "Sub-agent name or ID returned by spawn_agent"],
                "message": ["type": "string", "description": "Message content"],
            ],
            required: ["to", "message"]
        ),
        ToolDef(
            name: "ask_user",
            description: "Mid-task user dialog. Waits up to 5min.",
            properties: [
                "question": ["type": "string", "description": "Question"],
            ],
            required: ["question"]
        ),
        ToolDef(
            name: "fetch",
            description: "Fetch URL, strip HTML, cap 8K chars.",
            properties: [
                "url": ["type": "string", "description": "URL"],
            ],
            required: ["url"]
        ),
        ToolDef(
            name: "skill",
            description: "Reusable prompt template.",
            properties: [
                "action": ["type": "string", "description": "list|invoke|save|delete"],
                "name": ["type": "string", "description": "Skill name"],
                "id": ["type": "string", "description": "Skill ID (save/delete)"],
                "description": ["type": "string", "description": "save: skill description"],
                "when_to_use": ["type": "string", "description": "save: when to invoke"],
                "content": ["type": "string", "description": "save: prompt content"],
            ],
            required: ["action"]
        ),
    ]

    // MARK: - Plain-Text Format (for Foundation Models / text-based providers)

    /// All tool names derived from commonTools + conversationTools. Use instead of hardcoded lists.
    nonisolated public static var toolNames: [String] {
        (commonTools + conversationTools).map { $0.name }
    }

    /// Compact tool reference for inclusion in plain-text model prompts.
    /// Format: toolName {"param": type, "optParam"?: type} — short description
    nonisolated public static var textFormat: String {
        var lines: [String] = ["TOOLS — call as: toolName {\"param\": value, ...}"]
        for tool in (commonTools + conversationTools) {
            let reqParams = tool.required
            let allKeys = tool.properties.keys.sorted { a, b in
                let aReq = reqParams.contains(a)
                let bReq = reqParams.contains(b)
                if aReq != bReq { return aReq }
                return a < b
            }
            var paramParts: [String] = []
            for key in allKeys {
                guard let schema = tool.properties[key] else { continue }
                let typeStr = (schema["type"] as? String) ?? "any"
                let opt = reqParams.contains(key) ? "" : "?"
                paramParts.append("\"\(key)\"\(opt): \(typeStr)")
            }
            let params = paramParts.isEmpty ? "{}" : "{\(paramParts.joined(separator: ", "))}"
            let shortDesc = tool.description.components(separatedBy: ". ").first ?? tool.description
            lines.append("\(tool.name) \(params) — \(shortDesc)")
        }
        return lines.joined(separator: "\n")
    }

    // MARK: - Claude (Anthropic) Format

    /// Convert a ToolDef to Anthropic's tool schema.
    public static func claudeTool(name: String, description: String, properties: [String: Any], required: [String]) -> [String: Any] {
        [
            "name": name,
            "description": description,
            "input_schema": [
                "type": "object",
                "properties": properties,
                "required": required,
            ] as [String: Any],
        ]
    }

    /// Sanitize an MCP tool name to alphanumeric, underscore, and hyphen only.
    private static func sanitizeToolName(_ name: String) -> String {
        String(name.unicodeScalars.filter { CharacterSet.alphanumerics.contains($0) || $0 == "_" || $0 == "-" }.prefix(128))
    }

    /// Sanitize an MCP tool description: collapse newlines, cap length.
    private static func sanitizeDescription(_ desc: String, maxLength: Int = 1024) -> String {
        let cleaned = desc
            .replacingOccurrences(of: "\r\n", with: " ")
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\r", with: " ")
        return String(cleaned.prefix(maxLength))
    }

    /// Recursively remove NSNull values and ensure schema validity
    private static func sanitizeSchema(_ value: Any) -> Any {
        if let dict = value as? [String: Any] {
            // Filter out NSNull values and sanitize recursively
            var result: [String: Any] = [:]
            for (key, val) in dict {
                if !(val is NSNull) {
                    result[key] = sanitizeSchema(val)
                }
            }
            // Ensure "properties" is always an object for object-type schemas
            if (result["type"] as? String) == "object" && result["properties"] == nil {
                result["properties"] = [:] as [String: Any]
            }
            // Fix OpenAI array schema: ensure "items" field exists for array types
            if result["type"] as? String == "array" && result["items"] == nil {
                // OpenAI requires "items" for array types - use empty object schema as default
                result["items"] = ["type": "object"] as [String: Any]
            }
            return result
        } else if let arr = value as? [Any] {
            return arr.map { sanitizeSchema($0) }
        } else if value is NSNull {
            // Replace NSNull with empty object for schema fields, or empty string for others
            return "" as Any
        }
        return value
    }

    /// Strip property descriptions to just type for compact mode.
    private static func compactProperties(_ properties: [String: Any]) -> [String: Any] {
        var result: [String: Any] = [:]
        for (key, value) in properties {
            if var dict = value as? [String: Any] {
                // Keep type, remove verbose description
                if let desc = dict["description"] as? String {
                    // Shorten to first phrase only
                    let short = desc.components(separatedBy: ".").first ?? desc
                    dict["description"] = String(short.prefix(40))
                }
                result[key] = dict
            } else {
                result[key] = value
            }
        }
        return result
    }

    /// All common tools + MCP tools in Claude/Anthropic format.
    /// When activeGroups is set, only tools in those groups are included.
    /// When compact is true, property descriptions are shortened for coding mode.
    /// MCP tool descriptor for format functions.
    public struct MCPToolInfo: Sendable {
        public let serverName: String
        public let name: String
        public let description: String
        public let inputSchemaJSON: String
        public init(serverName: String, name: String, description: String, inputSchemaJSON: String) {
            self.serverName = serverName; self.name = name; self.description = description; self.inputSchemaJSON = inputSchemaJSON
        }
    }

    /// Sanitize an MCP tool's name, description, and JSON schema (shared by Claude + Ollama formats).
    private static func sanitizedMCPTool(_ tool: MCPToolInfo) -> (name: String, description: String, schema: [String: Any]) {
        let safeName = sanitizeToolName("mcp_\(tool.serverName)_\(tool.name)")
        let safeDesc = sanitizeDescription("[MCP:\(tool.serverName)] \(tool.description)")
        let rawSchema = (try? JSONSerialization.jsonObject(with: Data(tool.inputSchemaJSON.utf8))) as? [String: Any]
        let schema = rawSchema.flatMap { sanitizeSchema($0) as? [String: Any] }
        let validSchema: [String: Any]
        if let s = schema, !s.isEmpty {
            validSchema = s
        } else {
            validSchema = ["type": "object", "properties": [:] as [String: Any]]
        }
        return (safeName, safeDesc, validSchema)
    }

    @MainActor public static func claudeFormat(isEnabled: (String) -> Bool, mcpTools: [MCPToolInfo] = [], compact: Bool = false) -> [[String: Any]] {
        var tools = (commonTools + webSearchTools + conversationTools)
            .filter { isEnabled($0.name) }
            .map { tool in
                let props = compact ? compactProperties(tool.properties) : tool.properties
                return claudeTool(name: tool.name, description: compact ? String(tool.description.prefix(60)) : tool.description,
                           properties: props, required: tool.required)
            }
        for tool in mcpTools {
            let (safeName, safeDesc, validSchema) = sanitizedMCPTool(tool)
            tools.append([
                "name": safeName,
                "description": safeDesc,
                "input_schema": validSchema,
            ] as [String: Any])
        }
        return tools
    }

    // MARK: - Ollama (OpenAI) Format

    /// Convert a ToolDef to OpenAI/Ollama tool schema.
    /// Applies schema sanitization to fix OpenAI-specific issues (e.g., array items requirement).
    public static func ollamaTool(name: String, description: String, properties: [String: Any], required: [String]) -> [String: Any] {
        // Sanitize properties to ensure OpenAI schema compliance
        let sanitizedProperties = sanitizeSchema(properties) as? [String: Any] ?? properties
        
        return [
            "type": "function",
            "function": [
                "name": name,
                "description": description,
                "parameters": [
                    "type": "object",
                    "properties": sanitizedProperties,
                    "required": required,
                ] as [String: Any],
            ] as [String: Any],
        ]
    }

    /// Web search tool available for all providers (client-side via Tavily).
    nonisolated(unsafe) public static let webSearchTools: [ToolDef] = [
        ToolDef(
            name: Name.webSearch, // Tavily web search — still uses web_search internally
            description: "Web search via Tavily.",
            properties: [
                "query": ["type": "string", "description": "Search query"],
            ],
            required: ["query"]
        ),
    ]

    /// Conversation tool definitions for writing, text transformation, self-description, and corrections.
    nonisolated(unsafe) public static let conversationTools: [ToolDef] = [
        // --- Conversation (consolidated) ---
        ToolDef(
            name: Name.conversation,
            description: "Write prose, transform text, fix spelling/grammar, describe Agent capabilities.",
            properties: [
                "action": ["type": "string", "description": "write|transform|fix|about"],
                "subject": ["type": "string", "description": "write: topic"],
                "style": ["type": "string", "description": "write: informative|creative|technical|casual|formal"],
                "length": ["type": "string", "description": "write: short|medium|long|<words>"],
                "context": ["type": "string", "description": "write: extra context"],
                "text": ["type": "string", "description": "transform/fix: input text"],
                "transform": ["type": "string", "description": "transform: grocery_list|todo_list|outline|summary|bullet_points|numbered_list|table|qa"],
                "fixes": ["type": "string", "description": "fix: all|spelling|grammar|punctuation|capitalization"],
                "topic": ["type": "string", "description": "about: tools|features|scripting|automation|coding|all"],
                "detail": ["type": "string", "description": "about: brief|standard|detailed"],
            ],
            required: ["action"]
        ),
        ToolDef(
            name: Name.planMode,
            description: "Plans with status tracking. REQUIRED for tasks touching 3+ files.",
            properties: [
                "action": ["type": "string", "description": "create|update|read|list|delete"],
                "name": ["type": "string", "description": "Plan name slug"],
                "steps": ["type": "string", "description": "create: newline-separated steps"],
                "step": ["type": "integer", "description": "update: 1-based step number (1 = first step)"],
                "status": ["type": "string", "description": "update: in_progress|completed|failed"],
            ],
            required: ["action"]
        ),
        ToolDef(
            name: Name.index,
            description: "Project index / repo-map. Writes .agent/index/index.jsonl — one JSON per file: {path,size,lines,mtime,language,sha256,doc,symbols[]}. Doc = leading comment block. Symbols = top-level decls (class/struct/func/etc). Portable — any LLM can read_file the JSONL directly. Actions: create|read|remove|recreate|append|continue.",
            properties: [
                "action": ["type": "string", "description": "create|read|remove|recreate|append|continue"],
                "extensions": ["type": "string", "description": "Optional comma-separated file extensions to include (e.g. swift,md,plist). Defaults to common code/text types."],
                "max_file_size": ["type": "integer", "description": "Max bytes per file to index (default 1MB). Larger files are skipped."],
                "offset": ["type": "integer", "description": "read: 1-based start line in the JSONL (default 1)"],
                "limit": ["type": "integer", "description": "read: max lines to return (default 500)"],
            ],
            required: ["action"]
        ),
        ToolDef(
            name: "memory",
            description: "Persistent memory as a tiny filesystem under /memories (Claude memory_20250818 shape). Two scopes: `global` (default, shared across projects) and `project` (scoped to the active project folder). Commands: view|create|str_replace|insert|delete|rename.",
            properties: [
                "command": ["type": "string", "description": "view|create|str_replace|insert|delete|rename"],
                "scope": ["type": "string", "description": "global (default, user-level, shared across projects) | project (scoped to the current project folder). Use project for code/notes specific to this repo."],
                "path": ["type": "string", "description": "Path under /memories (e.g. /memories or /memories/notes.md). view on /memories lists files."],
                "file_text": ["type": "string", "description": "create: full file contents."],
                "old_str": ["type": "string", "description": "str_replace: exact text to find (must be unique)."],
                "new_str": ["type": "string", "description": "str_replace: replacement text."],
                "insert_line": ["type": "integer", "description": "insert: 0-based line index to insert BEFORE (0 = top, N = after last line)."],
                "insert_text": ["type": "string", "description": "insert: text to insert (newlines allowed)."],
                "view_range": ["type": "array", "items": ["type": "integer"] as [String: Any], "description": "view: optional [start, end] 1-based inclusive line range; -1 for end means 'to end of file'."] as [String: Any],
                "old_path": ["type": "string", "description": "rename: source path under /memories."],
                "new_path": ["type": "string", "description": "rename: destination path under /memories."],
            ],
            required: ["command"]
        ),
    ]

    /// Provider-aware Ollama/OpenAI format — filters tools by per-provider preferences.
    /// When activeGroups is set, only tools in those groups are included.
    @MainActor public static func ollamaTools(isEnabled: (String) -> Bool, mcpTools: [MCPToolInfo] = [], compact: Bool = false) -> [[String: Any]] {
        // All providers get web_search and conversation tools
        var tools = (commonTools + webSearchTools + conversationTools)
            .filter { isEnabled($0.name) }
            .map { tool in
                let props = compact ? compactProperties(tool.properties) : tool.properties
                return ollamaTool(name: tool.name, description: compact ? String(tool.description.prefix(60)) : tool.description,
                           properties: props, required: tool.required)
            }
        for tool in mcpTools {
            let (safeName, safeDesc, validSchema) = sanitizedMCPTool(tool)
            tools.append([
                "type": "function",
                "function": [
                    "name": safeName,
                    "description": safeDesc,
                    "parameters": validSchema,
                ] as [String: Any],
            ] as [String: Any])
        }
        return tools
    }
}

