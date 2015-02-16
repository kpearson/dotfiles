import sublime
import sys
import imp

reloader = 'library.reloader'
try:
    # ST3
    reloader = 'ERB Autocomplete.' + reloader
except (ImportError, ValueError):
    # ST2
    pass

if reloader in sys.modules:
    imp.reload(sys.modules[reloader])


try:
    # ST3
    from .library import reloader
    from .library.commands.mark import MarkCommentCommand
    from .library.commands.unmark import UnmarkCommentCommand
    from .library.commands.create_layout import CreateLayoutCommand
    from .library.commands.mapping import *
    from .library.commands.unmapping import UnmappingLayoutCommand
    from .library.events.listener import ERBAutocompleteListener
except (ImportError, ValueError):
    # ST2
    from library import reloader
    from library.commands.mark import MarkCommentCommand
    from library.commands.unmark import UnmarkCommentCommand
    from library.commands.create_layout import CreateLayoutCommand
    from library.commands.mapping import *
    from library.commands.unmapping import UnmappingLayoutCommand
    from library.events.listener import ERBAutocompleteListener
