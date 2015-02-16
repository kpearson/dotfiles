# ERB Autocomplete

The package to help use erb template user that easy and quick to finish the ERB tag.
***

## How to install


With [Package Control](http://wbond.net/sublime_packages/package_control):

1. Run "Package Control: Install Package" command, find and install `ERBAutocomplete` package.
2. Restart your sublime text editor.


Manually:

1. Clone or [download](https://github.com/CasperLaiTW/ERBAutocomplete/archive/master.zip "download") git repo into your Sublime Text packages folder.

  ```
  git clone https://github.com/CasperLaiTW/ERBAutocomplete.git "ERB Autocomplete"
  ```
2. Restart your sublime text editor.

*We are support ST2 and ST3 now.*

## *.base* file
The `.base` file is project root, its include `ERB Autocomplete` package's configuration.
```json
{
    "partials" : "partials"
}
```
We suggest you create this file. If you don't want, it's ok. We will use default setting.

## Auto complete
You would set syntax to **ERB**.

And you can:

Manually:

1. Type ERB keyword like **if**, **else** or nothing.
2. Press `Command` + `space`, will activate completion. ST would popup to tip you and select you want.

Automatic completion:

1. Open your user settings file.
2. Add `text.html.erb` to `auto_complete_selector`, you should according to your settings to set.

  This is example.
  ```json
  "auto_complete_selector" : "text.html.erb, source - comment, meta.tag - punctuation.definition.tag.begin"
  ```
3. Reset your Sublime Text editor.
4. And now you type **if**, **else**, the editor will automatic activate completion.


## Create layout
We support quick to create layout file. You can Press `Ctrl` + `Alt` + `l`, Sublime Text will show input panel to you and type your custom layout filename. We will create the file in your project.

If you press keyboard shortcut, Sublime Text would only create new file and show. Sublime text don't show input panel. That's means you don't open any file window and active in your project. So you should open any file window in your project. It will be working.

If your project is not root, means your project's parent have any folder. Please create a file named `.base` in your project. We will detect the file and means this is your project root. Layout will created in this folder.


### Manage page and layout mapping
#### Mapping layout
1. Open you want to mapping view.
2. Run command `ERB: Add Layout Mapping`
2. Sublime Text will show all layout in your project.
3. Select layout you want.
4. Done!!!

#### Unmapping layout
1. Open you want to unmapping view.
2. Run command `ERB: Remove Layout Mapping`
3. Auto delete mapping file. Done!!!

#### Added partials
*Partial view default folder name: `partials`*

1. Open your file and cursor to you want to added.
2. Run command `ERB: ERB: Add Partial Mapping`
3. Sublime Text will show all partial views in project's partial folder.
4. Select partial view you want.
5. Done!!!

## Avaiable actions
OSX:

* Mark comment – <kbd>Command+.</kbd>
* Unmark comment – <kbd>Command+,</kbd>
* Create custom layout file - <kbd>Command+Alt+l</kbd>

Linux / Windows:

* Mark comment – <kbd>Ctrl+.</kbd>
* Unmark comment – <kbd>Ctrl+,</kbd>
* Create custom layout file - <kbd>Ctrl+Alt+l</kbd>




