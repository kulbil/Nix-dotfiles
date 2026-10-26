# firefox.nix
{ firefox-addons, pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    nativeMessagingHosts = [ pkgs.keepassxc ];

    policies = {
      DisableTelemetry = true;

      UserMessaging = {
        SkipOnboarding = true;
      };
    };

    profiles.default = {
      id = 0;
      isDefault = true;

      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";
      };

      extensions = {
        packages = with firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
          keepassxc-browser
        ];
      };


      settings = {
        # ── Home page ──
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;
        "browser.newtabpage.activity-stream.system.showWeather" = false;
        # "Support Firefox" master toggle + its children
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;   # sponsored stories

        # Required so declaratively installed extensions enable themselves
        "extensions.autoDisableScopes" = 0;

        # ── Bookmarks bar / vertical tabs ──
        "browser.toolbars.bookmarks.visibility" = "never";
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;

        # ── Toolbar layout ──
        "browser.uiCustomization.state" = builtins.toJSON {
          placements.nav-bar = [
            "sidebar-button"
            "back-button"
            "forward-button"
            "stop-reload-button"
            "customizableui-special-spring1"
            "urlbar-container"
            "customizableui-special-spring2"
            "downloads-button"
            "unified-extensions-button"
          ];
          dirtyAreaCache = [ "nav-bar" ];
          currentVersion = 21;
        };

        # ── Passwords, payments, Relay ──
        "signon.rememberSignons" = false;                      # ask to save passwords
        "extensions.formautofill.creditCards.enabled" = false; # save/autofill payment methods
        "signon.firefoxRelay.feature" = "disabled";            # suggest Relay email masks

        # ── On-device AI: everything off except the sidebar chatbot ──
        "browser.ai.control.default" = "blocked";
        "browser.ai.control.sidebarChatbot" = "available";     # exception: chatbot stays
        "browser.ai.control.translations" = "blocked";
        "browser.ai.control.pdfjsAltText" = "blocked";
        "browser.ai.control.smartTabGroups" = "blocked";
        "browser.ai.control.linkPreviewKeyPoints" = "blocked";
        "browser.ai.control.smartWindow" = "blocked";
        "extensions.ml.enabled" = false;
        "browser.ml.enable" = false;
        "browser.ml.linkPreview.enabled" = false;
        "browser.tabs.groups.smart.enabled" = false;
        "browser.tabs.groups.smart.userEnabled" = false;
        "browser.translations.enable" = false;
        "pdfjs.enableAltText" = false;
        "places.semanticHistory.featureGate" = false;
        "browser.urlbar.quicksuggest.mlEnabled" = false;
        "browser.ml.chat.enabled" = true;                      # keep chatbot working
        "browser.ml.chat.sidebar" = true;

        # ── Data collection ──
        "datareporting.healthreport.uploadEnabled" = false;    # technical and interaction data
        "nimbus.rollouts.enabled" = false;                     # "improve features... between updates"
        "datareporting.usage.uploadEnabled" = false;           # daily usage ping

        # ── Recommendations ──
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;   # extensions
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false; # features

        # ── Onboarding ──
        "browser.aboutwelcome.enabled" = false;                  # the welcome page itself
        "startup.homepage_welcome_url" = "";                     # first-run URL
        "startup.homepage_welcome_url.additional" = "";
        "browser.startup.homepage_override.mstone" = "ignore";   # "What's New" page after updates
      };
    };
  };
}
