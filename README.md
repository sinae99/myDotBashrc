# mydotbashrc


### 1. bash-completion
Provides programmable completion for many CLI tools.

```bash
sudo apt install -y bash-completion
```

Used by:
- git
- kubectl
- ssh / scp / rsync
- systemctl, docker, etc.

---

### 2. ble.sh (Bash Line Editor)
Adds **fish-like autosuggestions** and **syntax highlighting** to bash.

Features:
- inline history suggestions (gray text)
- command validity highlighting (red/green)
- smarter readline behavior
- zero shell switch

Install:

```bash
sudo apt install -y gawk
git clone https://github.com/akinomyoga/ble.sh.git /tmp/ble.sh
cd /tmp/ble.sh
make install
```

Installed to:
```
~/.local/share/blesh/
```

---

### 3. git
Used for showing the current git branch in the prompt.

```bash
sudo apt install -y git
```

Provides:
```
/usr/share/git/git-prompt.sh
```

---

### 4. kubectl
For Kubernetes users.

Used for:
- kubectl tab completion
- kubectl aliases

---

## What must be in ~/.bashrc

---

### Ensure interactive shell
```bash
case $- in
  *i*) ;;
  *) return ;;
esac
```

---

### Enable programmable completion
```bash
shopt -s progcomp

if [ -r /etc/bash_completion ]; then
  . /etc/bash_completion
elif [ -r /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi
```

---

### Enable ble.sh (autosuggestions + highlighting)
```bash
if [ -r "$HOME/.local/share/blesh/ble.sh" ]; then
  source "$HOME/.local/share/blesh/ble.sh"
fi
```

This enables:
- history-based autosuggestions
- syntax highlighting
- enhanced readline behavior

---

### Git branch in prompt
```bash
if [ -r /usr/share/git/git-prompt.sh ]; then
  . /usr/share/git/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
fi
```

Example prompt:
```
sina@host:~/repo (main)$
```

---

### kubectl completion
```bash
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion bash)
fi
```



