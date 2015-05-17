import sublime, sublime_plugin
import re
try:
    # ST3
    from ..apis.core import Core
except (ImportError, ValueError):
    # ST2
    from apis.core import Core
class MarkCommentCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        # new core
        core = Core()
        target = '<%'
        # find target
        lines = core.get_lines_text(self.view)
        reg = re.search('<%(=|\s+)', lines)
        if(reg == None): return
        idx = reg.start()

        # get current select line
        sel = self.view.sel()
        region = sel[0]
        sel_line = self.view.line(region)
        start = sel_line.a + idx
        end = start + len(target)

        replace_region = sublime.Region(start, end)
        self.view.replace(edit, replace_region, '<%#')