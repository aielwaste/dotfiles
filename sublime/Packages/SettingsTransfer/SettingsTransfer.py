import sublime
import sublime_plugin


class SettingsTransferCommand(sublime_plugin.WindowCommand):
    def run(self):
        ans = sublime.ok_cancel_dialog(
            "Do you really want to transfer the settings? "
            "(You cannot undo this operation.)"
        )
        if not ans:
            return
            
        # load the settings to transfer
        res = sublime.load_resource(
            "Packages/SublimeLinter/Preferences.sublime-settings")
        my_settings = sublime.decode_value(res)

        # transfer the settings to the user settings
        user_settings = sublime.load_settings("Preferences.sublime-settings")
        for k, v in my_settings.items():
            user_settings.set(k, v)

        # save the user settings
        sublime.save_settings("Preferences.sublime-settings")