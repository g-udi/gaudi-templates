# @Name: Default
# @List: caskList

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications";

export caskList=(

	## Internet Apps

  	"google-chrome::Google Chrome is a freeware web browser developed by Google https://www.google.com/intl/en_uk/chrome/"
	"tor-browser::The Tor (the onion routing) browser is a web browser designed for anonymous web surfing and protection against traffic analysis."
	
	## Security

	"1password::A password manager, digital vault, random password generator, form filler and secure digital wallet https://1password.com/"
	"cleanmymac::The ultimate cleaner for your Mac https://macpaw.com"
	"gpg-suite::Everything you need to get started with secure communication and encrypting files in one simple package"

	## Development

	"google-cloud-sdk::The Cloud SDK is a set of tools for Cloud Platform. It contains gcloud, gsutil, and bq, which you can use to access Google Compute Engine https://cloud.google.com/sdk/"
	"iterm2::iTerm2 is a replacement for Terminal and the successor to iTerm https://www.iterm2.com/"
	"hyper::A terminal built on web technologies https://hyper.is"
	"postman::Postman helps you be more efficient while working with APIs. Using Postman, you can construct complex HTTP requests quickly, organize them in collections,etc. https://www.getpostman.com/"
	"studio-3t::Studio 3T, the most powerful MongoDB GUI and IDE available https://studio3t.com/"
	"docker::Docker is an open platform for developers and sysadmins to build, ship, and run distributed applications, whether on laptops, data center VMs, or the cloud https://www.docker.com/"
	"dash::Dash is an API Documentation Browser and Code Snippet Manager. ... Store snippets of code; Easily reuse snippets; Expand snippets in any app https://kapeli.com/dash"
	"gitkraken::THE legendary Git GUI client https://www.gitkraken.com/"
	"openrefine::OpenRefine (formerly Google Refine) is a powerful tool for working with messy data: cleaning it; transforming it from one format into another http://openrefine.org/"
	"ngrok::ngrok provides a real-time web UI where you can introspect all HTTP traffic running over your tunnels https://ngrok.com/"
	"kitty::The fast, feature-rich, GPU based terminal emulator. Fast. Offloads rendering to the GPU for lower system load"

	## Design

	"figma::A better way to design. Design, prototype, and gather feedback all in one place with Figma https://figma.com/"
  
	## IDE and editors

	"jetbrains-toolbox::JetBrains Toolbox refers to the list of JetBrains desktop developer tools that are available under a monthly or yearly subscription plan"
	"visual-studio-code::Visual Studio Code is a source code editor developed by Microsoft for Windows, Linux and macOS. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring https://code.visualstudio.com/ "
	"rstudio::RStudio is an integrated development environment for R, a programming language for statistical computing and graphics"
	
	## Entertainment

	"spotify::Spotify is a digital music service that gives you access to millions of songs https://www.spotify.com/"
	"steam::Steam is a digital distribution platform for video games developed by Valve Corporation, which offers digital rights management, multiplayer servers, video streaming, and social networking services https://store.steampowered.com/"

	## Productivity
	
	"fantastical::Fantastical is the the powerful yet friendly! calendar and reminders app https://flexibits.com/"
	"raycast::Raycast is a blazingly fast, totally extendable launcher. It lets you complete tasks, calculate, share common links, and much more"
	"karabiner-elements::A powerful and stable keyboard customizer for macOS"
	"numi::Beautiful calculator for Mac that blends math with text. Currency, units, time zones, numeral systems, variables, export, notification widget"

	## Messaging and Communication

	"Slack::Fewer meetings, less internal email, all your tools integrated https://slack.com"
	"zoom::Zoom Delivers the Best Experience for the Best Price. Sign Up Free Today! Mobile Screen Sharing. HD Screen Sharing. Video Collaboration. Unbeatable Price. Superior Audio Quality. Easy To Use https://zoom.us/"
	"Telegram::Telegram is a freeware, cross-platform, cloud-based instant messaging service"
		
		## Office/Notes

		"microsoft-office::Microsoft Office is a family of client software offering MS Word, Excel, PowerPoint, etc. https://www.office.com"
		"zotero::Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share research. https://www.zotero.org/"
		"macdown::MacDown is an open source Markdown editor for macOS https://macdown.uranusjr.com/"
		"notion::Notion is a note-taking and collaboration application with markdown support that also integrates tasks, wikis, and databases. The company describes the app as an all-in-one workspace for note-taking, project management and task management https://www.notion.so/"
		"bibdesk::BibDesk is an open-source reference management software package for macOS, used to manage bibliographies and references when writing essays and articles. It can also be used to organize and maintain a library of documents in PDF format and other formats"
		"latexit:: LaTeXiT is A graphical interface above a LaTeX engine. However, its large set of features is a reason to see it as an editor"
		"mactex::MacTeX is a free redistribution of TeX Live, a typesetting environment based on TeX. While TeX Live is designed to be cross-platform, MacTeX includes Mac-specific utilities and front-ends"

		## Menu and Sidebar applications

	  	"bartender::Bartender 3 lets you organize your menu bar icons, by hiding them, rearranging them, show hidden items with a click or keyboard shortcut and have icons show when they update https://www.macbartender.com/"
  
	## Utilities
  
	"betterzip::BetterZip: the most advanced zip and rar archiver for file compression, encryption. BetterZip makes it easy to work with zip, rar, 7-zip, tar, and xz https://macitbetter.com/"
	"launchrocket::LaunchRocket. A Mac PreferencePane for managing services with launchd https://github.com/jimbojsb/launchrocket"
	"alfred::Alfred is a productivity application for Mac OS X, which boosts your efficiency with hotkeys, keywords and text expansion https://www.alfredapp.com/"
	"bettertouchtool::BetterTouchTool is a great, feature packed app that allows you to customize various input devices on your Mac https://folivora.ai/"
	"ubersicht::Übersicht lets you run system commands and display their output on your desktop in little containers http://tracesof.net/uebersicht/"
	"hazel::Hazel watches whatever folders you tell it to, automatically organizing your files according to the rules you create https://www.noodlesoft.com/"
	"setapp::Setapp membership gives you an all-access pass to curated Mac and iOS apps"
	"the-unarchiver::The Unarchiver is a proprietary freeware data decompression utility, which supports more formats than Archive Utility, the built-in archive unpacker program in macOS. It can also handle filenames in various character encodings, created using operating system versions that use those character encodings"
	"hammerspoon::This is a tool for powerful automation of macOS. At its core, Hammerspoon is just a bridge between the operating system and a Lua scripting engine. What gives Hammerspoon its power is a set of extensions that expose specific pieces of system functionality, to the user"
	"font-hack-nerd-font::Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs (icons)"
	
		## QuickLook plugins

		"qlcolorcode::Preview source code files with syntax highlighting https://github.com/anthonygelibert/QLColorCode"
		"qlimagesize::Display image size and resolution https://github.com/Nyx0uf/qlImageSize"
		"qlvideo::Preview most types of video files, as well as their thumbnails, cover art and metadata https://github.com/Marginal/QLVideo"
		"provisionql::Preview iOS / macOS app and provision information https://github.com/ealeksandrov/ProvisionQL"
		"qlmarkdown::Preview Markdown files https://github.com/toland/qlmarkdown"
		"qlstephen::Preview plain text files without or with unknown file extension. Example: README, CHANGELOG, index.styl, etc. https://github.com/whomwah/qlstephen"
		"quicklook-json::Preview JSON files http://www.sagtau.com/quicklookjson.html"
		"quicklook-csv::A QuickLook plugin for CSV files https://github.com/p2/quicklook-csv"
		"qlmobi::Quick Look plugin for Kindle ebook formats https://github.com/bfabiszewski/QLMobi"

)
