from sublime import packages_path
import sublime_plugin
import os.path as p
  
class CheatSheetRailsCommand(sublime_plugin.WindowCommand):  
    def run(self, filename):  
    	print packages_path()
        self.window.open_file(p.join(packages_path(), "Cheatsheets Rails/cheatsheets/"+filename))
