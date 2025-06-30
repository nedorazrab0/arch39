conf() {
  set +o history
  local completion_path='/usr/share/bash-completion/bash_completion'
  [[ -r "${completion_path}" ]] && . "${completion_path}"
}

main() {
  # If not running interactively, do not do anything
  [[ "${-}" != *i* ]] && return

  # Prevent double sourcing
  if [[ -z "${BASHRCSOURCED}" ]]; then
    BASHRCSOURCED='Y'
    conf
  fi
}

main
