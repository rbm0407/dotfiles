config.load_autoconfig()
config.set('editor.command', ['foot', '-e', 'nvim', '{file}'])
config.set('colors.webpage.preferred_color_scheme', 'dark')

config.source('privacy.py')
