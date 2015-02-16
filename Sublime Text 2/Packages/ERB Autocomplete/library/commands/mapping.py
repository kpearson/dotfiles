import sublime, sublime_plugin;
import os;
try:
    # ST3
    from ..apis.core import Core
except (ImportError, ValueError):
    # ST2
    from apis.core import Core

class MappingLayoutCommand(sublime_plugin.WindowCommand):
    def run(self, *args, **kwargs):
        core = Core()
        self.layout_list = []
        path = self.window.active_view().file_name()
        if core.is_erb_file(path) is False:
            sublime.error_message('File is not ERB file.')
            return
        self.project_dir = core.get_project_path(path)
        self.view_dir = os.path.dirname(path);
        if self.project_dir is not None:
            for name in os.listdir(self.project_dir):
                if core.is_erb_layout_file(name) is False:
                    continue
                if os.path.isfile(os.path.join(self.project_dir, name)) :
                    self.layout_list.append([name, os.path.join(self.project_dir, name)])
            sublime.active_window().show_quick_panel(self.layout_list, self.on_mapping);
        else:
            sublime.error_message('We don\'t find your project folder. Please check your \'.base\' file.')

    def on_mapping(self, index):
        if index > -1:
            custom_layout = self.layout_list[index][0]
            filename = os.path.basename(self.window.active_view().file_name())
            mapping_layout_file = os.path.join(self.view_dir, filename[:-3] + 'layout')
            f = open(mapping_layout_file, "w")
            f.write(custom_layout)
            f.close()

class MappingPartialCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        core = Core()
        project_dir = self.view.file_name()
        partial_dir = core.get_partial_path(project_dir)
        self.partial_asset = os.path.relpath(partial_dir, os.path.dirname(project_dir))
        self.partial_list = []
        for name in os.listdir(partial_dir):
            if core.is_erb_layout_file(name) is False:
                    continue
            if os.path.isfile(os.path.join(partial_dir, name)):
                self.partial_list.append([name, os.path.join(partial_dir, name)])
        sublime.active_window().show_quick_panel(self.partial_list, self.on_mapping);

    def on_mapping(self, index):
        if index > -1:
            partial = self.partial_list[index][0][:-9]
            mapping = '<%= render :partial => "' + os.path.join(self.partial_asset, partial[1::]) + '" %>'
            self.view.run_command('insert', {'characters': mapping})