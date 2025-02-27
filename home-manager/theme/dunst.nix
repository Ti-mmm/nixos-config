{ pkgs, ... }: {    
services.dunst.settings = {
  global = {
    width = "(300, 600)";
    height = "(0, 300)";
    follow = "mouse";
    origin = "top-center";
    offset = "(30, 30)";
    scale = 0;
    notification_limit = 20;
    progress_bar = true;
    progress_bar_height = 10;
    progress_bar_frame_width = 1;
    progress_bar_min_width = 150;
    progress_bar_corner_radius = 5;
    icon_corner_radius = 0;
    indicate_hidden = "yes";
    # transparency = 10;
    separator_height = 2;
    padding = 8;
    horizontal_padding = 8;
    text_icon_padding = 0;
    frame_width = 1;
    frame_color = "#8bd5ca";
    gap_size = 0;
    separator_color = "frame";
    sort = "yes";
    font = "JetBrains Mono Nerd Font";
    line_height = 1;
    markup = "full";
    format = "<b>%s</b>\\n%b";
    alignment = "left";
    vertical_alignment = "center";
    show_age_threshold = 60;
    ellipsize = "middle";
    ignore_newline = "no";
    stack_duplicates = true;
    hide_duplicate_count = false;
    show_indicators = "yes";
    enable_recursive_icon_lookup = true;
    icon_position = "left";
    min_icon_size = 32;
    max_icon_size = 128;
    # icon_path = "/usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/";
    sticky_history = "yes";
    history_length = 20;
    dmenu = "/usr/bin/dmenu -p dunst";
    browser = "/usr/bin/xdg-open";
    always_run_script = true;
    title = "Dunst";
    class = "Dunst";
    corner_radius = 10;
    ignore_dbusclose = false;
    mouse_left_click = "close_current";
    mouse_middle_click = "do_action, close_current";
    mouse_right_click = "close_all";
    # per_monitor_dpi = false;
  };
  urgency_low = {
    background = "#1415E80";
    foreground = "#FFFFFF";
    timeout = 6;
  };
  urgency_normal = {
    background = "#14151E80";
    foreground = "#FFFFFF";
    timeout = 6;
  };
  urgency_critical = {
    background = "#900000AF";
    foreground = "#FFFFFF";
    timeout = 6;
  };
};
}
