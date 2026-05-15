#!/bin/bash

echo "==> Installing PHP + Laravel dependencies (Arch)..."

PACKAGES=(
  php
  php-intl
  composer
  unzip
)

install_pkg() {
  local pkg="$1"

  if pacman -Q "$pkg" &>/dev/null; then
    echo "$pkg already installed"
    return
  fi

  echo "Installing $pkg..."

  if command -v yay &>/dev/null; then
    yay -S --noconfirm "$pkg"
  else
    sudo pacman -S --noconfirm "$pkg"
  fi
}

for pkg in "${PACKAGES[@]}"; do
  install_pkg "$pkg"
done

echo "==> Optional: Laravel installer check"

# Laravel installer is NOT in pacman; skip unless user already installed it
if command -v laravel &>/dev/null; then
  echo "Laravel installer already installed"
else
  echo "Laravel installer not found (optional)."
  echo "You can install it manually with:"
  echo "  composer global require laravel/installer"
fi

echo "==> Done."
echo "PHP version: $(php -v | head -n 1)"
echo "Composer version: $(composer -V)"
