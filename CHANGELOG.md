# Changelog

All notable changes to **tgrep** are documented here.

Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Versioning: [SemVer](https://semver.org/spec/v2.0.0.html).

## [1.1.0] — 2026-10-15

### Added
- **Pipe mode** (`-p` / `--pipe`) — fuzzy-search the output of any command
  via stdin, e.g. `nmap -sV 10.0.0.1 | tgrep -p`.
- **`tgrep-tmux`** — a wrapper that captures the current tmux pane's
  scrollback and hands it to `tgrep`, giving a Telegram-style popup search
  over the live terminal via `Ctrl+F`.
- `examples/tmux.conf` with the popup binding.
- Pipe mode disables the `Ctrl+F` mode toggle and clearly reports it.

### Changed
- README restructured with dedicated "Search command output" and
  "Telegram-style popup over your live terminal" sections.

## [1.0.0] — 2026-10-01

### Added
- Initial release.
- Interactive curses TUI with live fuzzy filtering.
- Shell history search (bash, zsh, fish).
- Filesystem search mode (`-f` / `-d`).
- Clipboard copy (`Ctrl+Y`) with `wl-copy`/`xclip`/`xsel`.
- Execute-selected (`Ctrl+E`) in history mode.
- Mode toggle (`Ctrl+F`) between history and files.
