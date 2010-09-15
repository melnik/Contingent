require 'data/classifier'

( classifier = Classifier[get_values['classifier']].new ).select get_values['selected_id']

tmpl = template 'widgets/classifier/coded_popup', classifier

tmpl.display_empty = true

print tmpl.render
