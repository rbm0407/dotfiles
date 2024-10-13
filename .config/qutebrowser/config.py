config.load_autoconfig()
config.set('editor.command', ['rio', '-e', 'nvim', '{file}'])
#config.set('colors.webpage.darkmode.enabled', True)

config.set('url.start_pages', ['about:blank'])

config.set(
    'url.searchengines',
    {'DEFAULT': 'https://search.brave.com/search?q={}'}
)
