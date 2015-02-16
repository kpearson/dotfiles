# The original source from @wbond's resource loader.
import sublime
import sys
import imp

mod_prefix = "library"
reload_mods = []

try:
    # ST3
    mod_prefix = "ERB Autocomplete." + mod_prefix
except (ImportError, ValueError):
    # ST2
    pass

for mod in sys.modules:
    if mod[0:16].lower().replace(' ', '_') == 'erb_autocomplete' and sys.modules[mod] != None:
        reload_mods.append(mod)

mods_load_order = [
    '.apis',
    '.apis.core',

    '.commands',
    '.commands.mark',
    '.commands.unmark',
    '.commands.create_layout',
    '.commands.mapping',
    '.commands.unmapping',

    '.events',
    '.events.listener'

]

for mod in mods_load_order:
    mod = mod_prefix + mod
    if mod in reload_mods:
        imp.reload(sys.modules[mod])

