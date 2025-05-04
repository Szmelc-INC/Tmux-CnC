post_install() {
  user_home=$(getent passwd "$SUDO_USER" | cut -d: -f6)

  if [[ -n "$user_home" && -d "$user_home" ]]; then
    cp -n /etc/skel/.tmuxrc "$user_home/.tmuxrc"
    chown "$SUDO_USER:$SUDO_USER" "$user_home/.tmuxrc"

    for rc in .bashrc .zshrc; do
      rc_path="$user_home/$rc"
      [[ -f "$rc_path" ]] || continue
      grep -q 'source ~/.tmuxrc' "$rc_path" || echo 'source ~/.tmuxrc' >> "$rc_path"
    done
  fi
}
