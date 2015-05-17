import sublime, sublime_plugin
import os
try:
    # ST3
    from ..apis.core import Core
except (ImportError, ValueError):
    # ST2
    from apis.core import Core

# Completion
class ERBAutocompleteListener(sublime_plugin.EventListener):
    def on_query_completions(self, view, prefix, locations):
        core = Core()
        self.completions = []
        specialkey = False
        scope = core.words.get('scope')
        temp = core.get_line_text(view)
        lineText = temp[-1]

        specialkey = True if lineText.find("<") >= 0 else False

        if scope and view.match_selector(locations[0], scope):
            self.completions += core.words.get('completions')
            self.completions += core.get_custom_tag()
        if not self.completions:
            return []

        completions = list(self.completions)
        if specialkey:
            for idx, item in enumerate(self.completions):
                self.completions[idx][1] = item[1][1:]

        completions = [tuple(attr) for attr in self.completions]
        return completions

    def on_load(self, view):
        filename = view.file_name()
        if not filename:
            return
        core = Core()
        name = os.path.basename(filename.lower())
        if name[-8:] == "html.erb" or name[-3:] == "erb":
            try:
                view.settings().set('syntax', core.get_grammar_path())
                print("Switched syntax to: ERB")
            except:
                pass
