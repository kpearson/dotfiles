"""Copyright (c) Borys Forytarz. All rights reserved"""

import sublime
import os
import sys

sys.path.append(os.path.abspath(os.path.dirname(__file__)))

st_ver = 2
if sublime.version() == '' or int(sublime.version()) >= 3000:
    st_ver = 3

try:
    from error_reporter import report_error
except ImportError:
    from .error_reporter import report_error

try:
    def plugin_loaded():
        try:
            try:
                from sublimerge.sublimerge_runtime import SublimergeRuntime
            except ImportError:
                from .sublimerge.sublimerge_runtime import SublimergeRuntime

            if st_ver == 3:
                try:
                    from sublimerge.sublimerge_st3 import st3_loader
                except ImportError:
                    from .sublimerge.sublimerge_st3 import st3_loader

                SublimergeRuntime.my_dir = st3_loader()
            else:
                SublimergeRuntime.my_dir = os.path.join(sublime.packages_path(), 'Sublimerge Pro')
        except:
            report_error()

    try:
        from sublimerge.sublimerge_commands import *
        from sublimerge.sublimerge_diff_commands import *
        from sublimerge.sublimerge_editor_commands import *
        from sublimerge.sublimerge_events_listener import SublimergeEventsListener

    except ImportError:
        from .sublimerge.sublimerge_commands import *
        from .sublimerge.sublimerge_diff_commands import *
        from .sublimerge.sublimerge_editor_commands import *
        from .sublimerge.sublimerge_events_listener import SublimergeEventsListener

    if st_ver == 2:
        plugin_loaded()
except:
    report_error()
