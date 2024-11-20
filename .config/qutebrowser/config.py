config.load_autoconfig()
config.set('editor.command', ['kitty', '-e', 'nvim', '{file}'])
# config.set('colors.webpage.darkmode.enabled', True)

config.source('privacy.py')
