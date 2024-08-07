session_root "$HOME/Documents/Github/mcc_azure_infrastructure/"

if initialize_session "mcc-az-terraform"; then
  new_window "nvim"
  split_h 50
  select_pane 0
fi

finalize_and_go_to_session
