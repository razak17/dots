// RECOMMEND FEATURES OR ADDONS
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// HOMEPAGE
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);

// PERMISSIONS
user_pref("permissions.default.camera", 2);
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.geo", 2);
user_pref("permissions.default.microphone", 2);
user_pref("permissions.default.xr", 2);

// FONT
user_pref("font.name.serif.x-western", "FreeSans");
user_pref("font.size.variable.x-western", 12);
user_pref("font.internaluseonly.changed", false);
user_pref("browser.display.use_document_fonts", 0);
user_pref("gfx.downloadable_fonts.enabled", false); // [FF41+]
user_pref("gfx.downloadable_fonts.fallback_delay", -1);

// SEARCH AND URL BAR
user_pref("browser.urlbar.suggest.history", true);
user_pref("browser.urlbar.suggest.bookmark", true);
user_pref("browser.urlbar.suggest.openpage", true);
user_pref("browser.search.countryCode", "US");
user_pref("browser.search.widget.inNavBar", true);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.topsites", false);

// BOOKMARKS
user_pref("browser.tabs.loadBookmarksInTabs", true); // open bookmarks in a new tab [FF57+]
user_pref("browser.bookmarks.max_backups", 2);
user_pref("browser.toolbars.bookmarks.showOtherBookmarks", false);
user_pref("browser.toolbars.bookmarks.visibility", "always");

// DEVTOOLS
user_pref("devtools.theme", "dark");
user_pref("devtools.editor.keymap", "vim");

user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.openWindows", true);
user_pref("privacy.cpd.openWindows", true);
user_pref("privacy.cpd.history", true);
user_pref("signon.rememberSignons", false);
user_pref("browser.display.background_color", "#1e2127");
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("dom.security.https_only_mode", false); // [FF76+]
user_pref("sidebar.position_start", false);

user_pref("browser.startup.page", 3);
user_pref("browser.region.update.region", "US");
user_pref("browser.urlbar.placeholderName", "Google");
user_pref("extensions.formautofill.addresses.usage.hasEntry", false);
user_pref("browser.quitShortcut.disabled", true); // disable Ctrl-Q quit shortcut [LINUX] [MAC] [FF87+]
user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[\"canvasblocker_kkapsner_de-browser-action\",\"addon_darkreader_org-browser-action\",\"developer-button\",\"downloads-button\",\"firefoxcolor_mozilla_com-browser-action\",\"panic-button\",\"library-button\",\"privatebrowsing-button\",\"new-window-button\",\"_c607c8df-14a7-4f28-894f-29e8722976af_-browser-action\",\"preferences-button\"],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"home-button\",\"urlbar-container\",\"search-container\",\"_testpilot-containers-browser-action\",\"_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action\",\"keepassxc-browser_keepassxc_org-browser-action\",\"cookieautodelete_kennydo_com-browser-action\",\"stefanvandamme_stefanvd_net-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"_react-devtools-browser-action\",\"firenvim_lacamb_re-browser-action\",\"_72bd91c9-3dc5-40a8-9b10-dec633c0873f_-browser-action\",\"_a250ed19-05b9-4486-b2c3-535044766b8c_-browser-action\",\"user-agent-switcher_ninetailed_ninja-browser-action\",\"_bc2166c4-e7a2-46d5-ad9e-342cef57f1f7_-browser-action\",\"_e4a8a97b-f2ed-450b-b12d-ee082ba24781_-browser-action\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\",\"managed-bookmarks\"]},\"seen\":[\"developer-button\",\"_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action\",\"cookieautodelete_kennydo_com-browser-action\",\"_testpilot-containers-browser-action\",\"firefoxcolor_mozilla_com-browser-action\",\"canvasblocker_kkapsner_de-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"addon_darkreader_org-browser-action\",\"_c607c8df-14a7-4f28-894f-29e8722976af_-browser-action\",\"stefanvandamme_stefanvd_net-browser-action\",\"_react-devtools-browser-action\",\"keepassxc-browser_keepassxc_org-browser-action\",\"firenvim_lacamb_re-browser-action\",\"_72bd91c9-3dc5-40a8-9b10-dec633c0873f_-browser-action\",\"_a250ed19-05b9-4486-b2c3-535044766b8c_-browser-action\",\"user-agent-switcher_ninetailed_ninja-browser-action\",\"_bc2166c4-e7a2-46d5-ad9e-342cef57f1f7_-browser-action\",\"_e4a8a97b-f2ed-450b-b12d-ee082ba24781_-browser-action\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\"],\"dirtyAreaCache\":[\"nav-bar\",\"widget-overflow-fixed-list\",\"TabsToolbar\",\"toolbar-menubar\",\"PersonalToolbar\"],\"currentVersion\":16,\"newElementCount\":7}");
user_pref("accessibility.browsewithcaret", true);
user_pref("accessibility.typeaheadfind", true);

