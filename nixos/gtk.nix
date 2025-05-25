{ config, pkgs, lib, ... }:

{
  # Enable Thunar daemon for volume management
  services.gvfs.enable = true;
  services.tumbler.enable = true; # For thumbnails

  # Enable Xfce services that Thunar depends on
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };

  # GTK theming with Kanagawa colors
  environment.etc."xdg/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-application-prefer-dark-theme=1
    gtk-theme-name=Kanagawa-GTK
    gtk-icon-theme-name=Papirus-Dark
    gtk-font-name=Sans 10
    gtk-cursor-theme-name=Adwaita
    gtk-cursor-theme-size=0
    gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
    gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
    gtk-button-images=1
    gtk-menu-images=1
    gtk-enable-event-sounds=1
    gtk-enable-input-feedback-sounds=1
    gtk-xft-antialias=1
    gtk-xft-hinting=1
    gtk-xft-hintstyle=hintfull
  '';

  # Create custom Kanagawa GTK theme
  home-manager.users.dhoenisch = { pkgs, ... }: {
    # Install oomox for GTK theme generation
    home.packages = with pkgs; [ 
      themix-gui
      sassc
    ];

    # Generate Kanagawa theme using oomox
    home.file.".themes/Kanagawa-GTK/gtk-3.0/gtk.css".text = ''
      /* Kanagawa color palette */
      @define-color fujiWhite #DCD7BA;
      @define-color oldWhite #C8C093;
      @define-color sumiInk0 #16161D;
      @define-color sumiInk1 #1F1F28;
      @define-color sumiInk2 #2A2A37;
      @define-color sumiInk3 #363646;
      @define-color sumiInk4 #54546D;
      @define-color waveBlue1 #223249;
      @define-color waveBlue2 #2D4F67;
      @define-color winterGreen #2B3328;
      @define-color winterYellow #49443C;
      @define-color winterRed #43242B;
      @define-color winterBlue #252535;
      @define-color autumnGreen #76946A;
      @define-color autumnRed #C34043;
      @define-color autumnYellow #DCA561;
      @define-color samuraiRed #E82424;
      @define-color roninYellow #FF9E3B;
      @define-color waveAqua1 #6A9589;
      @define-color dragonBlue #658594;
      @define-color fujiGray #727169;
      @define-color springViolet1 #938AA9;
      @define-color oniViolet #957FB8;
      @define-color crystalBlue #7E9CD8;
      @define-color springViolet2 #9CABCA;
      @define-color springBlue #7FB4CA;
      @define-color lightBlue #A3D4D5;
      @define-color waveAqua2 #7AA89F;
      @define-color springGreen #98BB6C;
      @define-color boatYellow1 #938056;
      @define-color boatYellow2 #C0A36E;
      @define-color carpYellow #E6C384;
      @define-color sakuraPink #D27E99;
      @define-color waveRed #E46876;
      @define-color peachRed #FF5D62;
      @define-color surimiOrange #FFA066;
      @define-color katanaGray #717C7C;

      /* Apply Kanagawa colors to Thunar elements */
      
      /* Main window background and text */
      window, dialog, messagedialog {
        background-color: @sumiInk1;
        color: @fujiWhite;
      }
      
      /* Sidebar styling */
      .sidebar, .sidebar-row {
        background-color: @sumiInk2;
        color: @oldWhite;
      }
      
      .sidebar-row:selected {
        background-color: @waveBlue1;
        color: @carpYellow;
      }
      
      .sidebar-row:hover {
        background-color: @sumiInk3;
      }
      
      /* File list */
      treeview {
        background-color: @sumiInk1;
        color: @fujiWhite;
      }
      
      treeview:selected {
        background-color: @waveBlue1;
        color: @carpYellow;
      }
      
      treeview:hover {
        background-color: @sumiInk3;
      }
      
      /* Location bar */
      entry {
        background-color: @sumiInk3;
        color: @oldWhite;
        border-color: @sumiInk4;
      }
      
      /* Buttons */
      button {
        background-color: @sumiInk3;
        color: @oldWhite;
        border-color: @sumiInk4;
      }
      
      button:hover {
        background-color: @waveBlue1;
        color: @carpYellow;
      }
      
      button:active {
        background-color: @waveBlue2;
        color: @lightBlue;
      }
      
      /* Toolbar */
      toolbar {
        background-color: @sumiInk2;
        border-color: @sumiInk4;
      }
      
      /* Scrollbars */
      scrollbar {
        background-color: @sumiInk1;
      }
      
      scrollbar slider {
        background-color: @sumiInk4;
      }
      
      scrollbar slider:hover {
        background-color: @waveBlue1;
      }
      
      /* Status bar */
      statusbar {
        background-color: @sumiInk2;
        color: @fujiGray;
      }
      
      /* Progress bars */
      progressbar {
        background-color: @sumiInk3;
      }
      
      progressbar progress {
        background-color: @autumnGreen;
      }
      
      /* Column headers */
      treeview header button {
        background-color: @sumiInk2;
        color: @oldWhite;
        border-color: @sumiInk4;
      }
      
      /* Context menus */
      menu {
        background-color: @sumiInk2;
        color: @fujiWhite;
        border-color: @sumiInk4;
      }
      
      menuitem:hover {
        background-color: @waveBlue1;
        color: @carpYellow;
      }
    '';

    # Custom Thunar settings
    xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/thunar.xml".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <channel name="thunar" version="1.0">
        <property name="last-view" type="string" value="ThunarIconView"/>
        <property name="last-icon-view-zoom-level" type="string" value="THUNAR_ZOOM_LEVEL_100_PERCENT"/>
        <property name="last-separator-position" type="int" value="170"/>
        <property name="last-window-width" type="int" value="960"/>
        <property name="last-window-height" type="int" value="540"/>
        <property name="last-window-maximized" type="bool" value="false"/>
        <property name="last-details-view-zoom-level" type="string" value="THUNAR_ZOOM_LEVEL_SMALLER"/>
        <property name="last-details-view-column-widths" type="string" value="50,133,50,50,561,50,50,72,70"/>
        <property name="misc-date-style" type="string" value="THUNAR_DATE_STYLE_SHORT"/>
        <property name="misc-single-click" type="bool" value="false"/>
        <property name="misc-show-delete-action" type="bool" value="true"/>
        <property name="misc-full-path-in-title" type="bool" value="true"/>
        <property name="shortcuts-icon-emblems" type="bool" value="true"/>
        <property name="shortcuts-icon-size" type="string" value="THUNAR_ICON_SIZE_24"/>
        <property name="tree-icon-size" type="string" value="THUNAR_ICON_SIZE_16"/>
        <property name="misc-text-beside-icons" type="bool" value="false"/>
        <property name="last-side-pane" type="string" value="ThunarShortcutsPane"/>
        <property name="last-location-bar" type="string" value="ThunarLocationEntry"/>
        <property name="misc-thumbnail-mode" type="string" value="THUNAR_THUMBNAIL_MODE_ALWAYS"/>
        <property name="misc-change-window-icon" type="bool" value="true"/>
        <property name="misc-middle-click-in-tab" type="bool" value="true"/>
        <property name="misc-show-thumbnails" type="bool" value="true"/>
        <property name="misc-small-toolbar-icons" type="bool" value="true"/>
      </channel>
    '';
  };

  # Adding a hook to reload GTK themes when changed
  system.userActivationScripts = {
    reloadGtkTheme = ''
      ${pkgs.dbus}/bin/dbus-send --session --dest=org.gtk.Settings --type=method_call /org/gtk/Settings org.gtk.Settings.StyleChanged
    '';
  };
}

