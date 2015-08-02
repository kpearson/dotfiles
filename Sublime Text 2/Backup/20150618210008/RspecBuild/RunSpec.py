import sublime
import sublime_plugin
exec_import = __import__("exec")

class RunSpec(exec_import.ExecCommand):
  def run(self, *args, **kwargs):        
    super(RunSpec, self).run(*args, **kwargs)  
    output_panel = self.window.get_output_panel("exec")
    self.window.focus_view(output_panel)
    