# Web Accessibility

# Resources
- course/source: https://learn-a11y.netlify.app/
- html/css examples: https://van11y.net/downloads/modal-tooltip/demo/index.html

# General
- use Tools for Testing (Screen Readers, Browser Extensions, Linters)
- use semantic html tags
- use alt-text, label and ARIA properties
- use css for direct communication
- use skip-links and tab-trapping
- use shortcuts for powerusers & accessibility

# Tooling / Testing

## General accessibility
- check for syntax errors - finding them obv. helps with accessibility
- w3c markup checker (html): https://validator.w3.org/

- axe DevTools (Chrome Extension)

## Color Contrast and Visual Impairment
- Web AIM: https://webaim.org/resources/contrastchecker/

- Chrome Dev Tools

- NoCoffee for Mozilla Firefox

## Screen Reader

### MacOS
- System Preferences
- Accessibility
- VoiceOver
- Enable VoiceOver
- cmd + f5

### Windows
- install 3rd Party: NVDA

### Google Chrome
- built-in that can be added via Plugin/extension

# Accessible Code

## Tags
- just by using 'proper' html-tags websites will be quite accessible
- be careful with using plain < divs >
- use headers in correct hierarchical order (h1 > h2 > h3) - resizing is compl. ok
- these tags have semantic (accessible) meanings

| html-tag | |
| :-------------- | :----------- |
| ` <h1> ` |
| ` <button> ` |
| ` <input>  ` |
| ` <textarea> ` |

## Labels
- there are two ways to label html tags for accessibility
- Screen Readers will read the label when corresp. input is focused:

```
<form>
    <label for="first">First Name</label>
    <input id="first" type="text" />
    <label for="last">Last Name</label>
    <input id="last" type="text" />
    <label for="password">Password</label>
    <input id="password" type="password" />
    <input type="submit" value="Submit" />
</form>
```
- or like this:
```
<form>
    <label>
      First Name
      <input id="first" type="text" />
    </label>
    <label>
      Last Name
      <input id="last" type="text" />
    </label>
    <label>
      Password
      <input id="password" type="password" />
    </label>
    <input type="submit" value="Submit" />
</form>
```
- only these tags can be labeled:

| html-tag | |
| :-------------- | :----------- |
| ` <button> ` |
| ` <input>  ` |
| ` <textarea> ` |
| ` <keygen> ` |
| ` <meter> ` |
| ` <output> ` |
| ` <progress> ` |
| ` <select> ` |

## Alternative Text ( `<img>` )
- by default Screen Readers read file name
- alternative text will override that behaviour
- explicit empty alt-text will skip image
- SEO (Search Engine Optimisation) also make use of alt-text

## CSS
- with the help of CSS, content can be visually hidden but be seen by Screen Readers
- for example a popup that explains hotkeys, accessibility features

```
.visuallyhidden {
    position: absolute;
    left: 0;
    top: -500px;
    width: 1px;
    height: 1px;
    overflow: hidden;
}
```
## ARIA

## Tabbing
- pro tip (single-page-app): save current focus / active element in a var!
- tabindex attribute can be used for making elements (un-)tabbable (values: -1, 0, 1)
- https://github.com/jkup/focusable (query for all tabbable elements)
- tabbable html-tags by default

| html-tag | |
| :-------------- | :----------- |
| ` <a> ` |
| ` <button> ` |
| ` <input> ` |
| ` <select> ` |
| ` <textarea> ` |
| ` <iframe> ` |

### Tab Trapping
- this concept is being used for pop-up windows so the tab is "trapped" in that window
- take first element and last element of that new window...
- ... check for each tab or shift-tab if the active element is still inside that range
- ... if not return to nearest end (either first or last element of window)

### Skip Links
- imagine a nav bar, and you dont want users to tab through all elements each time
- on first tab, offer them a ` skip to content ` button to skip the navbar

### quick search (just like github, ctrl+k)
- to quickly navigate to most used access points

## Keyboard Shortcuts
- setup keyboard shortcuts and some kind of explanation (popup window / settings)
- shortcuts should make the whole page usable

### Prefers Reduced Motion / Preferred Color Theme
- Users can set that option in their OS, we can read the state in CSS

```
.animation {
    animation: pulse 1s linear infinite both;
}

@media (prefers-reduced-motion) {
    .animation {
        animation-name: dissolve;
    }
}
```
- Same goes for preferred color theme

```
@media (prefers-color-scheme: dark) {
    .wrapper {
        background: black;
    }
}

@media (prefers-color-scheme: light) {
    .wrapper {
        background: white;
    }
}
```
