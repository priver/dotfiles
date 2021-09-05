# colors
set -l foreground f8f8f2
set -l selection 44475a
set -l comment 6272a4
set -l red ff5555
set -l orange ffb86c
set -l yellow f1fa8c
set -l green 50fa7b
set -l purple bd93f9
set -l cyan 8be9fd
set -l pink ff79c6

# prompt
set -g tide_prompt_add_newline_before false
set -g tide_prompt_min_cols 26
set -g tide_prompt_pad_items false

# left_prompt
set -g tide_left_prompt_frame_enabled false
set -g tide_left_prompt_items context pwd git character
set -g tide_left_prompt_prefix ''
set -g tide_left_prompt_suffix ' '

# right_prompt
set -g tide_right_prompt_frame_enabled false
set -g tide_right_prompt_items status cmd_duration jobs node # kubectl
set -g tide_right_prompt_prefix ' '
set -g tide_right_prompt_suffix ''

# character
set -g tide_character_bg_color normal
set -g tide_character_color $green
set -g tide_character_color_failure $red
set -g tide_character_icon '❯'
set -g tide_character_vi_icon_default '❮'
set -g tide_character_vi_icon_replace '▶'
set -g tide_character_vi_icon_visual V

# cmd_duration
set -g tide_cmd_duration_bg_color normal
set -g tide_cmd_duration_color $yellow
set -g tide_cmd_duration_decimals 0
set -g tide_cmd_duration_icon ''
set -g tide_cmd_duration_threshold 3000

# context
set -g tide_context_always_display false
set -g tide_context_bg_color normal
set -g tide_context_color_default $green
set -g tide_context_color_root $red
set -g tide_context_color_ssh $green

# git
set -g tide_git_bg_color normal
set -g tide_git_bg_color_unstable normal
set -g tide_git_bg_color_urgent normal
set -g tide_git_color_branch $purple
set -g tide_git_color_conflicted $red
set -g tide_git_color_dirty $orange
set -g tide_git_color_operation $red
set -g tide_git_color_staged $green
set -g tide_git_color_stash $comment
set -g tide_git_color_untracked $orange
set -g tide_git_color_upstream $green
set -g tide_git_icon ''

# job
set -g tide_jobs_bg_color normal
set -g tide_jobs_color $foreground
set -g tide_jobs_icon ''

# kubectl
set -g tide_kubectl_bg_color normal
set -g tide_kubectl_color 316de6
set -g tide_kubectl_icon '⎈'

# node
set -g tide_node_bg_color normal
set -g tide_node_color 026e00
set -g tide_node_icon '⬢'

# pwd
set -g tide_pwd_bg_color normal
set -g tide_pwd_color_anchors $cyan
set -g tide_pwd_color_dirs $cyan
set -g tide_pwd_color_truncated_dirs $comment
set -g tide_pwd_icon
set -g tide_pwd_icon_home
set -g tide_pwd_icon_unwritable ''
set -g tide_pwd_markers .git package.json

# status
set -g tide_status_bg_color normal
set -g tide_status_bg_color_failure normal
set -g tide_status_color $green
set -g tide_status_color_failure $red
set -g tide_status_icon '✔'
set -g tide_status_icon_failure '✘'
