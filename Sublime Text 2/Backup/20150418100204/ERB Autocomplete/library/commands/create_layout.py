import sublime, sublime_plugin;
import os;
try:
    # ST3
    from ..apis.core import Core
except (ImportError, ValueError):
    # ST2
    from apis.core import Core

class CreateLayoutCommand(sublime_plugin.TextCommand):
    project_dir = None
    def run(self, edit):
        core = Core()
        path = self.view.file_name();
        self.project_dir = core.get_project_path(path)
        if self.project_dir is not None:
            self.view.window().show_input_panel('Enter layout filename.', '_custom_layout.html.erb', self.on_done, None, None)
        else:
            sublime.active_window().new_file()

    def on_done(self, text):
        file_path = os.path.join(self.project_dir, text)
        f = open(file_path, 'w+')
        f.close()
        sublime.active_window().open_file(file_path)
