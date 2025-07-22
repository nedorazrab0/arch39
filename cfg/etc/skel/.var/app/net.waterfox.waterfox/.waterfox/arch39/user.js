// Firefox settings

// VA
user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("media.ffmpeg.vaapi.force-surface-zero-copy", 1);
user_pref("media.webrtc.hw.h264.enabled", true);
user_pref("media.gmp-gmpopenh264.autoupdate", true);
user_pref("media.navigator.mediadatadecoder_vp8_hardware_enabled", true);
user_pref("media.hardware-video-decoding.force-enabled", true);
user_pref("media.peerconnection.video.vp9_preferred", true);
user_pref("media.mediasource.vp9.enabled", true);
user_pref("media.peerconnection.video.vp9_enabled", true);
user_pref("media.webrtc.simulcast.vp9.enabled", true);
user_pref("dom.media.webcodecs.h265.enabled", true);
//user_pref("webgl.forbid-hardware", false);

user_pref("media.av1.new-thread-count-strategy", true);
user_pref("media.webrtc.codec.video.av1.enabled", false);
user_pref("media.webrtc.codec.video.av1.experimental_preferred", false);
user_pref("media.webrtc.simulcast.av1.enabled", false);
user_pref("media.av1.enabled", false);
user_pref("image.avif.use-dav1d", true);

// Remove ugly waterfox design
user_pref("browser.theme.enableWaterfoxCustomizations", 2);

// PIP annoyance
user_pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false);

