session_root "$HOME/Documents/Github/drugo/infrastrcuture/"

if initialize_session "drugo-terraform"; then
  new_window "nvim"
  split_h 50
  split_v 25
  select_pane 2
  run_cmd "watchexec -ec task plan"
  select_pane 0
  run_cmd "nvim"
fi

finalize_and_go_to_session

