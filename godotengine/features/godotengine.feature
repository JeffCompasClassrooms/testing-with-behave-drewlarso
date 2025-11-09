Feature: Godot Engine Website Testing
    As a game developer
    I want to be able view information about
    and download this game engine

    Scenario: User visits homepage
        Given I open the site "https://godotengine.org/"
        Given I have a screen that is 1920 by 1080 pixels
        Then I expect that the title is "Godot Engine - Free and open source 2D and 3D game engine"
        Then I expect that element ".hero h1" contains the text "game engine"
        Then I expect that element ".main-download" is visible

    Scenario: User clicks main download button
        Given I open the site "https://godotengine.org/"
        Given I have a screen that is 1920 by 1080 pixels
        When I click on the button ".download-title"
        Then I expect the url to contain "https://godotengine.org/download/"

    Scenario: User wants to download different versions of godot
        Given I have a screen that is 1920 by 1080 pixels
        Given I open the site "https://godotengine.org/download/macos"
        Then I expect that element ".btn-download" does exist
        Given I open the site "https://godotengine.org/download/android"
        Then I expect that element ".btn-download" does exist
        Given I open the site "https://godotengine.org/download/windows"
        Then I expect that element ".btn-download" does exist
        Given I open the site "https://godotengine.org/download/linux"
        Then I expect that element ".btn-download" does exist

    Scenario: User opens the features page
        Given I open the site "https://godotengine.org/"
        Given I have a screen that is 1920 by 1080 pixels
        When I click on the link "Features"
        Then I expect the url to contain "https://godotengine.org/features/"
        Then I expect that element ".showcase-items" is visible
        Then I expect that element "#features" does exist

    Scenario: User opens the showcase page
        Given I open the site "https://godotengine.org/"
        Given I have a screen that is 1920 by 1080 pixels
        When I click on the link "Showcase"
        Then I expect the url to contain "https://godotengine.org/showcase/"
        Then I expect that element ".showcase-cards" does exist
        Then I expect that element ".showcase-cards .showcase-card" does exist

    Scenario: User opens the blog page
        Given I open the site "https://godotengine.org/"
        Given I have a screen that is 1920 by 1080 pixels
        When I click on the link "Blog"
        Then I expect the url to contain "https://godotengine.org/blog/"
        Then I expect that element ".article-card" is visible
        When I click on the element "[title='Godot Engine - Blog - Page 3']"
        Then I expect the url to contain "https://godotengine.org/blog/3"
        Then I expect that element ".article-card" is visible

    Scenario: User opens the community page
        Given I open the site "https://godotengine.org/"
        Given I have a screen that is 1920 by 1080 pixels
        When I click on the link "Communities"
        Then I expect the url to contain "https://godotengine.org/community/"
        When I click on the element "#events"
        Then I expect the url to contain "https://godotengine.org/events/"
        Given I open the site "https://godotengine.org/community/"
        When I click on the element "#links"
        Then I expect the url to contain "https://links.godotengine.org/"

    Scenario: User opens the assets page
        Given I open the site "https://godotengine.org/"
        Given I have a screen that is 1920 by 1080 pixels
        When I click on the link "Assets"
        When I add "dialogic" to the inputfield "[placeholder='Search for...']"
        When I click on the button "[type='submit']"
        When I pause for 250ms
        Then I expect that element ".asset-header" is visible
        When I click on the element ".asset-header"
        Then I expect the url to contain "https://godotengine.org/asset-library/asset/"
        Then I expect that element ".media-heading" contains the text "Dialogic - Dialogue editor"

    Scenario: User opens the homepage on a mobile device
        Given I open the site "https://godotengine.org/"
        Given I have a screen that is 500 by 700 pixels
        Then I expect that element "#nav_toggle_btn" is visible
        Then I expect that element ".language-selector" is not visible
        When I click on the button "#nav_toggle_btn"
        Then I expect that element ".language-selector" is visible

    Scenario: User changes the language on the homepage
        Given I open the site "https://godotengine.org/"
        Given I have a screen that is 1920 by 1080 pixels
        When I click on the button ".language-selector"
        When I click on the button "[data-lang='de']"
        When I pause for 500ms
        Then I expect that element ".hero h1" contains the text "Deine kostenlose"