// Look and feel
user_pref("browser.uiCustomization.state", "{\"placements\":
    {\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],
    \"nav-bar\":[\"customizableui-special-spring0\",
    \"customizableui-special-spring1\",\"customizableui-special-spring2\",
    \"customizableui-special-spring3\",\"urlbar-container\",
    \"unified-extensions-button\",\"customizableui-special-spring4\",
    \"customizableui-special-spring5\",\"customizableui-special-spring6\",
    \"forward-button\",\"back-button\"],
    \"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":
    [\"tabbrowser-tabs\",\"alltabs-button\"],\"PersonalToolbar\":
    [\"import-button\",\"personal-bookmarks\"],\"status-bar\":
    [\"screenshot-button\",\"fullscreen-button\",\"status-text\"]},\"seen\":
    [\"developer-button\",\"toggle-tabs-sidebar\"],\"dirtyAreaCache\":
    [\"nav-bar\",\"status-bar\",\"PersonalToolbar\",\"TabsToolbar\",
    \"toolbar-menubar\"],\"currentVersion\":20,\"newElementCount\":1}");

user_pref("apz.overscroll.enabled", true);
user_pref("apz.gtk.kinetic_scroll.enabled", true);
user_pref("general.smoothScroll.msdPhysics.enabled", true);
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS", 12);
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 600);
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant", 650);
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS", 25);
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio", "2");
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 250);
user_pref("general.smoothScroll.currentVelocityWeighting", "1");
user_pref("general.smoothScroll.stopDecelerationWeighting", "1");
user_pref("mousewheel.default.delta_multiplier_x", 500);
user_pref("mousewheel.default.delta_multiplier_y", 500);
user_pref("mousewheel.default.delta_multiplier_z", 500);

user_pref("layout.frame_rate", 0);
user_pref("browser.tabs.inTitlebar", true);
user_pref("browser.privatebrowsing.vpnpromourl", "");
user_pref("browser.vpn_promo.enabled", false);
user_pref("browser.warnOnQuit", false);
user_pref("browser.warnOnQuitShortcut", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("privacy.query_stripping.strip_on_share.enabled", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons",
    false);
user_pref(
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features",
    false);
user_pref("browser.preferences.moreFromMozilla", false);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.aboutwelcome.enabled", false);
user_pref("browser.compactmode.show", true);
user_pref("layout.css.prefers-color-scheme.content-override", 0);
user_pref("cookiebanners.service.mode", 2);
user_pref("cookiebanners.service.mode.privateBrowsing", 2);
user_pref("cookiebanners.service.enableGlobalRules", true);
user_pref("cookiebanners.service.enableGlobalRules.subFrames", true);
user_pref("browser.translations.enable", false);
user_pref("browser.translations.panelShown", false);
user_pref("browser.translations.autoTranslate", false);
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.warning.delay", -1);
user_pref("full-screen-api.warning.timeout", 0);
user_pref("browser.sessionstore.privacy_level", 0);
user_pref("gfx.webrender.quality.force-subpixel-aa-where-possible", true);
user_pref("browser.download.always_ask_before_handling_new_types", false);
user_pref("browser.startup.page", 0);
user_pref("browser.uitour.enabled", false);
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.toolbars.bookmarks.visibility", "never");
user_pref("extensions.pocket.enabled", false);
user_pref("browser.download.useDownloadDir", false);
user_pref("browser.menu.showViewImageInfo", true);
user_pref("findbar.highlightAll", true);
user_pref("accessibility.typeaheadfind.autostart", false);
user_pref("accessibility.typeaheadfind.manual", false);
user_pref("accessibility.typeaheadfind", false);
user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("layout.word_select.eat_space_to_next_word", false);
user_pref("ui.key.menuAccessKeyFocuses", false);
user_pref("ui.key.menuAccessKey", 0);
user_pref("image.jxl.enabled", true);
user_pref("browser.startup.blankWindow", true);
user_pref("browser.display.use_system_colors", false);
user_pref("browser.search.suggest.enabled", true);
user_pref("browser.urlbar.quicksuggest.enabled", true);
user_pref("browser.urlbar.showSearchSuggestionsFirst", true);
user_pref("browser.search.suggest.enabled.private", true);
user_pref("accessibility.force_disabled", 1);
user_pref("browser.preferences.experimental", true);
user_pref("browser.preferences.experimental.hidden", true);
user_pref("browser.uidensity", 1);
user_pref("browser.compactmode.show", true);
user_pref("browser.shopping.experience2023.active", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", true);
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
user_pref("browser.urlbar.quicksuggest.dataCollection.enabled", true);
user_pref("startup.homepage_welcome_url", "about:blank");
user_pref("browser.urlbar.weather.featureGate", true);
user_pref("browser.theme.toolbar-theme", 1);
user_pref("browser.sidebar.disabled", true);
user_pref("sidebar.verticalTabs", false);
user_pref("sidebar.visibility", "hide-sidebar");
user_pref("browser.contentblocking.fingerprinting.preferences.ui.enabled", false);

user_pref("browser.policies.applied", true);
user_pref("browser.urlbar.placeholderName", "GGL");
user_pref("browser.urlbar.placeholderName.private", "GGL");
user_pref("browser.policies.runOncePerModification.setDefaultSearchEngine",
    "Google");
user_pref("browser.policies.runOncePerModification.removeSearchEngines",
    ["Startpage","Bing","Mojeek","Yahoo!","DuckDuckGo","Qwant","Ecosia"]);
user_pref("browser.policies.runOncePerModification.extensionsInstall",
    ["https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi",
     "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi",
     "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi",]);
user_pref("browser.policies.runOncePerModification.extensionsUninstall",
    ["bing@search.waterfox.net","ddg@search.waterfox.net","ecosia@search.waterfox.net",
     "mojeek@search.waterfox.net","qwant@search.waterfox.net","startpage@search.waterfox.net",
     "yahoo@search.waterfox.net"]);

// Performance
user_pref("beacon.enabled", true);
user_pref("nglayout.initialpaint.delay", 1000);
user_pref("nglayout.initialpaint.delay_in_oopif", 1000);
user_pref("content.notify.interval", 100000);
user_pref("browser.newtab.preload", true);
user_pref("dom.iframe_lazy_loading.enabled", true);
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.precache-shaders", true);
user_pref("gfx.webrender.compositor", false);
user_pref("gfx.webrender.compositor.force-enabled", false);
user_pref("gfx.webrender.software", false);
user_pref("gfx.canvas.accelerated", true);
user_pref("gfx.canvas.accelerated.cache-items", 8192);
user_pref("gfx.canvas.accelerated.cache-size", 1024);
user_pref("gfx.content.skia-font-cache-size", 512);
user_pref("browser.cache.disk.capacity", 8388608);
user_pref("browser.cache.disk.max_entry_size", 262144);
user_pref("network.http.rcwn.enabled", true);
user_pref("network.http.rcwn.small_resource_size_kb", 512);
user_pref("browser.cache.disk.metadata_memory_limit", 8192);
user_pref("browser.cache.disk.preload_chunk_count", 16);
user_pref("browser.cache.disk.max_chunks_memory_usage", 65536);
user_pref("browser.cache.disk.max_priority_chunks_memory_usage", 65536);
user_pref("browser.cache.check_doc_frequency", 2);
user_pref("security.tls.enable_certificate_compression_brotli", true);
user_pref("security.tls.enable_certificate_compression_zstd", true);
user_pref("security.tls.enable_certificate_compression_zlib", true);
user_pref("browser.cache.jsbc_compression_level", 3);
user_pref("dom.script_loader.bytecode_cache.enabled", true);
user_pref("dom.script_loader.bytecode_cache.strategy", 0);
user_pref("browser.cache.memory.capacity", 4194304);
user_pref("browser.cache.memory.max_entry_size", 16384);
user_pref("media.cache_size", 1048576);
user_pref("media.memory_cache_max_size", 524588);
user_pref("media.cache_readahead_limit", 7200);
user_pref("media.cache_resume_threshold", 3600);
user_pref("image.mem.decode_bytes_at_a_time", 32768);
user_pref("media.gmp.decoder.multithreaded", true);
user_pref("media.gmp.decoder.preferred", true);
//user_pref("webgl.power-preference-override", 1);
user_pref("image.cache.size", 8388608);
user_pref("browser.preferences.defaultPerformanceSettings.enabled", false);
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.notify.checkForProxies", false);
user_pref("gfx.webrender.fallback.software", false);
user_pref("browser.cache.max_shutdown_io_lag", 16);
user_pref("gfx.x11-egl.force-disabled", true);
user_pref("gfx.x11-egl.force-enabled", false);
user_pref("fission.webContentIsolationStrategy", 2);
user_pref("dom.ipc.processCount.webIsolated", 1);
user_pref("dom.ipc.processCount", 8);
user_pref("fission.autostart", false);

// Proxy
user_pref("network.proxy.socks", "127.0.0.1");
user_pref("network.proxy.socks5_remote_dns", false);
user_pref("network.proxy.socks_port", 1080);
//user_pref("network.proxy.type", 1);

// Network
user_pref("network.buffer.cache.size", 262144);
user_pref("network.buffer.cache.count", 128);
user_pref("network.http.max-connections", 1024);
user_pref("network.http.max-persistent-connections-per-server", 64);
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 64);
user_pref("network.http.max-persistent-connections-per-proxy", 64);
user_pref("network.websocket.max-connections", 512);
user_pref("network.http.pacing.requests.enabled", false);
user_pref("network.dnsCacheEntries", 32768);
user_pref("network.dnsCacheExpiration", 3600);
user_pref("network.ssl_tokens_cache_capacity", 16384);
user_pref("network.http.speculative-parallel-limit", 64);
user_pref("network.dns.disablePrefetch", false);
user_pref("network.dns.disablePrefetchFromHTTPS", false);
user_pref("browser.urlbar.speculativeConnect.enabled", true);
user_pref("network.modulepreload", true);
user_pref("network.prefetch-next", true);
user_pref("network.fetchpriority.enabled", true);
user_pref("network.early-hints.enabled", true);
user_pref("network.early-hints.preconnect.enabled", true);
user_pref("network.early-hints.preconnect.max_connections", 64);
user_pref("network.predictor.enabled", true);
user_pref("network.predictor.enable-prefetch", true);
user_pref("network.predictor.enable-hover-on-ssl", true);
user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);
user_pref("dom.enable_web_task_scheduling", true);

// Security
user_pref("network.trr.uri", "https://cloudflare-dns.com/dns-query");
user_pref("network.trr.use_ohttp", false);
user_pref("network.trr.mode", 3);

user_pref("browser.contentblocking.category", "strict");
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.lower_network_priority", true);
user_pref("security.cert_pinning.enforcement_level", 2);
user_pref("fission.webContentIsolationStrategy", 1);
user_pref("network.cookie.sameSite.laxByDefault", true);
user_pref("network.cookie.sameSite.noneRequiresSecure", true);
user_pref("network.cookie.sameSite.schemeful", true);
user_pref("dom.battery.enabled", false);
user_pref("privacy.globalprivacycontrol.enabled", true);
user_pref("security.OCSP.enabled", 0);
user_pref("security.remote_settings.crlite_filters.enabled", true);
user_pref("security.pki.crlite_mode", 2);
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("browser.xul.error_pages.expert_bad_cert", true);
user_pref("security.tls.enable_0rtt_data", false);
user_pref("security.tls.enable_kyber", true);
user_pref("network.http.http3.enable_kyber", true);
user_pref("privacy.resistFingerprinting", false);
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);
user_pref("privacy.fingerprintingProtection", true);
user_pref("privacy.fingerprintingProtection.remoteOverrides.enabled", false)
user_pref("privacy.fingerprintingProtection.overrides",
    "+AllTargets,-CSSPrefersColorScheme,-CanvasImageExtractionPrompt,-CanvasExtractionBeforeUserInputIsBlocked");
user_pref("privacy.bounceTrackingProtection.mode", 1);
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("browser.privatebrowsing.resetPBM.enabled", true);
user_pref("privacy.history.custom", true);

user_pref("webgl.force-enabled", 0);
user_pref("webgl.disabled", true);
user_pref("webgl.disable-wgl", true);

user_pref("browser.urlbar.trimHttps", true);
user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);
user_pref("security.insecure_connection_text.enabled", true);
user_pref("security.insecure_connection_text.pbmode.enabled", true);
user_pref("browser.urlbar.update2.engineAliasRefresh", true);
user_pref("browser.formfill.enable", false);
user_pref("network.IDN_show_punycode", true);
user_pref("dom.security.https_first", true);
user_pref("dom.security.https_first_pbm", true);
user_pref("dom.security.https_first_schemeless", true);
user_pref("dom.security.https_only_mode", true);
user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);
user_pref("network.dns.echconfig.enabled", true);
user_pref("network.dns.http3_echconfig.enabled", true);
user_pref("signon.rememberSignons", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("security.mixed_content.block_display_content", true);
user_pref("privacy.userContext.ui.enabled", true);
user_pref("privacy.userContext.enabled", true);
user_pref("media.peerconnection.enabled", true);
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.geo", 2);
user_pref("permissions.default.microphone", 0);
user_pref("geo.provider.use_geoclue", false);
user_pref("browser.region.update.enabled", false);
user_pref("browser.region.network.url", "");
user_pref("datareporting.healthreport.uploadEnabled", true);
user_pref("network.http.referer.spoofSource", true);
user_pref("network.http.sendRefererHeader", 0);
