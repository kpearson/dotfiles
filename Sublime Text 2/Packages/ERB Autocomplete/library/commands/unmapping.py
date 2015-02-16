import sublime, sublime_plugin;
import os;
try:
    # ST3
    from ..apis.core import Core
except (ImportError, ValueError):
    # ST2
    from apis.core import Core

class UnmappingLayoutCommand(sublime_plugin.WindowCommand):
    def run(self, *args, **kwargs):
        core = Core()
        path = self.window.active_view().file_name();

        if core.is_erb_file(path) is False:
            sublime.error_message('File is not ERB file.')
            return

        mapping_layout_file = path[:-3] + 'layout'
        if os.path.isfile(mapping_layout_file):
            os.remove(mapping_layout_file)
        else:
            sublime.error_message('We don\'t found your layout mapping file.')