<h1 align="center">tgrep</h1>

<p align="center">
  <b>Telegram-style fuzzy search for the Kali terminal.</b><br>
  Live-filter shell history, files, <i>or piped command output</i> with an
  interactive TUI — type to search, arrow keys to move, Enter to select.
</p>

<p align="center">
  <img alt="language" src="https://img.shields.io/badge/language-Python%203-blue">
  <img alt="license" src="https://img.shields.io/badge/license-MIT-green">
  <img alt="platform" src="https://img.shields.io/badge/platform-Linux%20%7C%20Kali-informational">
  <img alt="version" src="https://img.shields.io/badge/version-1.1.0-orange">
</p>

---

## Why?

Kali gives you `Ctrl+R` (reverse-i-search) and `grep`, but nothing that
feels like the **search bar in Telegram** — instant fuzzy filtering with
matched characters highlighted inline. `tgrep` fills that gap, and
extends it to **command output** and **tmux scrollback**, so you can
search the `nmap` scan that's already on screen without leaving the
terminal.

- **Fuzzy matching** — `nmp` matches `nmap -sV 10.10.10.5`
- **Highlighted matches** — matched characters colourised in-line
- **Three modes** — shell history, filesystem, piped stdin
- **tmux popup** — Telegram-feel search over the current pane on `Ctrl+F`
- **Clipboard copy** — `Ctrl+Y` (`wl-copy`, `xclip`, or `xsel`)
- **Run it directly** — `Ctrl+E` executes the selected history line
- **Zero dependencies** — pure Python 3 standard library
- **Kali-ready** — installs into `/usr/local/bin` in one command

---

## Install

    git clone https://github.com/prathyusec/tgrep.git
    cd tgrep
    sudo ./install.sh

Optional — enable `Ctrl+Y` clipboard copy:

    sudo apt install -y xclip           # X11
    sudo apt install -y wl-clipboard    # Wayland

---

## Usage

### 1. Search your shell history

    tgrep                  # fuzzy-search bash/zsh/fish history
    tgrep "ssh"            # pre-fill the query

### 2. Search files on disk

    tgrep -f               # files under current directory
    tgrep -f -d /etc       # files under /etc

### 3. Search command output (pipe mode)

    nmap -sV 10.10.10.5 | tgrep -p
    gobuster dir -u http://target -w /usr/share/wordlists/dirb/common.txt | tgrep -p
    cat /var/log/auth.log | tgrep -p

### 4. Telegram-style popup over your live terminal (tmux)

Add to `~/.tmux.conf`:

    bind -n C-f display-popup -E -w 90% -h 70% "$HOME/.local/bin/tgrep-tmux"

Then reload: `tmux source-file ~/.tmux.conf`. Press **Ctrl+F** inside tmux
to search the pane's scrollback and copy the hit.

---

## Key bindings

| Key              | Action                                       |
| ---------------- | -------------------------------------------- |
| *(typing)*       | live fuzzy filter                            |
| Up / Down        | move selection                               |
| PgUp / PgDn      | page up / down                               |
| Home / End       | jump to first / last result                  |
| Enter            | print selection to stdout and exit           |
| Ctrl+Y           | copy selection to clipboard                  |
| Ctrl+E           | execute selection (history mode)             |
| Ctrl+U           | clear query                                  |
| Ctrl+F           | toggle history / files mode                  |
| Esc / Ctrl+C     | quit                                         |

---

## Power tip — replace `Ctrl+R`

Add to `~/.bashrc`:

    _tgrep_ctrlr() {
        local cmd
        cmd=$(tgrep) || { READLINE_LINE=""; READLINE_POINT=0; return; }
        READLINE_LINE="$cmd"
        READLINE_POINT=${#cmd}
    }
    bind -x '"\C-r": _tgrep_ctrlr'

Requires Bash 4.0+ (Kali ships 5.x).

---

## License

MIT — see [LICENSE](LICENSE).

## Author

**Prathyush** ([@prathyusec](https://github.com/prathyusec))
