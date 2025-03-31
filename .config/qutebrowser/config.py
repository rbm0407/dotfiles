config.load_autoconfig()
config.set('editor.command', ['ghostty', '-e', 'nvim', '{file}'])
config.set('colors.webpage.preferred_color_scheme', 'dark')

config.source('privacy.py')
