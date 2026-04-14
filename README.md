# tmux-claude-hub

Collect all Claude Code panes from across your tmux session into a single hub window — then send them back with one keypress.

Built for workflows where each project window has a Claude Code pane alongside an editor and terminal, and you want to check in on all your Claude sessions at once.

## How it works

- **Collect** (`prefix + G`): Finds all Claude Code panes in your current session, moves them into a new `claude-hub` window at index 0, and labels each pane with its source window name. Your original windows stay intact.
- **Restore** (`prefix + U`): Sends each pane back to its original window and closes the hub. Returns you to the window you were in before collecting.

## Install

```sh
git clone https://github.com/swain/tmux-claude-hub ~/personal/tmux-claude-hub
cd ~/personal/tmux-claude-hub
bash install.sh
```

Make sure `~/.local/bin` is in your `$PATH`.

Then add to `~/.tmux.conf`:

```tmux
bind G run-shell "tmux-claude-collect"
bind U run-shell "tmux-claude-restore"
```

Reload your config (`prefix + r` or `tmux source ~/.tmux.conf`).

## Requirements

- tmux
- Claude Code

## How Claude Code panes are identified

Claude Code sets its process title to its version number (e.g. `2.1.108`). The scripts match on this pattern (`^[0-9]+\.[0-9]+\.[0-9]+$`) via tmux's `pane_current_command`. This is more reliable than matching on pane title, which changes based on task state.
