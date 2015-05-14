require "#{Rails.root.join('db')}/parse_collection_csv"
require "pp"

editor_adam = Utility::create_editor("Adam Hasler", "amhasler@gmail.com", "coltrane")

pp "=== Western Canon ==="
dir = Rails.root.join('db',  'seeds', 'western-canon')

western_canon_resources = ParseCollectionCSV::parse_resources(dir)
western_canon_collection = ParseCollectionCSV::parse_collection(editor_adam, western_canon_resources, dir)